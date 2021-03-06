package com.web.modules.sys.web;

import com.web.commons.config.Global;
import com.web.commons.web.BaseController;
import com.web.commons.web.Page;
import com.web.modules.sys.entity.Site;
import com.web.modules.sys.service.SiteService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.authz.annotation.RequiresUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 
 * @description:
 * @author: nanxiaoqiang
 * @version: V1.00
 * @create Date: 2015年5月13日下午3:20:19
 */
@Controller
@RequestMapping(value = "sys/site")
public class SiteController extends BaseController {

	@Autowired
    SiteService siteService;

	@ModelAttribute
	public Site get(@RequestParam(required = false) Long id) {
		if (id != null) {
			return siteService.get(id);
		} else {
			return new Site();
		}
	}

	@RequiresPermissions("sys:site:view")
	@RequestMapping(value = { "list", "" })
	public String list(Site site, HttpServletRequest request,
                       HttpServletResponse response, Model model) {
		Page<Site> page = siteService.find(new Page<Site>(request, response),
				site);
		model.addAttribute("page", page);
		return "modules/sys/siteList";
	}

	@RequiresPermissions("sys:site:view")
	@RequestMapping(value = "form")
	public String form(Site site, Model model) {
		model.addAttribute("site", site);
		return "modules/sys/siteForm";
	}

	@RequiresPermissions("sys:site:edit")
	@RequestMapping(value = "save")
	// @Valid
	public String save(Site site, Model model,
                       RedirectAttributes redirectAttributes) {
		if (Global.isDemoMode()) {
			addMessage(redirectAttributes, "演示模式，不允许操作！");
			return "redirect:/sys/site/?repage";// "+Global.getAdminPath()+"
		}
		if (!beanValidator(model, site)) {
			return form(site, model);
		}
		siteService.save(site);
		addMessage(redirectAttributes, "保存站点'" + site.getName() + "'成功");
		return "redirect:/sys/site/?repage";// "+Global.getAdminPath()+"
	}

	@RequiresPermissions("sys:site:edit")
	@RequestMapping(value = "delete")
	public String delete(Long id, RedirectAttributes redirectAttributes) {
		if (Global.isDemoMode()) {
			addMessage(redirectAttributes, "演示模式，不允许操作！");
			return "redirect:/sys/site/?repage";// "+Global.getAdminPath()+"
		}
		siteService.delete(id);
		addMessage(redirectAttributes, "删除站点成功");
		return "redirect:/sys/site/?repage";// "+Global.getAdminPath()+"
	}

	@RequiresUser
	@ResponseBody
	@RequiresPermissions("sys:site:view")
	@RequestMapping(value = "getAllSiteByAjax")
	public List<Site> getAllSiteByAjax(HttpServletResponse response) {
		response.setContentType("application/json; charset=UTF-8");
		return siteService.findAllList();
	}
}
