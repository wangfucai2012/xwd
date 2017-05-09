package com.web.modules.sys.entity;

import com.google.common.collect.Lists;
import com.web.commons.entity.DataEntity;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.*;
import org.hibernate.validator.constraints.Length;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.*;
import javax.persistence.OrderBy;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import java.util.List;

/**
 * 机构tree，类似于原来的Department
 * 
 * @author nanxiaoqiang
 * 
 * @version 2014年1月31日
 * 
 */
@Entity
@Table(name = "sys_office")
@DynamicInsert
@DynamicUpdate
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class Office extends DataEntity {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Long id; // 编号
	private Office parent; // 父级编号
	private String parentIds; // 所有父级编号
	// private String code; // 机构编码
	private String name; // 机构名称
	private String type; // 机构类型（1：公司；2：部门；3：小组）
	private String grade; // 机构等级（1：一级；2：二级；3：三级；4：四级）
	private String address; // 联系地址
	private String zipCode; // 邮政编码
	private String master; // 负责人
	private String phone; // 电话
	private String fax; // 传真
	private String email; // 邮箱

	/**
	 * Add by Nemo on 2016/06/14
	 */
	private String startM; //起始里程
	private String endM;//终止里程

	/**
	 * Add by wanghu on 2016/06/14
	 */
	private String profession;//所属专业
	
	private List<User> userList = Lists.newArrayList(); // 拥有用户列表
	private List<Office> childList = Lists.newArrayList();// 拥有子机构列表

	public Office() {
		super();
		this.sort = SORT_FLAG_DEFAULT;
	}

	public Office(Long id) {
		this();
		this.id = id;
	}

	@Id
	@TableGenerator(name = "web_tab_pk", table = "web_tab_pk", pkColumnName = "G_KEY", pkColumnValue = "sys_office", valueColumnName = "G_VALUE", allocationSize = 1)
	@GeneratedValue(strategy = GenerationType.TABLE, generator = "web_tab_pk")
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "parent_id")
	@NotFound(action = NotFoundAction.IGNORE)
	@NotNull
	public Office getParent() {
		return parent;
	}

	public void setParent(Office parent) {
		this.parent = parent;
	}

	public String getParentIds() {
		return parentIds;
	}

	public void setParentIds(String parentIds) {
		this.parentIds = parentIds;
	}

	// @Length(min = 0, max = 100)
	// public String getCode() {
	// return code;
	// }
	//
	// public void setCode(String code) {
	// this.code = code;
	// }

	@Length(min = 1, max = 100)
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Length(min = 1, max = 1)
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Length(min = 1, max = 3)
	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	@Length(min = 0, max = 255)
	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Length(min = 0, max = 100)
	public String getZipCode() {
		return zipCode;
	}

	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}

	@Length(min = 0, max = 100)
	public String getMaster() {
		return master;
	}

	public void setMaster(String master) {
		this.master = master;
	}

	@Length(min = 0, max = 200)
	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@Length(min = 0, max = 200)
	public String getFax() {
		return fax;
	}

	public void setFax(String fax) {
		this.fax = fax;
	}

	@Length(min = 0, max = 200)
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@OneToMany(cascade = { CascadeType.PERSIST, CascadeType.MERGE,
			CascadeType.REMOVE }, fetch = FetchType.LAZY, mappedBy = "office")
	@Where(clause = "del_flag='" + DEL_FLAG_NORMAL + "'")
	@OrderBy(value = "id")
	@NotFound(action = NotFoundAction.IGNORE)
	@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
	public List<User> getUserList() {
		return userList;
	}

	public void setUserList(List<User> userList) {
		this.userList = userList;
	}

	@OneToMany(cascade = { CascadeType.PERSIST, CascadeType.MERGE,
			CascadeType.REMOVE }, fetch = FetchType.LAZY, mappedBy = "parent")
	@Where(clause = "del_flag='" + DEL_FLAG_NORMAL + "'")
	@OrderBy(value = "sort")
	@NotFound(action = NotFoundAction.IGNORE)
	@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
	public List<Office> getChildList() {
		return childList;
	}

	public void setChildList(List<Office> childList) {
		this.childList = childList;
	}

	@Transient
	public static void sortList(List<Office> list, List<Office> sourcelist,
                                Long parentId) {
		for (int i = 0; i < sourcelist.size(); i++) {
			Office e = sourcelist.get(i);
			if (e.getParent() != null && e.getParent().getId() != null
					&& e.getParent().getId().equals(parentId)) {
				list.add(e);
				// 判断是否还有子节点, 有则继续获取子节点
				for (int j = 0; j < sourcelist.size(); j++) {
					Office child = sourcelist.get(j);
					if (child.getParent() != null
							&& child.getParent().getId() != null
							&& child.getParent().getId().equals(e.getId())) {
						sortList(list, sourcelist, e.getId());
						break;
					}
				}
			}
		}
	}

	@Transient
	public boolean isRoot() {
		return isRoot(this.id);
	}

	@Transient
	public static boolean isRoot(Long id) {
		return id != null && id.equals(1L);
	}

	public String getStartM() {
		return startM;
	}

	public void setStartM(String startM) {
		this.startM = startM;
	}

	public String getEndM() {
		return endM;
	}

	public void setEndM(String endM) {
		this.endM = endM;
	}

	public String getProfession() {
		return profession;
	}

	public void setProfession(String profession) {
		this.profession = profession;
	}
	
}
