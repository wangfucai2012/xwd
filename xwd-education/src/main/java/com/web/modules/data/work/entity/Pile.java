package com.web.modules.data.work.entity;

import com.web.commons.entity.CodeEntity;
import com.web.modules.sys.entity.Catalog;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.*;

import javax.persistence.Entity;
import javax.persistence.*;
import javax.persistence.Table;

/**
 *  @description:桩基
 *  @author wangjianwei 
 *  @create Date:2016年4月20日 上午9:19:27
 */
@Entity
@Table(name = "data_work_pile")
@DynamicInsert
@DynamicUpdate
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class Pile extends CodeEntity {
	private static final long serialVersionUID = 1L;
	private Long id;// id
	private String pnumber;// 钻孔数
	private Double diaM;// 钻孔直径
	private Double dlength;// 钻孔长
	private Double array;// 桩基排列
	private Double loss;// 桩基圬工方
	private Bridge bridge;//所属桥梁
	private String pierNo;//所在墩号
	private String startM;
	private String endM;
	private Pier pier;//所属墩身
	private Catalog cat;//所属类型
	
	@Id
	@TableGenerator(name = "web_tab_pk", table = "web_tab_pk", pkColumnName = "G_KEY", pkColumnValue = "data_work_pile", valueColumnName = "G_VALUE", allocationSize = 1)
	@GeneratedValue(strategy = GenerationType.TABLE, generator = "web_tab_pk")
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
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
	@JoinColumn(name = "pier_id")
	@NotFound(action = NotFoundAction.IGNORE)
	public Pier getPier() {
		return pier;
	}

	public void setPier(Pier pier) {
		this.pier = pier;
	}

	public String getPnumber() {
		return pnumber;
	}
	public void setPnumber(String pnumber) {
		this.pnumber = pnumber;
	}
	public Double getDiaM() {
		return diaM;
	}
	public void setDiaM(Double diaM) {
		this.diaM = diaM;
	}
	public Double getDlength() {
		return dlength;
	}
	public void setDlength(Double dlength) {
		this.dlength = dlength;
	}
	public Double getArray() {
		return array;
	}
	public void setArray(Double array) {
		this.array = array;
	}
	public Double getLoss() {
		return loss;
	}
	public void setLoss(Double loss) {
		this.loss = loss;
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

	public String getPierNo() {
		return pierNo;
	}
	public void setPierNo(String pierNo) {
		this.pierNo = pierNo;
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
