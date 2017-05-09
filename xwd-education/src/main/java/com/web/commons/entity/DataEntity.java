package com.web.commons.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.web.commons.security.UserUtils;
import com.web.modules.sys.entity.Dict;
import com.web.modules.sys.entity.Office;
import com.web.modules.sys.entity.User;
import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;
import org.hibernate.search.annotations.*;
import org.hibernate.search.annotations.Index;
import org.hibernate.validator.constraints.Length;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * 一些基础的数据Entity类的封装
 * 
 * @author nanxiaoqiang
 * 
 * @version 2014年1月29日
 * 			2014年2月3日 加上了机构
 * 				
 * 
 */
@MappedSuperclass
public abstract class DataEntity extends BaseEntity implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	protected String remark; // 备注
	protected Office createOffice;// 创建机构
	protected User createBy; // 创建者
	protected Date createDate;// 创建日期
	protected Office updateOffice;// 更新机构
	protected User updateBy; // 更新者
	protected Date updateDate;// 更新日期
	protected String delFlag; // 删除标记（0：正常；1：删除；2：审核）
	protected Float sort;// 排序(默认0.0F，越大越靠后)
	protected Dict dictype;// 分类
	protected String code; // 编码
	
	public DataEntity() {
		super();
		delFlag = DEL_FLAG_NORMAL;// 给删除标记默认值
		sort = SORT_FLAG_DEFAULT;// 给排序默认值
	}

	/**
	 * 长度限制，默认都给了4000的最大值，为了方便存储中文文字,如果是Oracle最好把数据库的默认改为CHAR
	 * 
	 * @return
	 */
	@Length(min = 0, max = 4000)
	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	@JsonIgnore
	@ManyToOne(fetch = FetchType.LAZY)
	@NotFound(action = NotFoundAction.IGNORE)
	public User getCreateBy() {
		return createBy;
	}

	public void setCreateBy(User createBy) {
		this.createBy = createBy;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	@JsonIgnore
	@ManyToOne(fetch = FetchType.LAZY)
	@NotFound(action = NotFoundAction.IGNORE)
	public User getUpdateBy() {
		return updateBy;
	}

	public void setUpdateBy(User updateBy) {
		this.updateBy = updateBy;
	}

	

	/**
	 * 内涵配置hibernate的搜索,只精确到天??
	 * 
	 * @return
	 */
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@Field(index = Index.YES, analyze = Analyze.NO, store = Store.YES)
	@DateBridge(resolution = Resolution.DAY)
	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	@Length(min = 1, max = 1)
	@Field(index = Index.YES, analyze = Analyze.NO, store = Store.YES)
	public String getDelFlag() {
		return delFlag;
	}

	public void setDelFlag(String delFlag) {
		this.delFlag = delFlag;
	}

	// @Field(index=Index.YES, analyze=Analyze.NO, store=Store.YES)
	public Float getSort() {
		return sort;
	}

	public void setSort(Float sort) {
		this.sort = sort;
	}

	@JsonIgnore
	@ManyToOne(fetch = FetchType.LAZY)
	@NotFound(action = NotFoundAction.IGNORE)
	public Office getCreateOffice() {
		return createOffice;
	}

	public void setCreateOffice(Office createOffice) {
		this.createOffice = createOffice;
	}

	@JsonIgnore
	@ManyToOne(fetch = FetchType.LAZY)
	@NotFound(action = NotFoundAction.IGNORE)
	public Office getUpdateOffice() {
		return updateOffice;
	}

	public void setUpdateOffice(Office updateOffice) {
		this.updateOffice = updateOffice;
	}

	@PrePersist
	public void prePersist() {
		User user = UserUtils.getUser();
		if (user.getId() != null) {
			this.createBy = user;
			this.updateBy = user;
			if(user.getOffice() != null && user.getOffice().getId() != null){
				this.createOffice = user.getOffice();
				this.updateOffice = user.getOffice();
			}
		}
		this.updateDate = new Date();
		this.createDate = this.updateDate;
	}

	@PreUpdate
	public void preUpdate() {
		User user = UserUtils.getUser();
		if (user.getId() != null) {
			this.updateBy = user;
			if(user.getOffice() != null && user.getOffice().getId() != null){
				this.updateOffice = user.getOffice();
			}
		}
		this.updateDate = new Date();
	}

	@JsonIgnore
	@ManyToOne(fetch = FetchType.LAZY)
	@NotFound(action = NotFoundAction.IGNORE)
	public Dict getDictype() {
		return dictype;
	}

	public void setDictype(Dict dictype) {
		this.dictype = dictype;
	}

	/**
	 * @return the code
	 */
	public String getCode() {
		return code;
	}

	/**
	 * @param code the code to set
	 */
	public void setCode(String code) {
		this.code = code;
	}
}
