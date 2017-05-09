package com.web.modules.sys.entity.dict;


import com.fasterxml.jackson.annotation.JsonIgnore;
import com.web.commons.entity.CodeEntity;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.*;
import org.hibernate.validator.constraints.Length;

import javax.persistence.Entity;
import javax.persistence.*;
import javax.persistence.Table;


/**
 * 铁路局
 * @author Nemo
 */
@Entity
@Table(name = "sys_dict_rail")
@DynamicInsert
@DynamicUpdate
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class Rail extends CodeEntity {
    /**
     *
     */
    private static final long serialVersionUID = 1L;
    public static final String IS_RAIL = "1";//路局
    public static final String IS_DISTRICT = "2";//区段
    private Long id;// id
    private String name;//名称
    private String simpleName;//简称
    private String description;//备注
    private String startM;//起始里程
    private String endM;//终止里程
    private Rail parent;//父ID，（区段父级是路局）
    private String railOrDistrict;//是路局还是区段，1：路局，2：区段
    private String parentIds;//拼接父节点的IDS
    

    @Id
    @TableGenerator(name = "web_tab_pk", table = "web_tab_pk", pkColumnName = "G_KEY", pkColumnValue = "sys_dict_rail", valueColumnName = "G_VALUE", allocationSize = 1)
    @GeneratedValue(strategy = GenerationType.TABLE, generator = "web_tab_pk")
    public Long getId() {
        return id;
    }
    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSimpleName() {
        return simpleName;
    }

    public void setSimpleName(String simpleName) {
        this.simpleName = simpleName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
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
	
	@ManyToOne
	@NotFound(action = NotFoundAction.IGNORE)
	@JsonIgnore
	@JoinColumn(name="parent_id")
	public Rail getParent() {
		return parent;
	}
	public void setParent(Rail parent) {
		this.parent = parent;
	}
	@Length(min = 1, max = 1)
	public String getRailOrDistrict() {
		return railOrDistrict;
	}
	public void setRailOrDistrict(String railOrDistrict) {
		this.railOrDistrict = railOrDistrict;
	}
	public String getParentIds() {
		return parentIds;
	}
	public void setParentIds(String parentIds) {
		this.parentIds = parentIds;
	}
}