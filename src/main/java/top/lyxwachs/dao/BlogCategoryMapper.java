package top.lyxwachs.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import top.lyxwachs.bean.BlogCategory;

public interface BlogCategoryMapper {
    int deleteByPrimaryKey(Integer categoryId);

    int insert(BlogCategory record);

    int insertSelective(BlogCategory record);

    BlogCategory selectByPrimaryKey(Integer categoryId);

    int updateByPrimaryKeySelective(BlogCategory record);

    int updateByPrimaryKey(BlogCategory record);

	int insertBatchCategory(List<BlogCategory> list);

	List<BlogCategory> getCategorysList(@Param("bId")int b_id);

	List<BlogCategory> getategorysListOfUser(@Param("uId")Integer user_id);

	void updateLiveByCategoryBId(@Param("bId")Integer bId,@Param("cLive") byte i,@Param("bAuthor") Integer bAuthor);
}