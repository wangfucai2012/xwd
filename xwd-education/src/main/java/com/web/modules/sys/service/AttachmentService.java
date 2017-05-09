package com.web.modules.sys.service;

import com.google.common.collect.Lists;
import com.web.commons.config.Global;
import com.web.commons.service.BaseService;
import com.web.modules.sys.dao.AttachmentDao;
import com.web.modules.sys.entity.Attachment;
import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * 
 * @author nanxiaoqiang
 * 
 */
@Service
@Transactional(readOnly = true)
public class AttachmentService extends BaseService {
	@Autowired
	private AttachmentDao dao;

	public Attachment get(Long id) {
		return dao.get(id);
	}

	@Transactional(readOnly = false)
	public void save(Attachment entity) {
		dao.clear();
		dao.save(entity);
	}

	/**
	 * 暂时不删除附件，只是更改数据的删除标记
	 * 
	 * @param id
	 */
	@Transactional(readOnly = false)
	public void delete(Long id) {
		dao.deleteById(id);
	}

	/**
	 * 根据得到的Spring上传的附件自动的加载保存
	 * 
	 * @param files
	 * @return List<Attachment>
	 * @throws IllegalStateException
	 * @throws IOException
	 */
	@Transactional(readOnly = false)
	public List<Attachment> saveAllUploadFile(List<MultipartFile> files)
			throws IllegalStateException, IOException {
		if (files == null || files.size() == 0) {
			return null;
		}
		List<Attachment> attachs = Lists.newArrayList();
		String fileToPath = Global.getFileRootPath();
		for (MultipartFile f : files) {
			logger.info(f.getOriginalFilename() + "|" + f.getContentType()
					+ "|" + f.getSize());
			if (!f.isEmpty()) {
				// 判断目录
				String saveRelativePath = new DateTime().toString("yyyyMM");
				String savePath = fileToPath + saveRelativePath;
				File path = new File(savePath);
				// 没有路径就直接创建
				if (!(path.exists() && path.isDirectory())) {
					path.mkdirs();
				}
				// 放到规定目录，用的Spring的自带的transferTo没有用FileUtils（主要是这个类还没写完呢。。。）
				String saveName = System.currentTimeMillis() + "";
				// CommonsMultipartFile cmf = (CommonsMultipartFile) f;
				// cmf.transferTo(dest);
				// FileUtils.moveFile(srcFile, destFile);
				// new File(path + "\\" + saveName).createNewFile();
				f.transferTo(new File(path + "/" + saveName));

				// 然后保存到Attachment
				String fileSuffix = f.getOriginalFilename().substring(
						f.getOriginalFilename().lastIndexOf("."));

				Attachment attach = new Attachment();
				attach.setSaveName(saveName);
				attach.setSavePath(savePath + "/");
				attach.setFileName(f.getOriginalFilename());
				attach.setFileSize(f.getSize());
				attach.setFileSuffix(fileSuffix);
				attach.setContentType(f.getContentType());
				attach.setSaveRelativePath(saveRelativePath + "/");
				attach.setFileType("upload");
				attachs.add(attach);
				dao.save(attach);
			}
		}
		return attachs;
	}

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
			String saveName = System.currentTimeMillis() + "";
			file.transferTo(new File(path + "\\" + saveName));

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
			dao.save(attach);
		}
		return attach;
	}

	/**
	 * 导入文件
	 * 
	 * @param file
	 * @return
	 * @throws IllegalStateException
	 * @throws IOException
	 */
	@Transactional(readOnly = false)
	public Attachment saveImportUploadFile(MultipartFile file)
			throws IllegalStateException, IOException {
		if (file == null) {
			return null;
		}
		String fileToPath = Global.getFileImportRootPath();
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
			String saveName = System.currentTimeMillis() + "";
			file.transferTo(new File(path + "\\" + saveName));

			// 然后保存到Attachment
			String fileSuffix = file.getOriginalFilename().substring(
					file.getOriginalFilename().lastIndexOf("."));

			attach.setSaveName(saveName);
			attach.setSavePath(savePath + "/");
			attach.setFileName(file.getOriginalFilename());
			attach.setFileSize(file.getSize());
			attach.setFileSuffix(fileSuffix);
			attach.setFileType("import");
			attach.setContentType(file.getContentType());
			attach.setSaveRelativePath(saveRelativePath + "/");
			dao.save(attach);
		}
		return attach;
	}

	/**
	 * Add by Nemo on 2016/06/14
	 * 根据附件的IDS获取附件信息列表
	 * @param ids 拼接的IDS，其格式为:"id1,id2,..."
	 * @return
     */
	public List<Attachment> getAttchByIds(String ids){
		List<Attachment> atts = new ArrayList<Attachment>();
		if(ids!=null){
			String attids [] = ids.split(",");
			if(attids!=null && attids.length>0) {
				for (int i = 0; i < attids.length; i++) {
					try { //内部捕获，防止异常中断
						Attachment att = get(Long.parseLong(attids[i]));
						if (att != null) {
							if(Attachment.DEL_FLAG_NORMAL.equals(att.getDelFlag())) {
								atts.add(att);
							}
						}
					}catch (Exception e){
						e.printStackTrace();
					}
				}
			}
		}
		return atts;
	}

	/**
	 * Add by Nemo on 2016/06/14
	 * 拼接图片附件的IDs
	 * @param oldAttIds 原来的ID字符串
	 * @param atts 需要拼接的附件列表
	 * @return 返回形式为：“id1,id2,id3,...”
     */
	public String attchsToStringIds(String oldAttIds,List<Attachment> atts){
		if(oldAttIds==null){
			oldAttIds = "";
		}
		StringBuffer res = new StringBuffer(oldAttIds);
		if(atts!=null) {
			for (Attachment att : atts) {
				res.append(att.getId()+",");
			}
		}
		return res.toString();
	}

	/**
	 * Add by Nemo on 2016/06/15
	 * 根据ID拼接的字符串修改文件删除标志
	 * @param ids 格式为：“id1,id2,id3,...”
	 * @return
     */
	public boolean delAttchByIds(String ids){
		if(ids!=null) {
			String sids[] = ids.split(",");
			if (sids != null && sids.length > 0) {
				try {
					for (int i = 0; i < sids.length; i++) {
						if(sids[i]!=null && !"".equals(sids[i])) {
							delete(Long.parseLong(sids[i]));
						}
					}
					return true;
				} catch (Exception e) {
					e.printStackTrace();
					return false;
				}
			}
		}
		return false;
	}

	/**
	 * Add by Nemo on 2016/06/21
	 * 完全拷贝以上方法，添加附件描述
	 * 根据得到的Spring上传的附件自动的加载保存
	 * @param files
	 * @return List<Attachment>
	 * @throws IllegalStateException
	 * @throws IOException
	 */
	@Transactional(readOnly = false)
	public List<Attachment> saveAllUploadFile(List<MultipartFile> files, String remark)
			throws IllegalStateException, IOException {
		if (files == null || files.size() == 0) {
			return null;
		}
		List<Attachment> attachs = Lists.newArrayList();
		String fileToPath = Global.getFileRootPath();
		for (MultipartFile f : files) {
			logger.info(f.getOriginalFilename() + "|" + f.getContentType()
					+ "|" + f.getSize());
			if (!f.isEmpty()) {
				// 判断目录
				String saveRelativePath = new DateTime().toString("yyyyMM");
				String savePath = fileToPath + saveRelativePath;
				File path = new File(savePath);
				// 没有路径就直接创建
				if (!(path.exists() && path.isDirectory())) {
					path.mkdirs();
				}
				// 放到规定目录，用的Spring的自带的transferTo没有用FileUtils（主要是这个类还没写完呢。。。）
				String saveName = System.currentTimeMillis() + "";
				// CommonsMultipartFile cmf = (CommonsMultipartFile) f;
				// cmf.transferTo(dest);
				// FileUtils.moveFile(srcFile, destFile);
				// new File(path + "\\" + saveName).createNewFile();
				f.transferTo(new File(path + "/" + saveName));

				// 然后保存到Attachment
				String fileSuffix = f.getOriginalFilename().substring(
						f.getOriginalFilename().lastIndexOf("."));

				Attachment attach = new Attachment();
				attach.setRemark(remark); // Add by Nemo on 2016/06/21
				attach.setSaveName(saveName);
				attach.setSavePath(savePath + "/");
				attach.setFileName(f.getOriginalFilename());
				attach.setFileSize(f.getSize());
				attach.setFileSuffix(fileSuffix);
				attach.setContentType(f.getContentType());
				attach.setSaveRelativePath(saveRelativePath + "/");
				attach.setFileType("upload");
				attachs.add(attach);
				dao.save(attach);
			}
		}
		return attachs;
	}

}
