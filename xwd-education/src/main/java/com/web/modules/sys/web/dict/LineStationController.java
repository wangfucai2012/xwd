package com.web.modules.sys.web.dict;

import com.web.commons.config.Global;
import com.web.commons.web.BaseController;
import com.web.modules.sys.entity.dict.LineStation;
import com.web.modules.sys.service.dict.LineStationService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping(value = "sys/dic/linestation")
public class LineStationController extends BaseController {
	@Autowired
	private LineStationService service;

	@ModelAttribute
	public LineStation get(@RequestParam(required = false) Long id) {
		if (id != null) {
			return service.get(id);
		} else {
			LineStation entity = new LineStation();
			return entity;
		}
	}

	// @RequiresPermissions("sys:dic:linestation:view")
	// @RequestMapping(value = { "list", "" })
	// public String list(LineStation entity, HttpServletRequest request,
	// HttpServletResponse response, Model model) {
	// Page<LineStation> page = service.find(new Page<LineStation>(request,
	// response), entity, true);
	// model.addAttribute("page", page);
	// return "modules/sys/dic/linestationList";
	// }

	@RequiresPermissions("sys:dic:linestation:view")
	@RequestMapping(value = { "list", "" })
	public String list(Long lineId, LineStation entity,
			HttpServletRequest request, HttpServletResponse response,
			Model model) {
		// List<Station> stations = Lists.newArrayList();
		// if (lineId != null) {
		// List<LineStation> list = service.getAllByLineId(lineId);
		// for (LineStation ls : list) {
		// stations.add(ls.getStation());
		// }
		// }
		// model.addAttribute("stations", stations);
		List<LineStation> lss = service.getAllByLineId(lineId);
		model.addAttribute("lss", lss);
		model.addAttribute("lineId", lineId);
		return "modules/sys/dic/linestationList";
	}

	@RequiresPermissions("sys:dic:linestation:edit")
	@RequestMapping(value = "form")
	public String form(Long lineId, LineStation entity, Model model) {
		model.addAttribute("lineStation", entity);
		model.addAttribute("lineId", lineId);
		return "modules/sys/dic/linestationForm";
	}

	/**
	 * @deprecated
	 * @param entity
	 * @param model
	 * @return
	 */
	@RequiresPermissions("sys:dic:linestation:view")
	@RequestMapping(value = "view")
	public String view(LineStation entity, Model model) {
		model.addAttribute("lineStation", entity);
		return "modules/sys/dic/linestationView";
	}

	@RequiresPermissions("sys:dic:linestation:edit")
	@RequestMapping(value = "save")
	public String save(LineStation entity, Model model,
                       RedirectAttributes redirectAttributes, HttpServletRequest request)
			throws IllegalStateException, IOException {
		if (Global.isDemoMode()) {
			addMessage(redirectAttributes, "演示模式，不允许操作！");
			return "redirect:/sys/dic/linestationView";
		}
		if (!beanValidator(model, entity)) {
			return form(entity.getLine().getId(), entity, model);
		}
		service.save(entity);
		model.addAttribute("lineId", entity.getLine().getId());
		addMessage(redirectAttributes, "保存车站站序" + entity.getStation().getName()
				+ "'成功");
		return "redirect:/sys/dic/linestation/list?lineId="
				+ entity.getLine().getId();
	}

	@RequiresPermissions("sys:dic:linestation:edit")
	@RequestMapping(value = "deleteMulti")
	public String deleteMulti(@RequestParam String assembleDelId,
			RedirectAttributes redirectAttributes) {
		// if (Global.isDemoMode()) {
		// addMessage(redirectAttributes, "演示模式，不允许操作！");
		// return "redirect:/sys/dic/linestation/?repage";//
		// "+Global.getAdminPath()+"
		// }
		Long lineId = service.deleteMulti(assembleDelId);
		addMessage(redirectAttributes, "删除所选线路成功");
		return "redirect:/sys/dic/linestation/?lineId=" + lineId + "&repage";//
	}

}
