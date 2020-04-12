package top.lyxwachs.web;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSONObject;

import top.lyxwachs.service.CarouseService;
/**
 * 博客上传图片连接
 * @author liyouxiang
 */

@RequestMapping("/blog")
@Controller
public class CarouseController {
	@Autowired
	CarouseService carouseService;
	
	/**
	 * 上传轮播图片
	 * @param file
	 * @return
	 * @throws Exception
	 */
//	http://8.129.21.183
	@RequestMapping("/upload")
	@ResponseBody
	public String upload(@RequestParam("file") MultipartFile file) throws Exception {
		String realPath="/home/www/images";
		
//		#local_development_img_address
//		fileDir=/data/sites/up/img/
//		host=http://192.16.1.9
//		fileStr=/up/img/
		
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
	    
	    OutputStream os = new FileOutputStream(new File(realPath)); 
	    while ((len = is.read(bs)) != -1) { 
	      os.write(bs, 0, len); 
	    } 
	    os.close(); 
	    is.close(); 

		JSONObject json=new JSONObject();
		JSONObject jdata=new JSONObject();
		json.put("code",0);//0表示成功
		json.put("msg","成功");
		
		jdata.put("src",realPath);
		jdata.put("title",fileName);
		
		json.put("data",jdata);
		return json.toString();
	}
	
}
