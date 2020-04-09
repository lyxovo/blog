package top.lyxwachs.web;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageInfo;

import top.lyxwachs.bean.BlogCategory;
import top.lyxwachs.bean.BlogTag;
import top.lyxwachs.bean.BlogWithBLOBs;
import top.lyxwachs.service.BlogService;

@RequestMapping("/blog")
@Controller
public class BlogController {
	@Autowired
	private BlogService blogService;
	
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
		String b_content_text = request.getParameter("b_contenttext");
		
		String b_id = request.getParameter("b_id");
		
//		int b_author=1;//张三登录人
//		Date b_createdate= new Date();//创建时间
//		BlogWithBLOBs blog=new BlogWithBLOBs();
//		blog.setbAuthor(b_author);
//		blog.setbContent(b_content);//保持博客中的html
//		
//		blog.setbCreatedate(b_createdate);
//		blog.setbCreateupdate(b_createdate);
//		blog.setbTitle(b_title);
//		blog.setbContenttext(b_content_text);//保存博客中的纯文本内容text
//		blog.setbVisitors(0);
//		blog.setbDiscuss(0);
//		blog.setbLive(1);
		Integer bAuthor=1;//登录人，session，暂时订为1

		String result = blogService.saveBlog(bAuthor,b_id,b_title,b_content,b_content_text,arr_tag_name,arr_category);
		return result;
	}
	
	/**
	 * 保存博客成功后跳转页面,并保存blog到该页面
	 * @return
	 */
	@RequestMapping("success")
	public ModelAndView saveSuccess(HttpServletRequest  request) {
		ModelAndView mv = new ModelAndView("success");
		String b_id = request.getParameter("b_id");
		//System.out.println(b_id);
		BlogWithBLOBs blog = blogService.getBlog(b_id);
		String content_text = blog.getbContenttext().trim();
		//截取180个字符，如果大于180个字就截取180，否则不用截取。
		if(content_text.length()>180) {
			String bContenttext = content_text.substring(0,180);
			blog.setbContenttext(bContenttext);
			request.setAttribute("blog", blog);
		}else {
			request.setAttribute("blog", blog);
		}
		return mv;
	}
	
	
	/**
	 * 跳转博客管理页面
	 * @return
	 */
	@RequestMapping("index")
	public ModelAndView b_management(String  cat,String b_id,String keywords,@RequestParam(value="curr",defaultValue = "1")
	Integer pageNum,@RequestParam(value="limit",defaultValue = "5")Integer pageSize) {
		Integer user_id=1;
		ModelAndView mv=null;
		if("b_management".equals(cat)) {
			mv = new ModelAndView("b_management");//转发到管理页面
			//分页
			PageInfo<BlogWithBLOBs> pageInfo = blogService.findBlogList(keywords,pageNum,pageSize);
			mv.addObject("pageInfo", pageInfo);
//			回显关键字
			mv.addObject("keywords", keywords);
		}else if("b_send".equals(cat)) {
//			http://localhost:8081/blog/index.do?cat=b_send&b_id=1
			if(StringUtils.isBlank(b_id)) {//添加
				mv = new ModelAndView("b_send");//转发到发博客页面
			}else {//跳转到编辑页面
				mv = new ModelAndView("b_send2");//转发到发博客页面
				BlogWithBLOBs blog=blogService.getBlog(b_id);//根据b_id查询博客
				mv.addObject("blog", blog);
				
//				回显文章标签
				List<BlogTag> tagsList =blogService.getTagsList(Integer.parseInt(b_id));
				mv.addObject("tagsList", tagsList);
				
//				回显分类栏（没有完成。。。。。思路不清楚）
				List<BlogCategory> categorysList =blogService.getCategorysList(Integer.parseInt(b_id));
				mv.addObject("categorysList", categorysList);
				
//				分类栏-文本框，查询该用户所有的标签栏
				List<BlogCategory> categorysListOfUser =blogService.getCategorysList(Integer.parseInt(b_id));
				mv.addObject("categorysListOfUser", categorysListOfUser);
				
				
				//
				
			}
			
			
			
		}else if("b_flmanger".equals(cat)) {
			mv = new ModelAndView("b_flmanger");//转发到发友情链接页面
		}else if("b_carousel".equals(cat)) {
			mv = new ModelAndView("b_carousel");//轮播图片
		}
		
		return mv;
	}
	
	/**
	 * 后台登录
	 * @param request
	 * @param response
	 */
	@RequestMapping("login")
	public void login(HttpServletRequest  request,HttpServletResponse response) {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
//		保存操作,之前判断，保存session
//		重定向
		try {
			response.sendRedirect("../blog/index.do?cat=b_management");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	/**
	 * 根据b_id 查询blog
	 * @param request
	 * @return
	 */
	@RequestMapping("getBlog")
	public BlogWithBLOBs getBlog(HttpServletRequest  request) {
		String b_id = request.getParameter("b_id");
		BlogWithBLOBs blog=blogService.getBlog(b_id);
		return blog;
	}
	
	/**
	 * 根据b_id删除博客
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("delBlog")
	@ResponseBody
	public String delBlog(HttpServletRequest  request,HttpServletResponse response) {
		String b_id = request.getParameter("b_id");
		return blogService.delBlog(b_id);
	}
	
	

	/**
	 * 根据条件查询博客列表
	 * @param keywords
	 * @return string
	 */
//	@RequestMapping("searchBlogList")
//	@ResponseBody
//	public String searchBlogList(String keywords,@RequestParam(value="curr",defaultValue = "1")
//	Integer pageNum,@RequestParam(value="limit",defaultValue = "15")Integer pageSize) {
//		JSONObject json=new JSONObject();
//		PageInfo<BlogWithBLOBs> pageInfo = blogService.findBlogList(keywords,pageNum,pageSize);
//
//		
//		json.put("pageInfo",pageInfo);
//		return json.toString();
//	}
	
	
}
