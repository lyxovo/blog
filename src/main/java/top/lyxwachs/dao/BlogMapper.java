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

	
}