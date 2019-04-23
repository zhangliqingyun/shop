package cn.shop.report.vo;

import java.util.Date;

/**
 * 举报实体类
 * @author 张立增
 *
 */
public class Report {
	
	private Integer id;
	private String type;      //举报类型
	private String content;//举报内容
	private String reportname;//举报人
	private Date reportdate;//举报时间
	private String productid;//举报的商品id
	private String isdeal;   //是否处理了，处理为1，未处理为0
	
	public String getIsdeal() {
		return isdeal;
	}
	public void setIsdeal(String isdeal) {
		this.isdeal = isdeal;
	}
	public String getProductid() {
		return productid;
	}
	public void setProductid(String productid) {
		this.productid = productid;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getReportname() {
		return reportname;
	}
	public void setReportname(String reportname) {
		this.reportname = reportname;
	}
	public Date getReportdate() {
		return reportdate;
	}
	public void setReportdate(Date reportdate) {
		this.reportdate = reportdate;
	}
	
	
	
}
