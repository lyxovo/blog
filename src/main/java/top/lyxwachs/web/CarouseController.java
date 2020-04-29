package top.lyxwachs.web;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSONObject;

import top.lyxwachs.bean.BlogCarousel;
import top.lyxwachs.service.CarouseService;
import top.lyxwachs.service.UploadService;
import top.lyxwachs.utils.StringMethodUtils;
/**
 * 博客上传图片连接
 * @author liyouxiang
 */

@RequestMapping("/blog")
@Controller
public class CarouseController {
	@Autowired
	private CarouseService carouseService;
	@Autowired
	private UploadService uploadService;
	
	/**
	 * 上传轮播图片
	 * @param file
	 * @return
	 * @throws Exception
	 */
//	测试
	@RequestMapping("/upload")
	@ResponseBody
	public String upload(@RequestParam("photo") MultipartFile file) throws Exception {
		String realPath="/home/www/images";
		File f=new File(realPath);
		if(!f.exists()) {
			f.mkdirs();
		}
		 //获取文件名称 
	    String fileName = file.getOriginalFilename(); 
	    realPath=realPath +"/" + fileName;
	    //写入本地磁盘 
	    InputStream is = file.getInputStream(); 
	    byte[] bs = new byte[1024]; 
	    int len; 
	    ArrayList<String> list=new ArrayList<String>();
	    list.add("www.baidu.com");
	    list.add("www.baidu.com222");
	    OutputStream os = new FileOutputStream(new File(realPath)); 
	    while ((len = is.read(bs)) != -1) { 
	      os.write(bs, 0, len); 
	    } 
	    os.close(); 
	    is.close(); 
		JSONObject json=new JSONObject();
		json.put("errno",0);//0表示成功
		json.put("data",list);
		return json.toString();
	}
	
	
//  "errno": 0, //errno 即错误代码，0 表示没有错误
//  // data 是一个数组，返回若干图片的线上地址
//  "data": [
//      "图片1地址",
//      "图片2地址",
//      "……"
//  ]
	
	/**
	 * 	轮播图片上传
	 * @param list
	 * @return
	 */
	@RequestMapping("doUpload2")
	@ResponseBody
	public String doUpload2(@RequestParam("photo")MultipartFile mf){
	    String fileSize = StringMethodUtils.formatFloatOne((float)mf.getSize());//设置保留位数//返回上传文件大小
	    
		Integer userid=1; //用户ID
		JSONObject json=new JSONObject();
			String imageUrl = uploadService.upload(mf);
			if(imageUrl==null) {
				json.put("errno",1);
				json.put("data",imageUrl);
			}else {//上传成功
//				保存到数据库中
				int i = carouseService.saveCarousePhoto(imageUrl,userid,fileSize);
				if(i!=0) {
					json.put("errno",0);
					json.put("data",imageUrl);
				}else {
					json.put("errno",1);
					json.put("data",imageUrl);
				}
			}
		System.out.println(imageUrl);
//			无论是否上传成功，查询数据库中所有数据返回
		int state=1;//查询存在状态的
		List<BlogCarousel> bcList=carouseService.selectAllPhotos(userid,state);
		json.put("bcList",bcList);
			
		return json.toString();
    }
	
	
	
	/**
	 * 
	 * 查询所有的轮播图片信息
	 * @return
	 */
	@RequestMapping("queryBlogCarousels")
	@ResponseBody
	public String queryBlogCarousels(){
		JSONObject json=new JSONObject();
		Integer userid=1; //用户ID
		int state=1;
		List<BlogCarousel> bcList=carouseService.selectAllPhotos(userid,state);
		json.put("bcList",bcList);
		return json.toString();
    }
	
	
	/**
	 * 删除列表中的图片信息
	 * @return
	 */
	@RequestMapping("delCarouselById")
	@ResponseBody
	public String delCarouselById(Integer cid){
		JSONObject json=new JSONObject();
		int i=carouseService.delCarouselById(cid);
		json.put("flag",i);
		return json.toString();
    }
	
	
	
}
