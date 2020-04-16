package top.lyxwachs.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Random;

import org.apache.commons.lang3.StringEscapeUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import top.lyxwachs.bean.BlogCategory;
import top.lyxwachs.bean.BlogFriendlyLinks;
import top.lyxwachs.bean.BlogTag;
import top.lyxwachs.bean.BlogWithBLOBs;
import top.lyxwachs.dao.BlogCategoryMapper;
import top.lyxwachs.dao.BlogFriendlyLinksMapper;
import top.lyxwachs.dao.BlogMapper;
import top.lyxwachs.dao.BlogTagMapper;

@Service
public class BlogService {
	@Autowired
	private BlogMapper blogMapper;
	@Autowired
	private BlogTagMapper blogTagMapper;
	@Autowired
	private BlogCategoryMapper blogCategoryMapper;
	@Autowired
	private JedisPool jedisPool;
	@Autowired
	BlogFriendlyLinksMapper blogFriendlyLinksMapper;
	
	/**
	 * 查询list
	 * @param keywords 
	 * @param pageSize 
	 * @param pageNum 
	 * @return
	 */
	public PageInfo<BlogWithBLOBs> findBlogList(String keywords, Integer pageNum, Integer pageSize) {
		PageHelper.startPage(pageNum, pageSize); //使用分页插件
		List<BlogWithBLOBs> list = blogMapper.findBlogList(keywords);
		
		PageInfo<BlogWithBLOBs> infos=new PageInfo<BlogWithBLOBs>(list,10); 
		List<BlogWithBLOBs> blogList = infos.getList(); 

		//long total = infos.getTotal();//总页数
		
//		截取字符串显示
		for (BlogWithBLOBs blog : blogList) {
			Date bCreatedate = blog.getbCreatedate();
			String createdate=format_date(bCreatedate,"yyyy-MM-dd HH:mm:ss");//格式化日期
			blog.setCreateDate(createdate);
			
			String contenttext = blog.getbContenttext();
			contenttext=contenttext.replaceAll("[\\s\\t\\n\\r]", "");//替换掉所有的空格回车换行符
			
			if(contenttext==null) {
				break;
			}
			if(contenttext.length()>66) {
				String bContenttext = contenttext.substring(0,66);
				blog.setbContenttext(bContenttext);
			}
		}
		return infos;
		//return blogMapper.findBlogList();
	}
	
