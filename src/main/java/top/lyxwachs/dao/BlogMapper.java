package top.lyxwachs.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import top.lyxwachs.bean.Blog;
import top.lyxwachs.bean.BlogWithBLOBs;

public interface BlogMapper {
    int deleteByPrimaryKey(Integer bId);

    int insert(BlogWithBLOBs record);

    int insertSelective(BlogWithBLOBs record);

    BlogWithBLOBs selectByPrimaryKey(Integer bId);

    int updateByPrimaryKeySelective(BlogWithBLOBs record);

    int updateByPrimaryKeyWithBLOBs(BlogWithBLOBs record);

    int updateByPrimaryKey(Blog record);

	List<BlogWithBLOBs> findBlogList(@Param(value="bTitle") String keywords);

	int updateVisitorsCountByBid(@Param(value="bVisitors")Integer count,@Param(value="bId") int bId);
	
	List<BlogWithBLOBs> getHotBlogList(@Param(value="bAuthor")Integer userId,@Param(value="page")Integer page);

	List<BlogWithBLOBs> getNewBlogList(@Param(value="bAuthor")Integer userId,@Param(value="page")Integer page);

	List<BlogWithBLOBs> getBlogListByCategoryName(@Param(value="bTitle")String keywords, @Param(value="categoryName")String categoryName, @Param(value="userId")Integer userId, @Param(value="cLive")Integer cLive);

	
}