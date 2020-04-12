package top.lyxwachs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONObject;

import top.lyxwachs.bean.BlogFriendlyLinks;
import top.lyxwachs.dao.BlogFriendlyLinksMapper;

/**
 * 博客友情连接
 * @author liyouxiang
 *
 */
@Service
public class FriendLinkService {
	@Autowired
	BlogFriendlyLinksMapper blogFriendlyLinksMapper;
	
	/**
	 * 添加友情连接
	 * @param fl_name
	 * @param fl_url
	 * @return
	 */
	public String saveFriendlink(String flName, String flUrl,Integer createUser) {
		JSONObject json=new JSONObject();
		BlogFriendlyLinks fl=new BlogFriendlyLinks();
		fl.setFlText(flName);
		fl.setFlUrl(flUrl);
		fl.setCreateUser(createUser);
		
		int i = blogFriendlyLinksMapper.insert(fl);
		if(i==1) {
			json.put("flag", 1);
		}else {
			json.put("flag", 0);
		}
		
		return json.toString();
	}
	
	
	/**
	 * 查询友情链接
	 * @param u_id
	 * @return
	 */
	public String queryFriendLinkList(Integer createUser) {
		JSONObject json=new JSONObject();
		List<BlogFriendlyLinks> fls=blogFriendlyLinksMapper.selectFlListByUid(createUser);
		json.put("fls", fls);
		return json.toString();
	}

	/**
	 * 删除友情连接
	 * @param flId
	 * @param create_user
	 * @return
	 */
	public String delFlByflId(Integer flId, Integer createUser) {
		JSONObject json=new JSONObject();
		int i=blogFriendlyLinksMapper.delFlByflId(flId,createUser);
		if(i==1) {
			json.put("flag", 1);
		}else {
			json.put("flag", 0);
		}
		return json.toString();
	}

}
