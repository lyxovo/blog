package top.lyxwachs.web;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;

import top.lyxwachs.bean.Blog;
import top.lyxwachs.bean.BlogTag;
import top.lyxwachs.service.BlogService;

@RequestMapping("/blog")
@Controller
public class BlogController {
	@Autowired
	private BlogService blogService;
	

	@RequestMapping("list")
	public ModelAndView getBookList() {
		List<Blog> bookList = blogService.findBlogList();
		ModelAndView mv = new ModelAndView("index");
		mv.addObject("bookList", bookList);
		return mv;
	}
	
	
	@RequestMapping("error500")
	public ModelAndView error500() {
		ModelAndView mv = new ModelAndView("error500");
		return mv;
	}
	
	
	
	//测试------------------------
	
	@RequestMapping("/upload")
	@ResponseBody
	public String upload(@RequestParam("file") MultipartFile file) throws Exception {
		String realPath="E:/temp_test/";
		 //获取文件名称 
	    String fileName = file.getOriginalFilename(); 
	    realPath=realPath + fileName;
	    
	    //写入本地磁盘 
	    InputStream is = file.getInputStream(); 
	    byte[] bs = new byte[1024]; 
	    int len; 
	    OutputStream os = new FileOutputStream(new File(realPath)); 
	    while ((len = is.read(bs)) != -1) { 
	      os.write(bs, 0, len); 
	    } 
	    os.close(); 
	    is.close(); 

		JSONObject json=new JSONObject();
		JSONObject jdata=new JSONObject();
		json.put("code",0);
		json.put("msg","成功");
		
		jdata.put("src",realPath);
		jdata.put("title",fileName);
		
		json.put("data",jdata);
		return json.toString();
	}
	

	/**
	 * 保存博客
	 * @param request
	 * @return
	 */
	@RequestMapping("/saveBlog.do")
	@ResponseBody
	public String saveBlog(HttpServletRequest  request) {
		String[] arr_tag_name = request.getParameterValues("tag_name");
		String[] arr_category = request.getParameterValues("category");
	
		String b_title = request.getParameter("b_title");
		String b_content = request.getParameter("b_content");
		int b_author=1;//张三登录人
		Date b_createdate= new Date();//创建时间
		Blog blog=new Blog();
		blog.setbAuthor(b_author);
		blog.setbContent(b_content);
		blog.setbCreatedate(b_createdate);
		blog.setbTitle(b_title);

		String result = blogService.saveBlog(blog,arr_tag_name,arr_category);
		
		return result;
	}
	
	/**
	 * 保存博客成功后跳转页面
	 * @return
	 */
	@RequestMapping("saveSuccess")
	public ModelAndView saveSuccess(HttpServletRequest  request) {
		ModelAndView mv = new ModelAndView("success");
		
		String str_blog = request.getParameter("blog");
		System.out.println(str_blog);
		
		JSONObject blog = JSONObject.parseObject(str_blog); 
		
		
		return mv;
	}
	
	
	
	
	
	
}
