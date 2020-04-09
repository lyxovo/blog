package top.lyxwachs.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import top.lyxwachs.bean.BlogCategory;
import top.lyxwachs.bean.BlogTag;
import top.lyxwachs.bean.BlogWithBLOBs;
import top.lyxwachs.dao.BlogCategoryMapper;
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
	
	
	
//	  public List<Userinfo> selectUserinfo() {
//	 	  PageHelper.startPage(2, 3); //使用分页插件
//		  List<Userinfo> userinfos =studentMapper.selectUserinfo();
//		  PageInfo<Userinfo> infos=new PageInfo<Userinfo>(userinfos); 
//		  List<Userinfo> list = infos.getList(); 
//		  return userinfos; 
//	  }
	
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
			blog.setbVisitors(0);
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
			
			
			//分类栏
			
			
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
		if(b_id!=null) {
			BlogWithBLOBs blog = blogMapper.selectByPrimaryKey(Integer.parseInt(b_id));
			return blog;
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
	 * 查询该用户所拥有的专类栏
	 * @param user_id
	 * @param b_id 
	 * @return
	 */
	public List<BlogCategory> getategorysListOfUser(Integer user_id, int b_id) {
		StringBuilder sb=new StringBuilder();
		List<BlogCategory> list = blogCategoryMapper.getategorysListOfUser(user_id);
		for (BlogCategory blogCategoryAll : list) {
			
			List<BlogCategory> categorysList = blogCategoryMapper.getCategorysList(b_id);
			for (BlogCategory blogCategory : categorysList) {
				if(blogCategory.getCategoryName().equals(blogCategoryAll.getCategoryName())) {
					//相等，还要获取id.
					//String str=	"<label class='checkbox-inline'><input type='checkbox' checked value='' checked onclick='add_category_checkbox(this)'>月底</label>";
					//sb.append(str);	
					
				}else {//不相等。
					//String str=	"<label class='checkbox-inline'><input type='checkbox'  value='' checked onclick='add_category_checkbox(this)'>月底</label>";
					//sb.append(str);
				}
			}
			
			
			System.out.println(blogCategoryAll.getCategoryName());
		}
		System.out.println(sb.toString());
		
		
		return null;
	}
	

}
