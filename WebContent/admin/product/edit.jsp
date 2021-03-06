<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<HTML>
	<HEAD>
	    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/image/1.ico"/>
		<meta http-equiv="Content-Language" content="zh-cn">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<LINK href="${pageContext.request.contextPath}/css/Style1.css" type="text/css" rel="stylesheet">
	</HEAD>
	
	<body style="background-color:#EDE3D6">
		<form id="userAction_save_do" name="Form1" action="${pageContext.request.contextPath}/adminProduct_update.action" method="post" enctype="multipart/form-data">
			&nbsp;
			<input type="hidden" name="pid" value="<s:property value="model.pid"/>"/>  
			<input type="hidden" name="image" value="<s:property value="model.image"/>"/>   
			<input type="hidden" name="pdate" value="<s:property value="model.pdate"/>"/>
			<input type="hidden" name="shelves" value="<s:property value="model.shelves"/>"/>      
			<input type="hidden" name="user.uid" value="<s:property value="model.user.uid"/>"/>        
			<table cellSpacing="1" cellPadding="5" width="100%" align="center" bgColor="#eeeeee" style="border: 1px solid #F0A050" border="0">
				<tr>
					<td class="ta_01" align="center" bgColor="#F0A050" colSpan="4"
						height="26">
						<strong><STRONG>编辑商品信息</STRONG>
						</strong>  
					</td>
				</tr>

				<tr>
					<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
						商品名称：
					</td>
					<td class="ta_01" bgColor="#ffffff" >
						<input type="text" name="pname" value="<s:property value="model.pname"/>" id="userAction_save_do_logonName" class="bg"/>
					</td>
					<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
						二级分类名称：
					</td>
					<td class="ta_01" bgColor="#ffffff">
						<SELECT name="categorySecond.csid">
							<s:iterator var="cs" value="csList">
								<option value=<s:property value="#cs.csid"/> <s:if test="#cs.csid == model.categorySecond.csid"> selected</s:if>> <s:property value="#cs.csname"/></option>
							</s:iterator>
						</SELECT>
					</td>
				</tr>
				
				<tr>
					<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
						市场价格：
					</td>
					<td class="ta_01" bgColor="#ffffff" >
						<input type="text" name="market_price" value="<s:property value="model.market_price"/>" id="userAction_save_do_logonName" class="bg"/>
					</td>
				</tr>
				
				<tr>
					<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
						商城价格：
					</td>
					<td class="ta_01" bgColor="#ffffff" >
						<input type="text" name="shop_price" value="<s:property value="model.shop_price"/>" id="userAction_save_do_logonName" class="bg"/>
					</td>
				</tr>
				
				<tr>
					<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
						商品图片：
					</td>
					<td class="ta_01" bgColor="#ffffff" >
						<input type="file" name="upload">
					</td>
				</tr>
				<tr>
					<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
						是否热门：
					</td>
					<td class="ta_01" bgColor="#ffffff" >
						<SELECT name="is_hot">
						   <option value="1" <s:if test="model.is_hot == 1">selected</s:if>>是 </option>
						   <option value="0" <s:if test="model.is_hot == 0">selected</s:if>>否</option>
						</SELECT>
					</td>
				</tr>
				<tr>
					<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
						是否置顶：
					</td>
					<td class="ta_01" bgColor="#ffffff" >
						<SELECT name="is_top">
						   <option value="1" <s:if test="model.is_top == 1">selected</s:if>>是 </option>
						   <option value="0" <s:if test="model.is_top == 0">selected</s:if>>否</option>
						</SELECT>  
					</td>   
				</tr>
				<tr>
					<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
						商品描述：
					</td>
					<td class="ta_01" bgColor="#ffffff" >
						<textarea rows="5" cols="28" name="pdesc" ><s:property value="model.pdesc"/></textarea>
					</td>
				</tr>
				<tr>
					<td class="ta_01" style="WIDTH: 100%" align="center"
						bgColor="#f5fafe" colSpan="4">
						<button type="submit" id="userAction_save_do_submit" value="确定" class="button_ok">
							&#30830;&#23450;
						</button>

						<FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT>
						<button type="reset" value="重置" class="button_cancel">&#37325;&#32622;</button>

						<FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT>
						<INPUT class="button_ok" type="button" onclick="history.go(-1)" value="返回"/>
						<span id="Label1"></span>
					</td>
				</tr>
			</table>
		</form>
	</body>
</HTML>