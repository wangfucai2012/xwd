package com.web.modules.sys.entity;


import com.fasterxml.jackson.annotation.JsonIgnore;
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
import java.util.List;

/**
 * 目录实体
 * @author Nemo
 *
 */
@Entity
@Table(name = "sys_catalog")
@DynamicInsert
@DynamicUpdate
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class Catalog extends DataEntity {

	private static final long serialVersionUID = 1L;

	private Long id; // 编号
	private int menuType;//目录等级
	private String names; // 名称
	private String numbers; // 分类编码   // - 现在用DataEntity的code字段代替
	private String types; // 分类类型
	private String levels; // 分类级别
	private String hrefs ; //连接地址
	private String orders="10.0"; //排序  // -现在用DataEntiy的sort字段
	private String objects; // 分类对象

	private int orverwiteFlag = 1;//是否可以修改：1,可以 0 ，不可以

	private Catalog parents; // 父级

	private List<Catalog> childList = Lists.newArrayList();// 拥有子列表
	
	/**
	 * Add 地理信息系统需要的字段
	 */
	private String glayerName; //地理信息图层名称
	private Long glayerId;//地理信息图层ID
	private String acName;//全类名

	/**
	 * 2016/05/23 拼接父节点的IDS
	 */
	private String parentIds;
    /**
     * 2016-07-11 关联关系字段
     */
    private String relationIds;

	public Catalog(){
		super();
	}

	public Catalog(Long id){
		super();
		this.id = id;
	}

	@Id
	@TableGenerator(name = "web_tab_pk", table = "web_tab_pk", pkColumnName = "G_KEY", pkColumnValue = "sys_catalog", valueColumnName = "G_VALUE", allocationSize = 1)
	@GeneratedValue(strategy = GenerationType.TABLE, generator = "web_tab_pk")
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}


	public int getMenuType() {
		return menuType;
	}

	public void setMenuType(int menuType) {
		this.menuType = menuType;
	}

	@Length(min = 1, max = 100)
	public String getNames() {
		return names;
	}

	public void setNames(String names) {
		this.names = names;
	}

	@Length(min = 1, max = 100)
	public String getNumbers() {
		return numbers;
	}

	public void setNumbers(String numbers) {
		this.numbers = numbers;
	}

	@Length(min = 1, max = 100)
	public String getHrefs() {
		return hrefs;
	}

	public void setHrefs(String hrefs) {
		this.hrefs = hrefs;
	}

	@Length(min = 1, max = 100)
	public String getOrders() {
		return orders;
	}

	public void setOrders(String orders) {
		this.orders = orders;
	}

	@Length(min = 0, max = 100)
	public String getObjects() {
		return objects;
	}

	public void setObjects(String objects) {
		this.objects = objects;
	}


	@ManyToOne
	@NotFound(action = NotFoundAction.IGNORE)
	@JsonIgnore
	@JoinColumn(name="parent_id")
	public Catalog getParents() {
		return parents;
	}

	public void setParents(Catalog parents) {
		this.parents = parents;
	}

	@OneToMany(cascade = { CascadeType.PERSIST, CascadeType.MERGE,
			CascadeType.REMOVE }, fetch = FetchType.LAZY, mappedBy = "parents")
	@Where(clause = "del_flag='" + DEL_FLAG_NORMAL + "'")
	@OrderBy(value = "sort")
	@NotFound(action = NotFoundAction.IGNORE)
	@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
	public List<Catalog> getChildList() {
		return childList;
	}

	public void setChildList(List<Catalog> childList) {
		this.childList = childList;
	}

	/**
	 * 重新排序List，得到正确的TreeTable需要的数据
	 * @param list
	 * @param sourcelist
	 * @param parentId
     */
	@Transient
	public static void sortList(List<Catalog> list, List<Catalog> sourcelist,
                                Long parentId) {
		for (int i = 0; i < sourcelist.size(); i++) {
			Catalog e = sourcelist.get(i);
			if (e.getParents() != null && e.getParents().getId() != null
					&& e.getParents().getId().equals(parentId)) {
				list.add(e);
				// 判断是否还有子节点, 有则继续获取子节点
				for (int j = 0; j < sourcelist.size(); j++) {
					Catalog child = sourcelist.get(j);
					if (child.getParents() != null
							&& child.getParents().getId() != null
							&& child.getParents().getId().equals(e.getId())) {
						sortList(list, sourcelist, e.getId());
						break;
					}
				}
			}
		}
	}

	@Length(min = 1, max = 100)
	public String getTypes() {
		return types;
	}

	public void setTypes(String types) {
		this.types = types;
	}

	@Length(min = 1, max = 100)
	public String getLevels() {
		return levels;
	}

	public void setLevels(String levels) {
		this.levels = levels;
	}

	public int getOrverwiteFlag() {
		return orverwiteFlag;
	}

	public void setOrverwiteFlag(int orverwiteFlag) {
		this.orverwiteFlag = orverwiteFlag;
	}


	public String getParentIds() {
		return parentIds;
	}

	public void setParentIds(String parentIds) {
		this.parentIds = parentIds;
	}

	public String getGlayerName() {
		return glayerName;
	}

	public void setGlayerName(String glayerName) {
		this.glayerName = glayerName;
	}

	public Long getGlayerId() {
		return glayerId;
	}

	public void setGlayerId(Long glayerId) {
		this.glayerId = glayerId;
	}

	public String getAcName() {
		return acName;
	}

	public void setAcName(String acName) {
		this.acName = acName;
	}

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public String getRelationIds() {
        return relationIds;
    }

    public void setRelationIds(String relationIds) {
        this.relationIds = relationIds;
    }
}