package cn.shop.report.vo;

import java.util.Date;

/**
 * �ٱ�ʵ����
 * @author ������
 *
 */
public class Report {
	
	private Integer id;
	private String type;      //�ٱ�����
	private String content;//�ٱ�����
	private String reportname;//�ٱ���
	private Date reportdate;//�ٱ�ʱ��
	private String productid;//�ٱ�����Ʒid
	private String isdeal;   //�Ƿ����ˣ�����Ϊ1��δ����Ϊ0
	
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
