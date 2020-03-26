package top.lyxwachs.dao;

import java.util.List;

import top.lyxwachs.bean.BlogCategory;

public interface BlogCategoryMapper {
    int deleteByPrimaryKey(Integer categoryId);

    int insert(BlogCategory record);

    int insertSelective(BlogCategory record);

    BlogCategory selectByPrimaryKey(Integer categoryId);

    int updateByPrimaryKeySelective(BlogCategory record);

    int updateByPrimaryKey(BlogCategory record);

	int insertBatchCategory(List<BlogCategory> list);
}