	/**
	 * 保存博客，返回1：保存成功。0，失败
	 * @param b_content_text 
	 * @param b_content 
	 * @param b_title 
	 * @param b_id 
	 * @param blog
	 * @param arr_category 
	 * @param arr_tag_name 
	 * @return
	 */
	public String saveBlog(Integer bAuthor,String b_id, String b_title, String b_content, String b_content_text, String[] arr_tag_name, String[] arr_category) {
		JSONObject json=new JSONObject();
		
		//保存博客内容
		int i =0;
		Integer bId =null;
		BlogWithBLOBs blog=new BlogWithBLOBs();
		if(StringUtils.isBlank(b_id)) {//添加
			Integer b_author=bAuthor;//张三登录人
			blog.setbAuthor(b_author);
			blog.setbContent(b_content);//保持博客中的html
			Date b_createdate= new Date();//创建时间
			blog.setbCreatedate(b_createdate);
			blog.setbCreateupdate(b_createdate);
			blog.setbTitle(b_title);
			blog.setbContenttext(b_content_text);//保存博客中的纯文本内容text
			blog.setbVisitors(1);
			blog.setbDiscuss(0);
			blog.setbLive(1);
			i = blogMapper.insertSelective(blog);
			
			bId = blog.getbId();//刚插入的获取id

			//标签
			//组装成list集合，使用mybatis批量插入。
			List<BlogTag> list_tag=new ArrayList<BlogTag>();
			if(arr_tag_name.length!=0) {
				BlogTag blogTag=null;
				for (String _tag_name : arr_tag_name) {
					if (StringUtils.isNotBlank(_tag_name)) {
						blogTag=new BlogTag();
						blogTag.setbId(bId);
						blogTag.setTagName(_tag_name);
//						blogTag.setTagNumber(1);//该标签数，查询 where teg=""
						blogTag.setTagNumber(getTagsTotal(_tag_name)+1);//该标签数，查询 where teg=""
						list_tag.add(blogTag);
					}
				}
			}
			
			
			//专栏
			//组装成list集合，使用mybatis批量插入。
			List<BlogCategory> list_category=new ArrayList<BlogCategory>();
			if(arr_category.length!=0) {
				BlogCategory blogCategory=null;
				for (String category : arr_category) {
					if (StringUtils.isNotBlank(category)) {
						blogCategory=new BlogCategory();
						blogCategory.setbId(bId);
						blogCategory.setCategoryName(category);
						blogCategory.setCategoryNumber(1);//专栏数，查询 where catery=""
						blogCategory.setcLive((byte)1);
						blogCategory.setuId(bAuthor);
						list_category.add(blogCategory);
					}
				}
			}
			
			if(list_tag.size()!=0 && list_tag!=null) {
				blogTagMapper.insertBatchTag(list_tag);
			}
			if(list_category.size()!=0 && list_category!=null) {
				blogCategoryMapper.insertBatchCategory(list_category); 
			}
			
			

			
		}else {//编辑修改
			
			bId = Integer.parseInt(b_id);//根据bid修改
			//博客内容
			blog.setbContent(b_content);//保持博客中的html
			blog.setbContenttext(b_content_text);//保存博客中的纯文本内容text
			blog.setbCreateupdate(new Date());//修改的时间
			blog.setbTitle(b_title);//标题
			blog.setbId(bId);
			i = blogMapper.updateByPrimaryKeySelective(blog);
			
			//标签,先删除，后插入
			blogTagMapper.deleteTagsByBid(bId);
			
			List<BlogTag> list_tag=new ArrayList<BlogTag>();
			if(arr_tag_name.length!=0) {
				BlogTag blogTag=null;
				
				for (String _tag_name : arr_tag_name) {
					if (StringUtils.isNotBlank(_tag_name)) {
						blogTag=new BlogTag();
						blogTag.setbId(bId);
						blogTag.setTagName(_tag_name);
						blogTag.setTagNumber(getTagsTotal(_tag_name)+1);//该标签数，查询 where teg=""
						list_tag.add(blogTag);
					}
				}
			}
			
			if(list_tag.size()!=0 && list_tag!=null) {
				blogTagMapper.insertBatchTag(list_tag);
			}
			
			
			
			//分类栏---先删除（假删除，把c_live设为1，不能真删除，因为页面下面的div框需要用到），后插入
			//删除
			blogCategoryMapper.updateLiveByCategoryBId(bId,(byte)0,bAuthor);
			
			//添加
			List<BlogCategory> list_category=new ArrayList<BlogCategory>();
			if(arr_category.length!=0) {
				BlogCategory blogCategory=null;
				for (String category : arr_category) {
					if (StringUtils.isNotBlank(category)) {
						blogCategory=new BlogCategory();
						blogCategory.setbId(bId);
						blogCategory.setCategoryName(category);
						blogCategory.setCategoryNumber(1);//专栏数，查询 where catery=""
						blogCategory.setcLive((byte)1);
						blogCategory.setuId(bAuthor);
						list_category.add(blogCategory);
					}
				}
			}
			if(list_category.size()!=0 && list_category!=null) {
				blogCategoryMapper.insertBatchCategory(list_category); 
			}
			
		}
		
		
		if(i==1) {
			json.put("flag",1);
			json.put("b_id", bId);
		}else {
			json.put("flag",0);
		}
		

		return json.toString();
	}
	

	
	/**
	 * 根据id 查询blog
	 * @param b_id
	 * @return
	 */
	public BlogWithBLOBs getBlog(String b_id) {
		if(!StringUtils.isBlank(b_id)) {
			BlogWithBLOBs blog = blogMapper.selectByPrimaryKey(Integer.parseInt(b_id));
			if(StringUtils.isBlank(blog.getbContent())) {
				return blog;
			}else {
				String html4 = StringEscapeUtils.escapeHtml4(blog.getbContent());
			//	String html4 = StringEscapeUtils.unescapeHtml4(blog.getbContent());
				blog.setbContent(html4);
				
				//格式化日期
				Date bCreatedate = blog.getbCreatedate();
				String createdate=format_date(bCreatedate,"yyyy-MM-dd HH:mm:ss");
				blog.setCreateDate(createdate);
				
				return blog;
			}

		}
		return null;
	}
	
	
	/**
	 * 格式化日期为固定格式,变字符串形式
	 * @param date
	 * @return
	 */
	public String format_date(Date date,String format) {
		SimpleDateFormat sdf = new SimpleDateFormat(format);//设置时间格式
		return sdf.format(date);//对当前时间进行格式化
	}
	
