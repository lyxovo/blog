package top.lyxwachs.dao;

import top.lyxwachs.bean.BlogCarousel;

public interface BlogCarouselMapper {
    int deleteByPrimaryKey(Integer carouselId);

    int insert(BlogCarousel record);

    int insertSelective(BlogCarousel record);

    BlogCarousel selectByPrimaryKey(Integer carouselId);

    int updateByPrimaryKeySelective(BlogCarousel record);

    int updateByPrimaryKey(BlogCarousel record);
}