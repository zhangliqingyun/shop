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
			function addAdminProduct(){
				window.location.href = "${pageContext.request.contextPath}/adminProduct_add.action";
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
							<strong>商品 列 表</strong>
						</TD>
					</tr>
					<tr>
						<td class="ta_01" align="right">
							<button type="button" id="add" name="add" value="添加" class="button_add" onclick="addAdminProduct()">
                               &#28155;&#21152;
                            </button>

						</td>
					</tr>
					<tr>
						<td class="ta_01" align="center" bgColor="#f5fafe">
							<table cellspacing="0" cellpadding="1" rules="all"
								bordercolor="gray" border="1" id="DataGrid1"
								style="BORDER-RIGHT: gray 1px solid; BORDER-TOP: gray 1px solid; BORDER-LEFT: gray 1px solid; WIDTH: 100%; WORD-BREAK: break-all; BORDER-BOTTOM: gray 1px solid; BORDER-COLLAPSE: collapse; BACKGROUND-COLOR: #f5fafe; WORD-WRAP: break-word">
								<tr
									style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; HEIGHT: 25px; BACKGROUND-COLOR: #F0A050">

									<td align="center" width="5%">
										序号
									</td>
									<td align="center" width="12%">
										商品图片
									</td>
									<td align="center" width="27%">
										商品名称
									</td>
									<td align="center" width="10%">
										商品价格
									</td>
									<td align="center" width="10%">
										是否热门
									</td>
									<td align="center" width="10%">
										是否置顶
									</td>
									<td width="7%" align="center">
										编辑
									</td>
									<td width="7%" align="center">
										删除
									</td>
								</tr>
								<s:iterator var="product" value="pageBean.list" status="status">
									 <s:if test="#status.count % 2 ==0">
											<tr style="background-color :#EDEDEA" onmouseover="this.style.backgroundColor = '#FAD8B4'"
												onmouseout="this.style.backgroundColor = '#EDEDEA';">
												<td style="CURSOR: hand; HEIGHT: 22px" align="center"
													width="5%">
													<s:property value="#status.count"/>
												</td>
												<td style="CURSOR: hand; HEIGHT: 22px" align="center"
													width="12%">  
													<img width="40px" height="45px" alt="商品图片" src="${pageContext.request.contextPath}/<s:property value="#product.image"/>"/>
												</td>
												<td style="CURSOR: hand; HEIGHT: 22px" align="center"
													width="27%">
													<s:property value="#product.pname"/>
												</td>
												<td style="CURSOR: hand; HEIGHT: 22px" align="center"
													width="10%">  
													<s:property value="#product.shop_price"/>
												</td>
												<td style="CURSOR: hand; HEIGHT: 22px" align="center"
													width="10%">
													<s:if test="#product.is_hot==1">
													         是
													</s:if>
													<s:else>
													        否
													</s:else>
												</td>
												<td style="CURSOR: hand; HEIGHT: 22px" align="center"
													width="10%">
													<s:if test="#product.is_top==1">
													         是
													</s:if>   
													<s:else>
													        否
													</s:else>
												</td>
												<td align="center" style="HEIGHT: 22px">
													<a href="${pageContext.request.contextPath}/adminProduct_edit.action?pid=<s:property value="#product.pid"/>">
														<img src="${pageContext.request.contextPath}/images/i_edit.gif" border="0" style="CURSOR: hand">
													</a>
												</td>
										
												<td align="center" style="HEIGHT: 22px">
													<a href="${pageContext.request.contextPath}/adminProduct_delete.action?pid=<s:property value="#product.pid"/>">
														<img src="${pageContext.request.contextPath}/images/i_del.gif" width="16" height="16" border="0" style="CURSOR: hand">
													</a>
												</td>
											</tr>
										</s:if>
										<s:else>
											<tr onmouseover="this.style.backgroundColor = '#FAD8B4'"
											onmouseout="this.style.backgroundColor = '#F5FAFE';">
											<td style="CURSOR: hand; HEIGHT: 22px" align="center"
												width="5%">
												<s:property value="#status.count"/>
											</td>
											<td style="CURSOR: hand; HEIGHT: 22px" align="center"
												width="12%">  
												<img width="40px" height="45px" alt="商品图片" src="${pageContext.request.contextPath}/<s:property value="#product.image"/>"/>
											</td>
											<td style="CURSOR: hand; HEIGHT: 22px" align="center"
												width="27%">
												<s:property value="#product.pname"/>
											</td>
											<td style="CURSOR: hand; HEIGHT: 22px" align="center"
												width="10%">  
												<s:property value="#product.shop_price"/>
											</td>
											<td style="CURSOR: hand; HEIGHT: 22px" align="center"
												width="10%">
												<s:if test="#product.is_hot==1">
												         是
												</s:if>
												<s:else>
												        否
												</s:else>
											</td>
											<td style="CURSOR: hand; HEIGHT: 22px" align="center"
												width="10%">
												<s:if test="#product.is_top==1">
												         是
												</s:if>   
												<s:else>
												        否
												</s:else>
											</td>
											<td align="center" style="HEIGHT: 22px">
												<a href="${pageContext.request.contextPath}/adminProduct_edit.action?pid=<s:property value="#product.pid"/>">
													<img src="${pageContext.request.contextPath}/images/i_edit.gif" border="0" style="CURSOR: hand">
												</a>
											</td>
									
											<td align="center" style="HEIGHT: 22px">
												<a href="${pageContext.request.contextPath}/adminProduct_delete.action?pid=<s:property value="#product.pid"/>">
													<img src="${pageContext.request.contextPath}/images/i_del.gif" width="16" height="16" border="0" style="CURSOR: hand">
												</a>
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
							<a href="${pageContext.request.contextPath}/adminProduct_findAll.action?page=1">首页</a>
						    <a href="${pageContext.request.contextPath}/adminProduct_findAll.action?page=<s:property value="pageBean.page-1"/>">上一页</a>
							</s:if>
							<s:if test="pageBean.page != pageBean.totalPage">
							<a href="${pageContext.request.contextPath}/adminProduct_findAll.action?page=<s:property value="pageBean.page+1"/>">下一页</a>
							<a href="${pageContext.request.contextPath}/adminProduct_findAll.action?page=<s:property value="pageBean.totalPage"/>">尾页</a>
							</s:if>
						</TD>
					</tr>
				</TBODY>
			</table>
		</form>
	</body>
</HTML>

