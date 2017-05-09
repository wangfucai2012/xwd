package com.web.modules.data.work.entity;

import com.web.commons.entity.CodeEntity;
import com.web.modules.sys.entity.Catalog;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.*;

import javax.persistence.Entity;
import javax.persistence.*;
import javax.persistence.Table;

/**
 *  @description:支座
 *  @author wangjianwei 
 *  @create Date:2016年4月20日 上午9:37:16
 */
@Entity
@Table(name = "data_work_bearg")
@DynamicInsert
@DynamicUpdate
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class Bearing extends CodeEntity {
	private static final long serialVersionUID = 1L;
	private Long id;// id
	private String pierNo;//墩身编号
	private Bridge bridge; //所属桥梁
	private String heights;//支座高度
	private String startM;
	private String endM;
	private Pier pier;//所属墩身
	private String type;//支座类型
	private Integer  numbers;//数量
	private Catalog cat;//所属类型

	@Id
	@TableGenerator(name = "web_tab_pk", table = "web_tab_pk", pkColumnName = "G_KEY", pkColumnValue = "data_work_bearg", valueColumnName = "G_VALUE", allocationSize = 1)
	@GeneratedValue(strategy = GenerationType.TABLE, generator = "web_tab_pk")
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}

	public String getPierNo() {
		return pierNo;
	}
	public void setPierNo(String pierNo) {
		this.pierNo = pierNo;
	}
	@ManyToOne
	@JoinColumn(name = "bridge_id")
	@NotFound(action = NotFoundAction.IGNORE)
	public Bridge getBridge() {
		return bridge;
	}
	public void setBridge(Bridge bridge) {
		this.bridge = bridge;
	}
	public String getHeights() {
		return heights;
	}
	public void setHeights(String heights) {
		this.heights = heights;
	}
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}



	public Integer getNumbers() {
		return numbers;
	}

	public void setNumbers(Integer numbers) {
		this.numbers = numbers;
	}

	@ManyToOne
	@JoinColumn(name = "pier_id")
	@NotFound(action = NotFoundAction.IGNORE)
	public Pier getPier() {
		return pier;
	}

	public void setPier(Pier pier) {
		this.pier = pier;
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
	@JoinColumn(name = "cat_id")
	@NotFound(action = NotFoundAction.IGNORE)
	public Catalog getCat() {
		return cat;
	}
	public void setCat(Catalog cat) {
		this.cat = cat;
	}
}
