package top.lyxwachs.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	


}
