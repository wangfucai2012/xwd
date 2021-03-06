package com.web.modules.sys.web;

import com.web.commons.web.BaseController;
import org.apache.shiro.authz.annotation.RequiresUser;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

/**
 * 
 * @description:
 * @author: nanxiaoqiang
 * @version: V1.00
 * @create Date: 2015年5月14日下午2:00:45
 */
@Controller
@RequestMapping(value = "dev")
public class DevController extends BaseController {

	@RequiresUser
	@RequestMapping(value = { "help", "help/main" })
	public String iconselect(HttpServletRequest request, Model model) {
		// model.addAttribute("value", request.getParameter("value"));
		return "modules/dev/help/main";
	}
}
