package top.lyxwachs.dao;

import top.lyxwachs.bean.BlogFriendlyLinks;

public interface BlogFriendlyLinksMapper {
    int deleteByPrimaryKey(Integer flId);

    int insert(BlogFriendlyLinks record);

    int insertSelective(BlogFriendlyLinks record);

    BlogFriendlyLinks selectByPrimaryKey(Integer flId);

    int updateByPrimaryKeySelective(BlogFriendlyLinks record);

    int updateByPrimaryKey(BlogFriendlyLinks record);
}