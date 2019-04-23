package cn.shop.report.action;

import java.util.Date;

import cn.shop.product.service.ProductService;
import cn.shop.product.vo.Product;
import cn.shop.report.service.ReportService;
import cn.shop.report.vo.Report;
import cn.shop.utils.PageBean;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

/**
 * �ٱ����action��
 * @author ������
 *
 */
public class ReportAction extends ActionSupport implements ModelDriven<Report>{

	//ע��ģ��������Ҫ����
	private Report report = new Report();
	
	//ע��service
	private ReportService reportService;
	
	//���շ�ҳ��page
	private Integer page;
	
	//ע����Ʒ��service
	private ProductService productService;
	
	public void setProductService(ProductService productService) {
		this.productService = productService;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public Report getModel() {
		return report;   
	}

	public void setReportService(ReportService reportService) {
		this.reportService = reportService;
	}
	
	//��Ʒ�¼ܲ���
	public String soldout(){
		//���ľٱ��Ĵ����־Ϊ1
		report = reportService.findById(report.getId());
		report.setIsdeal("1");  //����Ϊ������
		reportService.update(report);
		//������Ʒ���ϼܱ�־Ϊ0
		Product updateProduct = productService.findByPid(Integer.parseInt(report.getProductid()));
		updateProduct.setShelves(0);  
		productService.update(updateProduct); 
		return "soldout";
	}
	
	//��ѯ���еľٱ���Ϣ����ҳ�ķ���
	public String list(){
		PageBean<Report> pageBean = new PageBean<Report>();
		pageBean = reportService.findListByPage(page);
		ActionContext.getContext().getValueStack().set("pageBean",pageBean);    
		return "list";
	}
	//����ٱ���Ϣ�ķ���
	public String save(){
		report.setReportdate(new Date());   
		report.setIsdeal("0");
		reportService.save(report);
		return NONE;
	}
	
	

}
