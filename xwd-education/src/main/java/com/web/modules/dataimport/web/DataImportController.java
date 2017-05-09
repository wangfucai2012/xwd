package com.web.modules.dataimport.web;

import com.web.commons.web.BaseController;
import com.web.modules.dataimport.service.DataImportService;
import com.web.modules.dataimport.urils.ExcelPoiUtils;
import com.web.modules.sys.entity.Attachment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

/**
 * 数据导入接口
 * Created by nemo on 16-6-15.
 */
@Controller
@RequestMapping(value = "workdataimport")
public class DataImportController extends BaseController {

    @Autowired
    private DataImportService service;

    /**
     * 数据导入展示界面
     * @return
     */
    @RequestMapping(value = "importPage")
    private String importPage(){
        return "modules/dataimport/work/importPage";
    }


    /**
     * 墩台
     * @return
     */
    @RequestMapping(value = "importPier")
    private String importPier(HttpServletRequest request){
        MultipartHttpServletRequest a = (MultipartHttpServletRequest) request;
        try {
            // 开始上传文件
            MultipartFile file = a.getFile("pierfile");
            Attachment atts = service.saveUploadFile(file);

            service.importPier(atts);

        }catch (Exception e){
            e.printStackTrace();
        }
        return "redirect:/workdataimport/importPage";
    }
    
    /**
     * 梁面
     * @return
     */
    @RequestMapping(value = "importGrider")
    private String importGrider(HttpServletRequest request){
        MultipartHttpServletRequest a = (MultipartHttpServletRequest) request;
        try {
            // 开始上传文件
            MultipartFile file = a.getFile("pierfile");
            Attachment atts = service.saveUploadFile(file);

            service.importGrider(atts);

        }catch (Exception e){
            e.printStackTrace();
        }
        return "redirect:/workdataimport/importPage";
    }
    
    /**
    * 承台
    * @return
    */
   @RequestMapping(value = "importBearingplatform")
   private String importBearingplatform(HttpServletRequest request){
       MultipartHttpServletRequest a = (MultipartHttpServletRequest) request;
       try {
           // 开始上传文件
           MultipartFile file = a.getFile("pierfile");
           Attachment atts = service.saveUploadFile(file);

           service.importBearingplatform(atts);

       }catch (Exception e){
           e.printStackTrace();
       }
       return "redirect:/workdataimport/importPage";
   }
   
	/**
	* 测试使用
	* @return
	*/
	@RequestMapping(value = "importTestData")
	private String importTestData(HttpServletRequest request){
	   MultipartHttpServletRequest a = (MultipartHttpServletRequest) request;
	   try {
	       // 开始上传文件
	       MultipartFile file = a.getFile("pierfile");
	       Attachment atts = service.saveUploadFile(file);
	
	       InputStream is = new FileInputStream(service.getFilepath(atts));
	       InputStream is2 = new FileInputStream(service.getFilepath(atts));
	       String fileSuffix = atts.getFileSuffix();
	       
	       
	       //String[] title = ExcelPoiUtils.readExcelTitle(is, fileSuffix,);
	       List<Map<String, Object>> contentList = ExcelPoiUtils.getImportData(is, fileSuffix);
	       
//	       service.importTunnelDrainage(atts);
	
	   }catch (Exception e){
	       e.printStackTrace();
	   }
	   return "redirect:/workdataimport/importPage";
	}
   
}
