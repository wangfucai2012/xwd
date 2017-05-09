package com.web.modules.dataimport.service;

import com.web.commons.config.Global;
import com.web.commons.service.BaseService;
import com.web.commons.utils.DictUtils;
import com.web.modules.data.work.dao.*;
import com.web.modules.data.work.entity.BearingPlatform;
import com.web.modules.data.work.entity.Bridge;
import com.web.modules.data.work.entity.Grider;
import com.web.modules.data.work.entity.Pier;
import com.web.modules.dataimport.urils.BeanUtil;
import com.web.modules.dataimport.urils.ExcelUtils;
import com.web.modules.sys.entity.Attachment;
import com.web.modules.sys.entity.Catalog;
import com.web.modules.sys.entity.Dict;
import com.web.modules.sys.entity.dict.Line;
import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by nemo on 16-6-15.
 */
@Service
@Transactional(readOnly = true)
public class DataImportService extends BaseService {

    @Autowired
    private BridgeDao bridgeDao;
    @Autowired
    private PierDao pierDao;
    @Autowired
    private BearingPlatformDao bearingPlatformDao;
    @Autowired
    private PileDao pileDao;
	@Autowired
	private GriderDao griderDao;
	@Autowired
	private MCatalogService mCatalogService;
    


    /**
     * 上传文件
     * @param file
     * @return
     * @throws IllegalStateException
     * @throws IOException
     */
    @Transactional(readOnly = false)
    public Attachment saveUploadFile(MultipartFile file)
            throws IllegalStateException, IOException {
        if (file == null) {
            return null;
        }
        String fileToPath = Global.getFileRootPath();
        Attachment attach = new Attachment();
        if (!file.isEmpty()) {
            // 判断目录
            String saveRelativePath = new DateTime().toString("yyyyMM");
            String savePath = fileToPath + saveRelativePath;
            File path = new File(savePath);
            // 没有路径就直接创建
            if (!(path.exists() && path.isDirectory())) {
                path.mkdirs();
            }
            // 放到规定目录，用的Spring的自带的transferTo没有用FileUtils（主要是这个类还没写完呢。。。）
            String saveName = System.currentTimeMillis() + ".xls";
            file.transferTo(new File(path + "/" + saveName));

            // 然后保存到Attachment
            String fileSuffix = file.getOriginalFilename().substring(
                    file.getOriginalFilename().lastIndexOf("."));

            attach.setSaveName(saveName);
            attach.setSavePath(savePath + "/");
            attach.setFileName(file.getOriginalFilename());
            attach.setFileSize(file.getSize());
            attach.setFileSuffix(fileSuffix);
            attach.setContentType(file.getContentType());
            attach.setSaveRelativePath(saveRelativePath + "/");
            attach.setFileType("upload");
            //dao.save(attach);
        }
        return attach;
    }

    /**
     * 获取附件地址
     * @param attachment
     * @return
     * @throws IOException
     */
    public String getFilepath(Attachment attachment) throws IOException {
        if (attachment != null) {
            File f = new File(attachment.getSavePath() + attachment.getSaveName());
            if (f.exists()) {
                return f.getAbsolutePath();
            }
        }
        return null;
    }


