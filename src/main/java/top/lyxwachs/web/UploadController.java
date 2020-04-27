package top.lyxwachs.web;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

import top.lyxwachs.service.UploadService;

/**
 * @program: fastdfs-demo
 **/
@Controller
@RequestMapping("upload")
public class UploadController {
    @Autowired
    private UploadService uploadService;

    /**
     * 作上传
     */
    @RequestMapping("doUpload")
    public Map<String,Object> doUpload(MultipartFile mf){
        System.out.println(mf.getOriginalFilename());
        Map<String, Object> map=null;
//        Map<String, Object> map = uploadService.upload(mf);
        return map;
    }
    
	//https://blog.csdn.net/qq_39565055/article/details/79941737?utm_source=blogxgwz1
	@RequestMapping("doUpload2")
	@ResponseBody
    public String doUpload2(@RequestParam("photo")List<MultipartFile> list){
		JSONObject json=new JSONObject();
//		JSONArray array=new JSONArray();
		ArrayList<String> data=new ArrayList<String>();
		for (MultipartFile mf : list) {
			String imageUrl = uploadService.upload(mf);
//				json.put("imageUrl", imageUrl);
			data.add(imageUrl);
			System.out.println(imageUrl);
		}
		
		json.put("errno",0);
		json.put("data",data);
		return json.toString();
    }
    
//  "errno": 0, //errno 即错误代码，0 表示没有错误
//  // data 是一个数组，返回若干图片的线上地址
//  "data": [
//      "图片1地址",
//      "图片2地址",
//      "……"
//  ]
    @RequestMapping("test")
    public void test(){
    	System.out.println(1);
    	uploadService.test();
    	System.out.println(2);
    }
    

}


