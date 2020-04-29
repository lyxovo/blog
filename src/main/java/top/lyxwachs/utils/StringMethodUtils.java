package top.lyxwachs.utils;

import java.text.DecimalFormat;

public class StringMethodUtils {
    
	/**
	 * 	除法：返回小数点固定 一位
	 */
    public static  String  formatFloatOne(float fsize) {
//    	(float)mf.getSize();
		DecimalFormat df=new DecimalFormat("0.0");//设置保留位数
	    return df.format(fsize/1024);//返回上传文件大小
    	
    }
    
}
