package top.lyxwachs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import top.lyxwachs.bean.BlogCarousel;
import top.lyxwachs.dao.BlogCarouselMapper;

/**
 * 博客上传图片连接
 * @author liyouxiang
 *
 */
@Service
public class CarouseService {
	@Autowired
	BlogCarouselMapper blogCarouselMapper;
	
	//保存轮播图片信息到数据库
	public int saveCarousePhoto(String imageUrl,Integer userid, String fileSize) {
		BlogCarousel bc=new BlogCarousel();
		int lastIndexOf = imageUrl.lastIndexOf("/"); //结果：5
		//截取，从0位开始-到道号为下标结束，不包含道号位。
		String carouselName=imageUrl.substring(lastIndexOf+1);
		bc.setCarouselName(carouselName);
		bc.setCarouselUrl(imageUrl);
		bc.setCreateUser(userid);
		bc.setState(1);//1表示图片状态存在
		bc.setFileSize(fileSize);
		
		return blogCarouselMapper.insert(bc);
		
	}
	
	/**
	 * 	查询数据库中存在的图片--by userid
	 * @param userid
	 * @param state=1
	 * @return
	 */
	public List<BlogCarousel> selectAllPhotos(Integer userid, int state) {
		return blogCarouselMapper.selectBcByUserIdAndState(userid,state);
	}
	
	/**
	 * 删除图片
	 * @param cid
	 * @return
	 */
	public int delCarouselById(Integer cid) {
		return blogCarouselMapper.deleteByPrimaryKey(cid);
	}
	


}