	/**
	 * 根据b_id删除博客
	 * @param b_id
	 * @return
	 */
	public String delBlog(String b_id) {
		JSONObject json=new JSONObject();
		BlogWithBLOBs blog=new BlogWithBLOBs();
		blog.setbLive(0);//设置0，删除。
		blog.setbId(Integer.parseInt(b_id));
		int i = blogMapper.updateByPrimaryKeySelective(blog);
		if(i==1) {
			json.put("flag", 1);
		}else {
			json.put("flag", 0);
		}
		return json.toString();
	}
	
	/**
	 * 根据博客id 查询 博客标签列表
	 * @param b_id
	 * @return
	 */
	public List<BlogTag> getTagsList(int b_id) {
		return blogTagMapper.getTagsList(b_id);
	}
	
	

	
	/**
	 * 查询名字相同的标签的总数量
	 * @param b_id
	 * @return
	 */
	public Integer getTagsTotal(String tagName) {
		Integer total = blogTagMapper.getTagsTotal(tagName);
		return total;
	}
	
	/**
	 *  查询 博客分类专栏列表
	 * @param b_id
	 * @return
	 */
	public List<BlogCategory> getCategorysList(int b_id) {
		return blogCategoryMapper.getCategorysList(b_id);
	}
	
	/**
	 * 查询该用户所拥有的专类栏-放到div，组建checkbox放到div下面()-------------修改的时候
	 * @param user_id
	 * @param b_id 
	 * @return
	 */
	public String getategorysListOfUser(Integer user_id, int b_id) {
		StringBuilder sb=new StringBuilder();
		List<BlogCategory> list = blogCategoryMapper.getategorysListOfUser(user_id);
		List<BlogCategory> categorysList = blogCategoryMapper.getCategorysList(b_id);
		if(categorysList.isEmpty()) {//如果没有选中的分类栏目
			for (BlogCategory blogCategory : categorysList) {
				long num=(int)(Math.random()*10001);//随机数0-10000
				String random_id = new Date().getTime()+""+num;
				sb.append("<label class='checkbox-inline'><input type='checkbox' id="+random_id+" value='"+blogCategory.getCategoryName()+"'  onclick='add_category_checkbox(this)'>"+blogCategory.getCategoryName()+"</label>");	
			}
		}else {//如果存在选中的分类栏目
//			选中的
			for (BlogCategory blogCategoryAll : list) {
				for (BlogCategory blogCategory : categorysList) {
					if(blogCategory.getCategoryName().equals(blogCategoryAll.getCategoryName())) {
						//相等，还要获取id.
						sb.append("<label class='checkbox-inline'><input type='checkbox' id="+blogCategory.getCategoryId()+" checked value='"+blogCategoryAll.getCategoryName()+"' checked onclick='add_category_checkbox(this)'>"+blogCategoryAll.getCategoryName()+"</label>");	
						break;
					}
				}
			}
//			未中的
			list.removeAll(categorysList);
			for (BlogCategory blogCategory : list) {
				long num=(int)(Math.random()*10001);//随机数0-10000
				String random_id = new Date().getTime()+""+num;
				sb.append("<label class='checkbox-inline'><input type='checkbox' id="+random_id+" value='"+blogCategory.getCategoryName()+"'  onclick='add_category_checkbox(this)'>"+blogCategory.getCategoryName()+"</label>");	
			}
		}
		return sb.toString();
	}
	
	
	
