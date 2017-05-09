package com.web.modules.data.work.entity;

import com.web.commons.entity.CodeEntity;
import com.web.modules.sys.entity.Catalog;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.*;

import javax.persistence.Entity;
import javax.persistence.*;
import javax.persistence.Table;

/**
 *  @description:承台
 *  @author wangjianwei 
 *  @create Date:2016年4月20日 上午9:25:20
 */
@Entity
@Table(name = "data_work_beaplf")
@DynamicInsert
@DynamicUpdate
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class BearingPlatform extends CodeEntity {
	private static final long serialVersionUID = 1L;
	private Long id;// id
	private Long pnumber;// 承台层数
	private String hwd;// 承台长宽高
	private Double loss;// 承台圬工方
	private String designM; // 设计里程
	private String startM;
	private String endM;
	private Catalog cat;//所属类型
	private Bridge bridge;//所属桥梁
	private Pier pier;//所属墩身
	private Double beaplfTopHeight;//承台顶高
	private Double beaplfBottomHeight;//承台底高
	private Double lengthSequence1;//长度序列1
	private Double lengthSequence2;//长度序列2
	private Double lengthSequence3;//长度序列3
	private Double widthSequence1;//宽度序列1
	private Double widthSequence2;//宽度序列2
	private Double widthSequence3;//宽度序列3
	private Double heightSequence1;//高度序列1
	private Double heightSequence2;//高度序列2
	private Double heightSequence3;//高度序列3

	@Id
	@TableGenerator(name = "web_tab_pk", table = "web_tab_pk", pkColumnName = "G_KEY", pkColumnValue = "data_work_beaplf", valueColumnName = "G_VALUE", allocationSize = 1)
	@GeneratedValue(strategy = GenerationType.TABLE, generator = "web_tab_pk")
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Double getBeaplfTopHeight() {
		return beaplfTopHeight;
	}
	public void setBeaplfTopHeight(Double beaplfTopHeight) {
		this.beaplfTopHeight = beaplfTopHeight;
	}
	public Double getBeaplfBottomHeight() {
		return beaplfBottomHeight;
	}
	public void setBeaplfBottomHeight(Double beaplfBottomHeight) {
		this.beaplfBottomHeight = beaplfBottomHeight;
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

	public Long getPnumber() {
		return pnumber;
	}
	public void setPnumber(Long pnumber) {
		this.pnumber = pnumber;
	}


	public String getHwd() {
		return hwd;
	}
	public void setHwd(String hwd) {
		this.hwd = hwd;
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

	@ManyToOne
	@JoinColumn(name = "cat_id")
	@NotFound(action = NotFoundAction.IGNORE)
	public Catalog getCat() {
		return cat;
	}
	public void setCat(Catalog cat) {
		this.cat = cat;
	}
	public String getDesignM() {
		return designM;
	}
	public void setDesignM(String designM) {
		this.designM = designM;
	}
	public Double getLengthSequence1() {
		return lengthSequence1;
	}
	public void setLengthSequence1(Double lengthSequence1) {
		this.lengthSequence1 = lengthSequence1;
	}
	public Double getLengthSequence2() {
		return lengthSequence2;
	}
	public void setLengthSequence2(Double lengthSequence2) {
		this.lengthSequence2 = lengthSequence2;
	}
	public Double getLengthSequence3() {
		return lengthSequence3;
	}
	public void setLengthSequence3(Double lengthSequence3) {
		this.lengthSequence3 = lengthSequence3;
	}
	public Double getWidthSequence1() {
		return widthSequence1;
	}
	public void setWidthSequence1(Double widthSequence1) {
		this.widthSequence1 = widthSequence1;
	}
	public Double getWidthSequence2() {
		return widthSequence2;
	}
	public void setWidthSequence2(Double widthSequence2) {
		this.widthSequence2 = widthSequence2;
	}
	public Double getWidthSequence3() {
		return widthSequence3;
	}
	public void setWidthSequence3(Double widthSequence3) {
		this.widthSequence3 = widthSequence3;
	}
	public Double getHeightSequence1() {
		return heightSequence1;
	}
	public void setHeightSequence1(Double heightSequence1) {
		this.heightSequence1 = heightSequence1;
	}
	public Double getHeightSequence2() {
		return heightSequence2;
	}
	public void setHeightSequence2(Double heightSequence2) {
		this.heightSequence2 = heightSequence2;
	}
	public Double getHeightSequence3() {
		return heightSequence3;
	}
	public void setHeightSequence3(Double heightSequence3) {
		this.heightSequence3 = heightSequence3;
	}
}
