package top.lyxwachs.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import top.lyxwachs.service.FriendLinkService;
/**
 * 博客友情连接
 * @author liyouxiang
 */

@RequestMapping("/blog")
@Controller
public class FriendLinkController {
	@Autowired
	FriendLinkService friendLinkService;
	
	/**
	 * 保存友情连接
	 * @param fl_name
	 * @param fl_url
	 * @return
	 */
	@RequestMapping("saveFriendlink")
	@ResponseBody
	public String saveFriendlink(String fl_name,String fl_url) {
		Integer create_user=1;
		return friendLinkService.saveFriendlink(fl_name,fl_url,create_user);
	}
	
	/**
	 * 查询所有友情连接列表
	 * @return
	 */
	@RequestMapping("queryFlsList")
	@ResponseBody
	public String queryFlsList() {
		Integer create_user=1;
		return friendLinkService.queryFriendLinkList(create_user);
	}
	
	/**
	 * 删除友情连接
	 * @return
	 */
	@RequestMapping("delFlByflId")
	@ResponseBody
	public String delFlByflId(Integer flId) {
		Integer create_user=1;
		return friendLinkService.delFlByflId(flId,create_user);
	}
	
	
}
