package com.web.commons.entity;

import com.web.modules.sys.entity.Office;
import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;

import javax.persistence.*;
import java.io.Serializable;

/**
 *  @description 对DataEntity类的封装 用于各专业实体
 *  @author wangjianwei 
 *  @create Date:2016年4月20日 上午10:41:30
 */
@MappedSuperclass
public abstract class CodeEntity extends DataEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	protected String gclsId; // 地理信息分类码
	protected String eclsId; // 资产设备分类码
	protected String gcode; // 地理信息顺序号
	protected String ecode; // 资产设备顺序号
	protected String centerM; // 中心里程
	protected Office offc;//组织机构

	/**
	 * Add by Nemo on 2016/06/14
	 * 添加附件，这里的附件保存形式为附件 id1,id2,id3...需要的时候截取
	 */
	private String imgAttachments;//图片附件
	private String attachments; //设备图纸
	private String docAttchments;//说明文档
	private String technologyAttchments;//技术规范
	//需要删除的附件列表，该字段不会映射到数据库
	private String delAttch;

	/**
	 * Add by Nemo on 2016/06/23
	 */
	private String label;//统一名称

	/**
	 *  Add by Nemo on 2016/06/23
	 *  Gis查询中心里程的时候用的临时变量，不会映射到数据库
	 */
	private String mstart;
	private String mend;
	
	public String getGclsId() {
		return gclsId;
	}
	public void setGclsId(String gclsId) {
		this.gclsId = gclsId;
	}
	public String getEclsId() {
		return eclsId;
	}
	public void setEclsId(String eclsId) {
		this.eclsId = eclsId;
	}
	public String getGcode() {
		return gcode;
	}
	public void setGcode(String gcode) {
		this.gcode = gcode;
	}
	public String getEcode() {
		return ecode;
	}
	public void setEcode(String ecode) {
		this.ecode = ecode;
	}
	public String getCenterM() {
		return centerM;
	}
	public void setCenterM(String centerM) {
		this.centerM = centerM;
	}

	public String getImgAttachments() {
		return imgAttachments;
	}

	public void setImgAttachments(String imgAttachments) {
		this.imgAttachments = imgAttachments;
	}

	public String getAttachments() {
		return attachments;
	}

	public void setAttachments(String attachments) {
		this.attachments = attachments;
	}

	@Transient
	public String getDelAttch() {
		return delAttch;
	}

	public void setDelAttch(String delAttch) {
		this.delAttch = delAttch;
	}

	public String getDocAttchments() {
		return docAttchments;
	}

	public void setDocAttchments(String docAttchments) {
		this.docAttchments = docAttchments;
	}

	public String getTechnologyAttchments() {
		return technologyAttchments;
	}

	public void setTechnologyAttchments(String technologyAttchments) {
		this.technologyAttchments = technologyAttchments;
	}

	public String getLabel() {
		return label;
	}

	public void setLabel(String label) {
		this.label = label;
	}

	@Transient
	public String getMstart() {
		return mstart;
	}

	public void setMstart(String mstart) {
		this.mstart = mstart;
	}

	@Transient
	public String getMend() {
		return mend;
	}

	public void setMend(String mend) {
		this.mend = mend;
	}
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "offc_id")
	@NotFound(action = NotFoundAction.IGNORE)
	public Office getOffc() {
		return offc;
	}
	public void setOffc(Office offc) {
		this.offc = offc;
	}
}
