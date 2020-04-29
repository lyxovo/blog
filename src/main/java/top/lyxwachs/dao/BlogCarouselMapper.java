package top.lyxwachs.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import top.lyxwachs.bean.BlogCarousel;

public interface BlogCarouselMapper {
    int deleteByPrimaryKey(Integer carouselId);

    int insert(BlogCarousel record);

    int insertSelective(BlogCarousel record);

    BlogCarousel selectByPrimaryKey(Integer carouselId);

    int updateByPrimaryKeySelective(BlogCarousel record);

    int updateByPrimaryKey(BlogCarousel record);

	List<BlogCarousel> selectBcByUserIdAndState(@Param("createUser")Integer userid, @Param("state")int state);
}