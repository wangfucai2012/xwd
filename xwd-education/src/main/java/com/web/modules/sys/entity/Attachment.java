package com.web.modules.sys.entity;

import com.web.commons.entity.DataEntity;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;

/**
 * 附件
 * 
 * @author nanxiaoqiang
 * 
 * @version 2014年2月26日 Happy Birthday！撒花！*★,°*:.☆\(￣▽￣)/$:*.°★* 。
 */
@Entity
@Table(name = "base_attachment")
@DynamicInsert
@DynamicUpdate
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class Attachment extends DataEntity {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Long id; // ID
	private String savePath;// 文件存储路径，最后要带着"/"啊！！！absolute path绝对路径；
	private String saveRelativePath;// 文件存储路径相对路径，其实就是
	// 存储在磁盘中的名字
	// (PS：写法要统一：目前没定
	// A、随机名称+没有后缀名(个人认为这样？？？？？？？)√
	// B、随机名称+.原后缀名
	// C、随机名称+.tmp或者一个随便名称的后缀名
	private String saveName;
	private String fileName;// 原文件名(带后缀名)
	private String fileSuffix;// 原文件后缀名(有点".")如".docx"，可以为null
	private String contentType;// contentType
	private Long fileSize;// 文件大小
	private String fileType;// 上传文件类型:"import"

	@Id
	@TableGenerator(name = "web_tab_pk", table = "web_tab_pk", pkColumnName = "G_KEY", pkColumnValue = "base_attachment", valueColumnName = "G_VALUE", allocationSize = 1)
	@GeneratedValue(strategy = GenerationType.TABLE, generator = "web_tab_pk")
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getSavePath() {
		return savePath;
	}

	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}

	public String getSaveName() {
		return saveName;
	}

	public void setSaveName(String saveName) {
		this.saveName = saveName;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getFileSuffix() {
		return fileSuffix;
	}

	public void setFileSuffix(String fileSuffix) {
		this.fileSuffix = fileSuffix;
	}

	public String getContentType() {
		return contentType;
	}

	public void setContentType(String contentType) {
		this.contentType = contentType;
	}

	public Long getFileSize() {
		return fileSize;
	}

	public void setFileSize(Long fileSize) {
		this.fileSize = fileSize;
	}

	public String getSaveRelativePath() {
		return saveRelativePath;
	}

	public void setSaveRelativePath(String saveRelativePath) {
		this.saveRelativePath = saveRelativePath;
	}

	public String getFileType() {
		return fileType;
	}

	public void setFileType(String fileType) {
		this.fileType = fileType;
	}

}
