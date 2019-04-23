<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'demo.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-easyui-1.4.5/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/jquery-easyui-1.4.5/themes/icon.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/jquery-easyui-1.4.5/themes/default/easyui.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-easyui-1.4.5/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-easyui-1.4.5/locale/easyui-lang-zh_CN.js"></script>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript">
	   function save(loginUser,pid ){
	     $('#productid').val(pid);     //赋值
	     $('#reportname').val(loginUser);   
	     $('#form1').submit();    
	     parent.$('#win').window('close');        
	   }
	
	</script>

  </head>
  
  <body style="background-color: #ECF4FF">  
       <form name="form1" id="form1" action="${pageContext.request.contextPath}/report_save.action" method="post">
	       <div>
	          <input id="productid" name="productid" type="hidden"/>  
			  <input id="reportname" name="reportname" type="hidden"/>
	          <span style="margin-left:30px;"> 举报类型：</span><select  name="type">  
	               <option value="虚假交易">虚假交易</option>   
	               <option value="包裹收到空">包裹收到空</option>
	               <option value="假冒及盗版">假冒及盗版</option>
	               <option value="滥发信息">滥发信息</option>
	               <option value="出售禁售品">出售禁售品</option>
	               <option value="服务违规举报">服务违规举报</option>   
	               <option value="违反国家标准">违反国家标准</option>
	               <option value="品牌商品近似">品牌商品近似</option>  
	           </select>
	       </div>
	     <div style="margin-left:30px;margin-top:30px;">
	                       
	     </div>
	     <div style="margin-left:30px;margin-top:-1  0px;">    
	            <span style="position:relative; top:-100px;left:0px;"> 举报详情：</span><textarea rows="8" cols="38" name="content"></textarea>   
	     </div>  
    </form>  
  </body>
</html>