    public void importPier(Attachment attachment){
        try {
            List<String> ls = new ArrayList<String>();
//            private String pnumber;// 墩台号
//            private String type;// 墩身类型
//            private String hwd;// 墩身长宽高
//            private String pLength;//墩身长
//            private String pWidth;//墩身宽
//            private String pHeight;//墩身高
//            private String designM;//设计里程
//            private String hollow;// 是否空心
//            private String hwidth;// 空心宽度
//            private Double loss;// 墩身圬工方
//            private Bridge bridge;//所属桥梁
//            private AssetCard ass;
//            private String endM;
//            private String startM;
//            private String hole;//孔别
//            private Double topHeight;//墩顶高
//            private Double baseHeight;//墩基底高
//            private String drawNo;//墩台定型图号
//            private Double maxScourline;//最大冲刷线
//            private String material;//墩材质
//            private String baseType;//墩基础式样
//            private String basematerial;//墩基础材质
//            private String baseGeology;//墩基底地质
//            private Catalog cat;//所属类型

//            protected String gclsId; // 地理信息分类码
//            protected String eclsId; // 资产设备分类码
//            protected String gcode; // 地理信息顺序号
//            protected String ecode; // 资产设备顺序号
//            protected String centerM; // 中心里程
//            ls.add("id");
            ls.add("eclsId");
            ls.add("ecode");
            ls.add("gclsId");
            ls.add("gcode");

            ls.add("bridgeName");//桥梁名称
            
            ls.add("pnumber");
            ls.add("designM");
            ls.add("centerM");
            ls.add("type");
            ls.add("pWidthth");
            ls.add("pHeight");
            ls.add("pLength");
            ls.add("hollow");
            ls.add("hwidth");
            ls.add("loss");
            ls.add("topHeight");
            ls.add("startM");
            ls.add("endM");

            InputStream is = new FileInputStream(getFilepath(attachment));
            List<Map<String, Object>> res = ExcelUtils.getImportData(is, ls);

            Line line = new Line();
            line.setId(1L);
            Catalog catalog = new Catalog(60L);
            for(int i=0;i<res.size();i++) {
                Pier entity = new Pier();
                BeanUtil.transMap2Bean2(res.get(i),entity);
//                entity.setCat(catalog);
                
                catalog = mCatalogService.getCatalogByCode(entity.getEclsId());
                if(catalog.getId()!=null){
                	entity.setCat(catalog);
                }
                
                //获取所有的桥梁类型
                List<Bridge> listbri = bridgeDao.findAllList();
                String bridgeName = (res.get(i).get("bridgeName")==null)?"":res.get(i).get("bridgeName").toString();
                //循环桥梁数据，匹配数据里面的桥梁数据
                for(int j=0;j<listbri.size();j++){
                	if(bridgeName.equals(listbri.get(j).getBridgeName())){
                		entity.setBridge(listbri.get(j));
                		break;
                	}
                	
                }


                //entity.setLines(line);
                pierDao.clear();
                pierDao.save(entity);
//                getSession().update(entity);
                pierDao.flush();
            }
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public void importBearingplatform(Attachment attachment){
        try {
            List<String> ls = new ArrayList<String>();
//        	private Long pnumber;// 承台层数
//        	private String hwd;// 承台长宽高
//        	private Double loss;// 承台圬工方
//        	private String designM; // 设计里程
//        	private String startM;
//        	private String endM;
//        	private Catalog cat;//所属类型
//        	private AssetCard ass;//固资卡片
//        	private Bridge bridge;//所属桥梁
//        	private Pier pier;//所属墩身
//        	private Double beaplfTopHeight;//承台顶高
//        	private Double beaplfBottomHeight;//承台底高
//        	private Double lengthSequence1;//长度序列1
//        	private Double lengthSequence2;//长度序列2
//        	private Double lengthSequence3;//长度序列3
//        	private Double widthSequence1;//宽度序列1
//        	private Double widthSequence2;//宽度序列2
//        	private Double widthSequence3;//宽度序列3
//        	private Double heightSequence1;//高度序列1
//        	private Double heightSequence2;//高度序列2
//        	private Double heightSequence3;//高度序列3
            ls.add("eclsId");
            ls.add("ecode");
            ls.add("gclsId");
            ls.add("gcode");

            ls.add("bridgeName");//桥梁名称
            ls.add("pierNum");//墩台号
            
            ls.add("designM");
            ls.add("centerM");
            ls.add("startM");
            ls.add("endM");
            
            ls.add("beaplfTopHeight");
            ls.add("beaplfBottomHeigh");
            ls.add("pnumber");
            
            
            ls.add("widthSequence1");
            ls.add("widthSequence2");
            ls.add("widthSequence3");
            ls.add("heightSequence1");
            ls.add("heightSequence2");
            ls.add("heightSequence3");
            ls.add("lengthSequence1");
            ls.add("lengthSequence2");
            ls.add("lengthSequence3");
            
            InputStream is = new FileInputStream(getFilepath(attachment));
            List<Map<String, Object>> res = ExcelUtils.getImportData(is, ls);

            Line line = new Line();
            line.setId(1L);
            Catalog catalog = new Catalog(61L);
            for(int i=0;i<res.size();i++) {
            	BearingPlatform entity = new BearingPlatform();
                BeanUtil.transMap2Bean2(res.get(i),entity);
//                entity.setCat(catalog);
                
                catalog = mCatalogService.getCatalogByCode(entity.getEclsId());
                if(catalog.getId()!=null){
                	entity.setCat(catalog);
                }
                
                //获取所有的桥梁类型
                List<Bridge> listbri = bridgeDao.findAllList();
                String bridgeName = (res.get(i).get("bridgeName")==null)?"":res.get(i).get("bridgeName").toString();
                //循环桥梁数据，匹配数据里面的桥梁数据
                for(int j=0;j<listbri.size();j++){
                	if(bridgeName.equals(listbri.get(j).getBridgeName())){
                		entity.setBridge(listbri.get(j));
                		
                        //获取所有的墩台类型
                        List<Pier> listpier = pierDao.findAllListByBri(listbri.get(j).getId());
                        String pierNum = (res.get(i).get("pierNum")==null)?"":res.get(i).get("pierNum").toString();
                        //循环桥梁数据，匹配数据里面的桥梁数据
                        for(int k=0;k<listpier.size();k++){
                        	if(pierNum.equals(listpier.get(k).getPnumber())){
                        		entity.setPier(listpier.get(k));
                        		break;
                        	}
                        	
                        }
                		
                		break;
                	}
                	
                }
                
                //entity.setLines(line);
                bearingPlatformDao.clear();
                bearingPlatformDao.save(entity);
                bearingPlatformDao.flush();
            }
        }catch (Exception e){
            e.printStackTrace();
        }
    }
    

    public void importGrider(Attachment attachment){
        try {
            List<String> ls = new ArrayList<String>();
//            private String type;// 梁类型
//            private Double length;// 梁长
//            private Double sildwidth;// 缝宽
//            private Double width;// 梁宽
//            private Double height;// 梁标高
//            private Double loss;// 梁圬工方
//            private String startM;// 起始里程
//            private String endM;// 终点里程
//            private Catalog cat;//所属类型
//            private AssetCard ass;
//            private Bridge bridge; //所属桥梁
//            private Pier pier;//所属墩身
//            private Double spans;//跨度
//            private String changeYear;//换梁年代
//            private String pattern;//梁式样
//            private String patternCode;//梁式样代码
//            private Double baseHeight;//梁底高
//            private String hole;//孔别
//            private String layYear;//枕铺设年度
//            private String drawNo;//定型图号
//            private String designLimits;//设计限界
//            private String kinds;//梁种类
//            private Double clearHole;//净孔
//            private Double weight;//梁重
//            private Double volume;//梁体积
//            private Double maincenterSpace;//主梁中心距
//            private Double ordinatecenterSpace;//纵梁中心距
//            private Double ordinateHeight;//纵梁高
//            private String desliveload;//设计活载
//            private Double carryCoefficient;//承载系数
//            private String controlPostion;//控制部位
//            private String paintingYear;//钢梁涂装年
//            private Integer bend;//挠度
//            private String fastenerType;//扣件类型
//            private Integer fastenerNum;//扣件数量
//            private String plateType;//轨枕类型
//            private Integer plateNum;//轨枕数量
//            private String steelrailType;//钢轨类型
//            private String glzfcxjg;//钢梁振幅超限加固
//            private Integer rcbulkNum;//混凝土梁横隔板数
//            private String rcbulkJoin;//混凝土梁横隔板连接
//            private String limitEq;//梁端限位装置
//            private String rcbzljg;//混凝土并置梁加固
//            private Double dzcwidth;//道碴槽宽度
//            private Double thickness;//圬工梁跨中道碴厚度
//            private String footwalkMaterial;//人行道材质
//            private Double footwalkWidth;//人行道宽
//            private String fixcheckEq;//固定检查设备
//            private String gtly;//公铁两用

            ls.add("eclsId");
            ls.add("ecode");
            ls.add("gclsId");
            ls.add("gcode");

            ls.add("bridgeName");//桥梁名称
            ls.add("pierNum");//墩台号
            ls.add("type");//梁类型

            ls.add("length");
            ls.add("sildwidth");
            ls.add("width");
            ls.add("height");
            ls.add("baseHeight");
            ls.add("startM");
            ls.add("endM");
            ls.add("centerM");
            
            InputStream is = new FileInputStream(getFilepath(attachment));
            List<Map<String, Object>> res = ExcelUtils.getImportData(is, ls);

            Line line = new Line();
            line.setId(1L);
            Catalog catalog = new Catalog(59L);
            for(int i=0;i<res.size();i++) {
                Grider entity = new Grider();
                BeanUtil.transMap2Bean2(res.get(i),entity);
//                entity.setCat(catalog);
                
                catalog = mCatalogService.getCatalogByCode(entity.getEclsId());
                if(catalog.getId()!=null){
                	entity.setCat(catalog);
                }
                
                //获取所有的桥梁类型
                List<Bridge> listbri = bridgeDao.findAllList();
                String bridgeName = (res.get(i).get("bridgeName")==null)?"":res.get(i).get("bridgeName").toString();
                //循环桥梁数据，匹配数据里面的桥梁数据
                for(int j=0;j<listbri.size();j++){
                	if(bridgeName.equals(listbri.get(j).getBridgeName())){
                		entity.setBridge(listbri.get(j));
                		
                        //获取所有的墩台类型
                        List<Pier> listpier = pierDao.findAllListByBri(listbri.get(j).getId());
                        String pierNum = (res.get(i).get("pierNum")==null)?"":res.get(i).get("pierNum").toString();
                        //循环桥梁数据，匹配数据里面的桥梁数据
                        for(int k=0;k<listpier.size();k++){
                        	if(pierNum.equals(listpier.get(k).getPnumber())){
                        		entity.setPier(listpier.get(k));
                        		break;
                        	}
                        	
                        }
                		
                		break;
                	}
                	
                }
                
                
                //桥梁类型
                List<Dict> listdict = DictUtils.getDictList("biz_grider_type");
                String type = (res.get(i).get("type")==null)?"":res.get(i).get("type").toString();
                for(int l=0;l<listdict.size();l++){
                	if(type.equals(listdict.get(l).getLabel())){
                		entity.setType(listdict.get(l).getValue());
                		break;
                	}
                }
                
                //entity.setLines(line);
                griderDao.clear();
                griderDao.save(entity);
                griderDao.flush();
            }
        }catch (Exception e){
            e.printStackTrace();
        }
    }
    
}
