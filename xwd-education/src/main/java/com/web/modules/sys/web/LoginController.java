package com.web.modules.sys.web;

import com.web.commons.security.UserUtils;
import com.web.commons.web.BaseController;
import com.web.modules.sys.entity.User;
import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * LoginController负责打开登录页面(GET请求)和登录出错页面(POST请求)， 真正登录的POST请求由Filter完成,
 * 
 * @author nanxiaoqiang
 * 
 * @version 2014年2月8日
 * 
 */
@Controller
@RequestMapping(value = "/login")
public class LoginController extends BaseController {
	/**
	 * 跳转到login页面
	 * 
	 * @return
	 */
	@RequestMapping(method = RequestMethod.GET)
	public String login() {
		User user = UserUtils.getUser();
		// 如果已经登录，则跳转到管理首页
		if (user.getId() != null) {
			return "redirect:/";// + Global.getAdminPath();
		}
		return "modules/sys/sysLogin";// 跳转到登录页面
	}

	@RequestMapping(method = RequestMethod.POST)
	public String fail(
			@RequestParam(FormAuthenticationFilter.DEFAULT_USERNAME_PARAM) String userName,
			Model model) {
		User user = UserUtils.getUser();
		// 如果已经登录，则跳转到管理首页
		if (user.getId() != null) {
			return "redirect:/";
		}
		model.addAttribute(FormAuthenticationFilter.DEFAULT_USERNAME_PARAM,
				userName);
		return "modules/sys/sysLogin";
	}

	@RequestMapping(value = "/cas")
	public String index() {
		User user = UserUtils.getUser();
		System.err.println("哈哈哈哈哈哈哈" + user.getId());
		if (user.getId() != null) {
			return "modules/sys/sysIndex";
		} else {
			return "modules/sys/sysLogin";
		}
	}
}
