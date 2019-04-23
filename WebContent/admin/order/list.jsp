<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<HTML>
	<HEAD>
	    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/image/1.ico"/>
		<meta http-equiv="Content-Language" content="zh-cn">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link href="${pageContext.request.contextPath}/css/Style1.css" rel="stylesheet" type="text/css" />
		<script language="javascript" src="${pageContext.request.contextPath}/js/public.js"></script>
		<script type="text/javascript">  
			function showDetail(oid){
			    //获得div对象
				var div1 = document.getElementById("div"+oid);
				//获取but
				var but1= document.getElementById("but"+oid);
				if(but1.value=="查看订单详情"){
					//1.创建异步请求对象
					var xml=new createXmlHttp();
					//2.设置监听
					
					xml.onreadystatechange = function(){
					
				       if(xml.readyState == 4){
					     if(xml.status == 200){
								div1.innerHTML=xml.responseText;
							}
						}
					}
					//3.打开链接
					xml.open("GET","${pageContext.request.contextPath}/adminOrder_findOrderItem.action?time="+new Date().getTime()+"&oid="+oid,true);
					//4.发送
					xml.send(null);
					but1.value="关闭";
				}else{
					but1.value="查看订单详情";
					div1.innerHTML="";
				}
				
			}
			
			function createXmlHttp(){
		  		var xmlHttp;
		  		try{
		  			xmlHttp=new XMLHttpRequest();
		  		}catch(e){
		  			try{
		  				xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
		  			}catch(e){
		  				try{
		  				xmlHttp=new ActiveXObject("Micosoft.XMLHTTP")
		  				}catch(e){
		  				
		  				}
		  			}
		  		
		  		}	
		  	return xmlHttp;	
          }
		</script>
	</HEAD>
	<body style="background-color:#EDE3D6">  
		<br>
		<form id="Form1" name="Form1" action="${pageContext.request.contextPath}/user/list.jsp" method="post">
			<table cellSpacing="1" cellPadding="0" width="100%" align="center" bgColor="#EDE3D6" border="0">
				<TBODY>
					<tr>
						<td class="ta_01" align="center" bgColor="#F0A050">
							<strong>订单 列 表</strong>
						</TD>
					</tr>
					<tr>
		                <td style="height:30px">  
		                </td>
		            </tr>
					<tr>
						<td class="ta_01" align="center" bgColor="#f5fafe">
							<table cellspacing="0" cellpadding="1" rules="all"
								bordercolor="gray" border="1" id="DataGrid1"
								style="BORDER-RIGHT: gray 1px solid; BORDER-TOP: gray 1px solid; BORDER-LEFT: gray 1px solid; WIDTH: 100%; WORD-BREAK: break-all; BORDER-BOTTOM: gray 1px solid; BORDER-COLLAPSE: collapse; BACKGROUND-COLOR: #f5fafe; WORD-WRAP: break-word">
								<tr
									style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; HEIGHT: 25px; BACKGROUND-COLOR: #F0A050">

									<td align="center" width="10%">
										序号
									</td>
									<td align="center" width="10%">
										订单编号
									</td>
									<td align="center" width="10%">
										订单小计
									</td>
									<td align="center" width="10%">
										姓名
									</td>
									<td align="center" width="10%">
										订单状态
									</td>
									<td align="center" width="10%">
										订单操作
									</td>
									<td width="*" align="center" >
										订单详情
									</td>
								</tr>
								<s:iterator var="order" value="pageBean.list" status="status">
									<s:if test="#status.count % 2 ==0"> 	
											<tr style="background-color :#EDEDEA" onmouseover="this.style.backgroundColor = '#FAD8B4'"
												onmouseout="this.style.backgroundColor = '#EDEDEA';">
												<td style="CURSOR: hand; HEIGHT: 22px" align="center"
													width="18%">
													<s:property value="#status.count"/>
												</td>
												<td style="CURSOR: hand; HEIGHT: 22px" align="center"
													width="17%">
													<s:property value="#order.ordernumber"/>
												</td>
												<td style="CURSOR: hand; HEIGHT: 22px" align="center"
													width="18%">
													<s:property value="#order.total"/>
												</td>
												<td style="CURSOR: hand; HEIGHT: 22px" align="center"
													width="18%">
													<s:property value="#order.name"/>
												</td>
												<td style="CURSOR: hand; HEIGHT: 22px" align="center"
													width="18%">
													<s:if test="#order.state==1">
													         未付款
													</s:if>
													<s:if test="#order.state==2">
													   <a href="${pageContext.request.contextPath}/adminOrder_updateState.action?oid=<s:property value="#order.oid"/>"><span style="color:blue">发货</span></a>
													</s:if>
													<s:if test="#order.state==3">
													        未签收
													</s:if>
													<s:if test="#order.state==4">
													         交易结束
													</s:if>
													<s:if test="#order.state==5">
													      退款/退货中...     
													</s:if>
												</td>
												<td style="CURSOR: hand; HEIGHT: 22px" align="center"
													width="18%">
													<s:if test="#order.state==5">
													      <a href="${pageContext.request.contextPath}/adminOrder_updateStateToFive.action?oid=<s:property value="#order.oid"/>"><span style="color:blue">同意退款/退货</span></a>     
													</s:if>
												</td>
												
												<td style="CURSOR: hand; HEIGHT: 22px" align="center"
													width="18%">
													<input id="but<s:property value="#order.oid"/>" type="button" value="查看订单详情" onclick="showDetail(<s:property value="#order.oid"/>)"/>
													<div id="div<s:property value="#order.oid"/>"></div>
												</td>
											</tr>
										</s:if>
										<s:else>
											<tr onmouseover="this.style.backgroundColor = '#FAD8B4'"
												onmouseout="this.style.backgroundColor = '#F5FAFE';">
												<td style="CURSOR: hand; HEIGHT: 22px" align="center"
													width="18%">
													<s:property value="#status.count"/>
												</td>
												<td style="CURSOR: hand; HEIGHT: 22px" align="center"
													width="17%">
													<s:property value="#order.ordernumber"/>
												</td>
												<td style="CURSOR: hand; HEIGHT: 22px" align="center"
													width="18%">
													<s:property value="#order.total"/>
												</td>
												<td style="CURSOR: hand; HEIGHT: 22px" align="center"
													width="18%">
													<s:property value="#order.name"/>
												</td>
												<td style="CURSOR: hand; HEIGHT: 22px" align="center"
													width="18%">
													<s:if test="#order.state==1">
													         未付款
													</s:if>
													<s:if test="#order.state==2">
													   <a href="${pageContext.request.contextPath}/adminOrder_updateState.action?oid=<s:property value="#order.oid"/>"><span style="color:blue">发货</span></a>
													</s:if>
													<s:if test="#order.state==3">
													        未签收
													</s:if>
													<s:if test="#order.state==4">
													         交易结束
													</s:if>  
													<s:if test="#order.state==5">
													      退款/退货中...     
													</s:if>
												</td>  
												<td style="CURSOR: hand; HEIGHT: 22px" align="center"
													width="18%">
													<s:if test="#order.state==5">
													            <a href="${pageContext.request.contextPath}/adminOrder_updateStateToFive.action?oid=<s:property value="#order.oid"/>"><span style="color:blue">同意退款/退货</span></a>       
													</s:if>
												</td>
												
												<td style="CURSOR: hand; HEIGHT: 22px" align="center"
													width="18%">
													<input id="but<s:property value="#order.oid"/>" type="button" value="查看订单详情" onclick="showDetail(<s:property value="#order.oid"/>)"/>
													<div id="div<s:property value="#order.oid"/>"></div>
												</td>
											</tr>
										</s:else>
									</s:iterator>	
							</table>
						</td>
					</tr>
					<tr>
						<td  align="center" >
							第<s:property value="pageBean.page"/>/<s:property value="pageBean.totalPage"/>页&nbsp;
							&nbsp;&nbsp;&nbsp;
							<s:if test="pageBean.page != 1">
							<a href="${pageContext.request.contextPath}/adminOrder_findAll.action?page=1">首页</a>
						    <a href="${pageContext.request.contextPath}/adminOrder_findAll.action?page=<s:property value="pageBean.page-1"/>">上一页</a>
							</s:if>
							<s:if test="pageBean.page != pageBean.totalPage">
							<a href="${pageContext.request.contextPath}/adminOrder_findAll.action?page=<s:property value="pageBean.page+1"/>">下一页</a>
							<a href="${pageContext.request.contextPath}/adminOrder_findAll.action?page=<s:property value="pageBean.totalPage"/>">尾页</a>
							</s:if>
						</TD>
					</tr>
				</TBODY>
			</table>
		</form>
	</body>
</HTML>

