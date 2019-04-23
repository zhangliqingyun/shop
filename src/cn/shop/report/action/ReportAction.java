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
 * 举报类的action层
 * @author 张立增
 *
 */
public class ReportAction extends ActionSupport implements ModelDriven<Report>{

	//注入模型驱动需要的类
	private Report report = new Report();
	
	//注入service
	private ReportService reportService;
	
	//接收分页的page
	private Integer page;
	
	//注入商品的service
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
	
	//商品下架操作
	public String soldout(){
		//更改举报的处理标志为1
		report = reportService.findById(report.getId());
		report.setIsdeal("1");  //设置为处理了
		reportService.update(report);
		//更改商品的上架标志为0
		Product updateProduct = productService.findByPid(Integer.parseInt(report.getProductid()));
		updateProduct.setShelves(0);  
		productService.update(updateProduct); 
		return "soldout";
	}
	
	//查询所有的举报信息带分页的方法
	public String list(){
		PageBean<Report> pageBean = new PageBean<Report>();
		pageBean = reportService.findListByPage(page);
		ActionContext.getContext().getValueStack().set("pageBean",pageBean);    
		return "list";
	}
	//保存举报信息的方法
	public String save(){
		report.setReportdate(new Date());   
		report.setIsdeal("0");
		reportService.save(report);
		return NONE;
	}
	
	

}
