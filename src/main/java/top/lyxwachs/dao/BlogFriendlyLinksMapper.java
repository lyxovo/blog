package top.lyxwachs.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import top.lyxwachs.bean.BlogFriendlyLinks;

public interface BlogFriendlyLinksMapper {
    int deleteByPrimaryKey(Integer flId);

    int insert(BlogFriendlyLinks record);

    int insertSelective(BlogFriendlyLinks record);

    BlogFriendlyLinks selectByPrimaryKey(Integer flId);

    int updateByPrimaryKeySelective(BlogFriendlyLinks record);

    int updateByPrimaryKey(BlogFriendlyLinks record);
	/**
	 * 根据当前登录人查询友情链接列表
	 * @param userId
	 * @return
	 */
	List<BlogFriendlyLinks> selectFlListByUid(Integer createUser);

	int delFlByflId(@Param("flId")Integer flId, @Param("createUser")Integer createUser);
	

}