	/**
	 * 查询该用户所拥有的专类栏-放到div，组建checkbox放到div下面()-------------添加的时候
	 * @param user_id
	 * @return
	 */
	public String getategorysListOfUser(Integer user_id) {
		StringBuilder sb=new StringBuilder();
		List<BlogCategory> list = blogCategoryMapper.getategorysListOfUser(user_id);
//		未中的
		for (BlogCategory blogCategory : list) {
			long num=(int)(Math.random()*10001);//随机数0-10000
			String random_id = new Date().getTime()+""+num;
			sb.append("<label class='checkbox-inline'><input type='checkbox' id="+random_id+" value='"+blogCategory.getCategoryName()+"'  onclick='add_category_checkbox(this)'>"+blogCategory.getCategoryName()+"</label>");	
		}
		return sb.toString();
	}

	
	
	public ModelAndView getBlogDesc(String b_id, String ipAddr,Integer userId, ModelAndView mv) {
//		JSONObject json=new JSONObject();
		BlogWithBLOBs blog = getBlog(b_id);
//		查询标签，分类栏，博客内容，友情链接，热门文章,最新文章，归档。
		int bId = Integer.parseInt(b_id);
//		修改blog中的浏览文章数量
//		从池中获取redis对象									
		Jedis jedis = jedisPool.getResource();
		try {
//			先查看redis中是否有ip地址，如果有表示在一定的时间内重复刷新了，所以数量不执行。如果没有，就不一样，存进redis。并且数量+1
			if(!jedis.exists(ipAddr)) {//不存在
				Integer count = blog.getbVisitors()+1;
				blog.setbVisitors(count);
				int i = blogMapper.updateVisitorsCountByBid(count,bId);//更新数据库
				if(i==1) {
					System.out.println(String.valueOf(count));
					jedis.set(ipAddr,String.valueOf(count));//存到redis
					jedis.expire(ipAddr, 60);//设置60秒过期
				}
			}
		}catch(Exception e) {
			e.getStackTrace();
		}finally {
			jedis.close();
			//jedisPool.close();
		}
		
		
//		友情链接
		List<BlogFriendlyLinks> bfls=blogFriendlyLinksMapper.selectFlListByUid(userId);
//		json.put("bls",bls);
		mv.addObject("bfls", bfls);
//		标签
		List<BlogTag> tagList=blogTagMapper.getTagsList(bId);//当前文章的标签
//		json.put("tagList",tagList);
		mv.addObject("tagList", tagList);
//		文章分类专栏
		List<BlogCategory> categoryList= blogCategoryMapper.getCategorysList(bId);//当前文章的分类栏
//		json.put("categoryList",categoryList);
		mv.addObject("categoryList", categoryList);
		
		//该用户的所有分类专栏
		List<BlogCategory> listCategoryOfUser = blogCategoryMapper.getGategorysList(userId,(byte)1);
		mv.addObject("listCategoryOfUser", listCategoryOfUser);
		
		//热门文章--查询该用户阅读量最高的10遍文章 page=10
		List<BlogWithBLOBs> hotBlogList=blogMapper.getHotBlogList(userId,6);
		mv.addObject("hotBlogList", hotBlogList);
		
		//最新文章--最新日期发布的10篇文章 page=10
		List<BlogWithBLOBs> newBlogList=blogMapper.getNewBlogList(userId,6);
		mv.addObject("newBlogList", newBlogList);
		
//		归档--按月：2020-12  10篇。该用户
		

//		json.put("blog",blog);
		mv.addObject("blog", blog);

		
		return mv;
	}
	
	
	

}
