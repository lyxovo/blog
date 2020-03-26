package top.lyxwachs.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONObject;

import top.lyxwachs.bean.Blog;
import top.lyxwachs.bean.BlogCategory;
import top.lyxwachs.bean.BlogTag;
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
	/**
	 * 查询list
	 * @return
	 */
	public List<Blog> findBlogList() {
		return blogMapper.findBlogList();
	}
	
	/**
	 * 保存博客，返回1：保存成功。0，失败
	 * @param blog
	 * @param arr_category 
	 * @param arr_tag_name 
	 * @return
	 */
	public String saveBlog(Blog blog, String[] arr_tag_name, String[] arr_category) {
		JSONObject json=new JSONObject();
		int i = blogMapper.insertSelective(blog);
		Integer bId = blog.getbId();//刚插入的获取id
	
		//标签
		//组装成list集合，使用mybatis批量插入。
		List<BlogTag> list_tag=new ArrayList<BlogTag>();
		if(arr_tag_name.length!=0) {
			BlogTag blogTag=null;
			for (String _tag_name : arr_tag_name) {
				if (_tag_name != null && _tag_name!="") {
					blogTag=new BlogTag();
					blogTag.setbId(bId);
					blogTag.setTagName(_tag_name);
					blogTag.setTagNumber(1);//该标签数，查询 where teg=""
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
				if (category != null && category!="") {
					blogCategory=new BlogCategory();
					blogCategory.setbId(bId);
					blogCategory.setCategoryName(category);
					blogCategory.setCategoryNumber(1);//专栏数，查询 where catery=""
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

		
		if(i==1) {
			json.put("flag",1);
		}else {
			json.put("flag",0);
		}
		return json.toString();
	}
	

}
