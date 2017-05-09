package com.web.modules.sys.web.dict;

import com.google.common.collect.Lists;
import com.web.commons.web.BaseController;
import com.web.commons.web.Page;
import com.web.modules.sys.entity.dict.Rail;
import com.web.modules.sys.service.dict.RailService;
import org.apache.shiro.authz.annotation.RequiresUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;

/**
 * 铁路局
 * Created by nemo on 16-06-12.
 */
@Controller
@RequestMapping(value = "/sys/dict/rail")
public class RailController extends BaseController {

    //展示页面地址
    private static final String listPath = "modules/sys/dic/railList";
    //新增修改页面地址
    private static final String formPath = "modules/sys/dic/railForm";
    //首页地址
    private static final String indexPath = "sys/dict/rail";


    @Autowired
    private RailService service;

    @ModelAttribute("rail")
    public Rail get(@RequestParam(required = false) Long id) {
        if (id != null) {
            return service.getById(id);
        } else {
            return new Rail();
        }
    }


    /**
     * 默认首页
     * @param model
     * @param entity 查询参数
     * @return
     */
    @RequestMapping(value = {"","index"})
    public String index(Model model, Rail entity, HttpServletRequest request, HttpServletResponse response){

        Page<Rail> page = service.getByPage(new Page<Rail>(request,response),entity);

        model.addAttribute("page",page);
        
        List<Rail> list = Lists.newArrayList();
        List<Rail> listRail = service.getAll();
		
        model.addAttribute("entity",entity);
        list = service.sortList(list, listRail, 1L);
        model.addAttribute("list",list);
        return listPath;
    }

    /**
     * 前往新增或者修改
     * @param entity
     * @param model
     * @return
     */
    @RequestMapping(value = "form")
    public String form(@RequestParam(required=false) Long parentid, @RequestParam(required=false) Long id, Rail entity, Model model) {
		Rail rail = new Rail();

		/**
		 * 如果ID不为空，则说明是更新，取得原来数据
		 */
		if(id!=null){
			rail = service.getById(id);
		}else if(parentid!=null){
			rail.setParent(service.getById(parentid));
		}
		model.addAttribute("rail", rail);
        
        return formPath;
    }

    /**
     * 保存方法
     * @param entity 需要保存的实体
     * @param redirectAttributes
     * @return
     */
    @RequestMapping(value = "save",method = RequestMethod.POST)
    public String save(Rail entity, RedirectAttributes redirectAttributes){

		//按钮类型为父级+1
		if(entity.getParent()!=null){
			Rail parent = service.getById(entity.getParent().getId());
			entity.setParentIds(parent.getParentIds()+'.'+parent.getId());
			entity.setParent(parent);
		}
        service.save(entity);

        addMessage(redirectAttributes,"保存成功");
        return "redirect:/"+indexPath;
    }

    /**
     * 删除方法
     * @param id 需要删除的对象ID
     * @param redirectAttributes
     * @return
     */
    @RequestMapping(value = "delete")
    public String delete(Long id,RedirectAttributes redirectAttributes){

        service.delete(id);

        addMessage(redirectAttributes,"删除成功");
        return "redirect:/"+indexPath;
    }
    
	/**
	 * 通过路局id获取区段对象
	 * @return
	 */
	@RequestMapping(value = { "getDistrict" })
	public @ResponseBody List<Rail> getDistrict(@RequestParam(required = false)Long id){
		List<Rail> districtList = service.getDistrict(id);
		return districtList;
	}
	
	/**
	 * 树需要的数据
	 * @param response
	 * @param  type 目录的类型
	 * @param  p 需要查看的目录的父节点
	 * @return
	 */
	@RequiresUser
	@ResponseBody
	@RequestMapping(value = "treeData")
	public List<Map<String, Object>> treeData(HttpServletResponse response, Long p) {
		response.setContentType("application/json; charset=UTF-8");
		return service.getRailList(p);
	}
}
