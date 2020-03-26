package top.lyxwachs.dao;

import java.util.List;

import top.lyxwachs.bean.Blog;

public interface BlogMapper {
    int deleteByPrimaryKey(Integer bId);

    int insert(Blog record);

    int insertSelective(Blog record);

    Blog selectByPrimaryKey(Integer bId);

    int updateByPrimaryKeySelective(Blog record);

    int updateByPrimaryKey(Blog record);

	List<Blog> findBlogList();
}