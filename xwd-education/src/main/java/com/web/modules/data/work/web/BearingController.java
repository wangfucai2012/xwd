package com.web.modules.data.work.web;

import com.web.commons.config.Global;
import com.web.commons.web.BaseController;
import com.web.commons.web.Page;
import com.web.modules.data.work.entity.Bearing;
import com.web.modules.data.work.entity.Bridge;
import com.web.modules.data.work.entity.Pier;
import com.web.modules.data.work.service.BearingService;
import com.web.modules.data.work.service.BridgeService;
import com.web.modules.data.work.service.PierService;
import com.web.modules.sys.entity.Attachment;
import com.web.modules.sys.entity.Catalog;
import com.web.modules.sys.service.AttachmentService;
import com.web.modules.sys.service.CatalogService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;


/**
 * 
 *  @description:支座Controller
 *  @author: wangjianwei 
 *  @create Date:2016年4月25日 上午9:56:34
 */
@Controller
@RequestMapping(value = "data/work/bearing")
public class BearingController extends BaseController {
    
	@Autowired
	private CatalogService catalogService;
	@Autowired
	private BearingService bearingService;
	@Autowired
    BridgeService bridgeService;
	@Autowired
    PierService pierService;
    @Autowired
    private AttachmentService attachmentService;

	@ModelAttribute
	public Bearing get(@RequestParam(required = false) Long id) {
		if (id != null) {
			return bearingService.get(id);
		} else {
			return new Bearing();
		}
	}

	@RequiresPermissions("data:work:bearing:view")
	@RequestMapping(value = { "list", "" })
	public String list(Bearing entity, HttpServletRequest request,
                       HttpServletResponse response, Model model, @RequestParam(required = false) Long catalog) {
		Page<Bearing> page = bearingService.find(new Page<Bearing>(request, response),
				entity,catalog);
		model.addAttribute("page", page);
		if(catalog!=null){			
			Catalog cat = catalogService.getById(catalog);
			entity.setCat(cat);
		}
		model.addAttribute("bearing", entity);
		return "modules/data/work/bearingList";
	}

	@RequiresPermissions("data:work:bearing:view")
	@RequestMapping(value = "form")
	public String form(Bearing entity, Model model, @RequestParam(required = false) Long catalog) {
		if(catalog!=null){			
			Catalog cat = catalogService.getById(catalog);
			entity.setCat(cat);
		}
		
		//获取桥梁
		List<Bridge> listbri = bridgeService.findAllList();
		model.addAttribute("listbri",listbri);
		
		//获取墩身
		List<Pier> listPier = pierService.findAllList();
		model.addAttribute("listPier",listPier);
		
        //图片附件
        String attIds = entity.getImgAttachments();
        List<Attachment> atts = attachmentService.getAttchByIds(attIds);
        model.addAttribute("imgAtts",atts);

        //图纸附件
        attIds = entity.getAttachments();
        atts = attachmentService.getAttchByIds(attIds);
        model.addAttribute("atts",atts);

		//说明文当
		attIds = entity.getDocAttchments();
		atts = attachmentService.getAttchByIds(attIds);
		model.addAttribute("docAtts",atts);

		//技术规范
		attIds = entity.getTechnologyAttchments();
		atts = attachmentService.getAttchByIds(attIds);
		model.addAttribute("technologyAtts",atts);
		
		model.addAttribute("bearing", entity);
		return "modules/data/work/bearingForm";
	}
	
	@RequiresPermissions("data:work:bearing:view")
	@RequestMapping(value = "view")
	public String view(Bearing entity, Model model) {
		model.addAttribute("bearing", entity);
		return "modules/data/work/bearingView";
	}
	
	@RequiresPermissions("data:work:bearing:edit")
	@RequestMapping(value = "save")
	public String save(Bearing entity, Model model, RedirectAttributes redirectAttributes, HttpServletRequest request) {
		if (Global.isDemoMode()) {
			addMessage(redirectAttributes, "演示模式，不允许操作！");
			return "redirect:/data/work/bearing/?repage&catalog="+entity.getCat().getId();// "+Global.getAdminPath()+"
		}
		if (!beanValidator(model, entity)) {
			return form(entity, model,entity.getCat().getId());
		}
		
        MultipartHttpServletRequest a = (MultipartHttpServletRequest) request;
        try {
            // 图片资料
			String remark = request.getParameter("imgAttsRemark");
            List<MultipartFile> files = a.getFiles("pierfile");
            List<Attachment> atts = attachmentService.saveAllUploadFile(files,remark);
            entity.setImgAttachments(attachmentService.attchsToStringIds(entity.getImgAttachments(),atts));

            // 图纸资料
            files = a.getFiles("pierfile2");
			remark = request.getParameter("attsRemark");
            atts = attachmentService.saveAllUploadFile(files,remark);
            entity.setAttachments(attachmentService.attchsToStringIds(entity.getAttachments(),atts));

			// 说明文档
			files = a.getFiles("pierfile3");
			remark = request.getParameter("docAttsRemark");
			atts = attachmentService.saveAllUploadFile(files,remark);
			entity.setDocAttchments(attachmentService.attchsToStringIds(entity.getDocAttchments(),atts));

			// 技术规范
			files = a.getFiles("pierfile4");
			remark = request.getParameter("technologyRemark");
			atts = attachmentService.saveAllUploadFile(files,remark);
			entity.setTechnologyAttchments(attachmentService.attchsToStringIds(entity.getTechnologyAttchments(),atts));

            //操作附件表删除选择的附件
            attachmentService.delAttchByIds(entity.getDelAttch());

        }catch (Exception e){
            e.printStackTrace();
        }
		
		bearingService.save(entity);
		addMessage(redirectAttributes, "保存成功");
		return "redirect:/data/work/bearing/?repage&catalog="+entity.getCat().getId();// "+Global.getAdminPath()+"
	}

	@RequiresPermissions("data:work:bearing:edit")
	@RequestMapping(value = "deleteMulti")
	public String deleteMulti(@RequestParam String assembleDelId,
			RedirectAttributes redirectAttributes) {
		if (Global.isDemoMode()) {
			addMessage(redirectAttributes, "演示模式，不允许操作！");
			return "redirect:/data/work/bearing/?repage";// "+Global.getAdminPath()+"
		}
		bearingService.deleteMulti(assembleDelId);
		addMessage(redirectAttributes, "删除成功");
		return "redirect:/data/work/bearing/?repage";// "+Global.getAdminPath()+"
	}

    /**
     * 删除方法
     * @param id
     * @param catalogid
     * @param redirectAttributes
     * @return
     */
    @RequestMapping(value = "delete")
    public String delete(Long id,Long catalog,RedirectAttributes redirectAttributes){

    	bearingService.delete(id);

        addMessage(redirectAttributes,"删除成功");

        return "redirect:/data//work/bearing/list?repage&catalog="+catalog;
    }
}
