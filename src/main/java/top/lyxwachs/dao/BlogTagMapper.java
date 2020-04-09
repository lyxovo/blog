package top.lyxwachs.dao;

import java.util.List;

import top.lyxwachs.bean.BlogTag;

public interface BlogTagMapper {
    int deleteByPrimaryKey(Integer tagId);

    int insert(BlogTag record);

    int insertSelective(BlogTag record);

    BlogTag selectByPrimaryKey(Integer tagId);

    int updateByPrimaryKeySelective(BlogTag record);

    int updateByPrimaryKey(BlogTag record);

	int insertBatchTag(List<BlogTag> list_tag);

	List<BlogTag> getTagsList(int b_id);

	int deleteTagsByBid(int b_id);

	Integer getTagsTotal(String tagName);

}