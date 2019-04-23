<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<HTML>
	<HEAD>
	    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/image/1.ico"/>
		<meta http-equiv="Content-Language" content="zh-cn">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">  
		<LINK href="${pageContext.request.contextPath}/css/Style1.css" type="text/css" rel="stylesheet">
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>    
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-easyui-1.4.5/jquery.min.js"></script>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/jquery-easyui-1.4.5/themes/icon.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/jquery-easyui-1.4.5/themes/default/easyui.css" />
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-easyui-1.4.5/jquery.easyui.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-easyui-1.4.5/locale/easyui-lang-zh_CN.js"></script>
	<SCRIPT type="text/javascript">
	    function save(){
	       $('#form1').submit();
	       parent.$('#addproductwin').window('close');          
	    }
	
	</SCRIPT>
	
	</HEAD>
	
	<body>  
		<form id="form1" name="form1" action="${pageContext.request.contextPath}/product_save.action" method="post" enctype="multipart/form-data">&nbsp;&nbsp; 
			<table cellSpacing="1" cellPadding="5" width="100%" height="80%" align="center" bgColor="#eeeeee"  border="0">
				<tr>
					<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
						商品名称：
					</td>
					<td class="ta_01" bgColor="#ffffff" >
						<input type="text" name="pname" value="" id="userAction_save_do_logonName" class="bg"/>
					</td>
					<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
						二级分类名称：
					</td>
					<td class="ta_01" bgColor="#ffffff">
						<SELECT name="categorySecond.csid">
							<s:iterator var="cs" value="csList">
								<option value=<s:property value="#cs.csid"/>><s:property value="#cs.csname"/></option>
							</s:iterator>
						</SELECT>   
					</td>
				</tr>
				
				<tr>
					<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
						市场价格：
					</td>
					<td class="ta_01" bgColor="#ffffff" >
					     <input type="text" name="market_price"  style="border-top:0px ;border-left:0px ;border-right:0px ;border-bottom: solid 1px gray;background-color: #FBFDFF;" value="" class="easyui-numberbox" data-options="min:0,precision:2"/>     
                     </td>               
				</tr>
				
				<tr>
					<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
						商城价格：
					</td>
					<td class="ta_01" bgColor="#ffffff" >
						<input type="text" name="shop_price" style="border-top:0px ;border-left:0px ;border-right:0px ;border-bottom: solid 1px gray;background-color: #FBFDFF;" value="" class="easyui-numberbox" data-options="min:0,precision:2"/>   
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
						商品描述：
					</td>
					<td class="ta_01" bgColor="#ffffff" >
						<textarea rows="5" cols="28" name="pdesc"></textarea>
					</td>
				</tr>
			</table>
		</form>
	</body>
</HTML>