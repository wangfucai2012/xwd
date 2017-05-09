package com.web.modules.sys.web;

import com.web.commons.web.BaseController;
import com.web.modules.sys.entity.Attachment;
import com.web.modules.sys.service.AttachmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springside.modules.utils.Encodes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;

@Controller
@RequestMapping(value = "sys/attachment")
public class AttachmentController extends BaseController {

	@Autowired
	private AttachmentService attachmentService;

	@ModelAttribute
	public Attachment get(@RequestParam(required = false) Long id) {
		if (id != null) {
			return attachmentService.get(id);
		} else {
			return new Attachment();
		}
	}

	@RequestMapping(value = "download")
	public String download(Long id, HttpServletRequest request,
			HttpServletResponse response, Model model,
			RedirectAttributes redirectAttributes) throws IOException {
		Attachment attachment = attachmentService.get(id);
		if (attachment != null && attachment.getId() != null) {
			File f = new File(attachment.getSavePath()
					+ attachment.getSaveName());
			if (f.exists()) {
				BufferedInputStream br = new BufferedInputStream(
						new FileInputStream(f));
				byte[] buf = new byte[1024];
				int len = 0;
				response.reset();
				response.setContentType(attachment.getContentType());
				response.setHeader(
						"Content-Disposition",
						"attachment; filename="
								+ Encodes.urlEncode(attachment.getFileName()));
				OutputStream out = response.getOutputStream();
				while ((len = br.read(buf)) > 0)
					out.write(buf, 0, len);
				out.flush();
				br.close();
				br = null;
				out.close();
				out = null;
			}
		}
		return null;
	}

	/**
	 * Add by Nemo on 2016/06/14
	 * 删除附件标记
	 * @param id
     */
	@ResponseBody
	@RequestMapping(value = "delete")
	public void deleteAttch(Long id){
		if(id!=null) {
			attachmentService.delete(id);
		}
	}

}
