<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />  
<title>清云商城</title>   

<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/image/1.ico"/>
<link href="${pageContext.request.contextPath}/css/common.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/product.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script> 
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-easyui-1.4.5/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/jquery-easyui-1.4.5/themes/icon.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/jquery-easyui-1.4.5/themes/default/easyui.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-easyui-1.4.5/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-easyui-1.4.5/locale/easyui-lang-zh_CN.js"></script>   
<script type="text/javascript" src="${pageContext.request.contextPath}/js/fckeditor/fckeditor.js"></script>

<script type="text/javascript">  
   	$(function(){  
			var fck = new FCKeditor("content");   
			fck.Width = "99%";
			fck.Height = "100%";
		   	fck.ToolbarSet = "bbs";
			fck.BasePath = "${pageContext.request.contextPath}/js/fckeditor/";  
			fck.ReplaceTextarea();
  
	  
		});
    
    
    function save(){
         $('#form1').submit();    
	     parent.$('#replywin').window('close');    
    }
</script>

</head>
<body style="background-color:#ECF4FF">		  
			<div style="border:1px solid #FD8000;margin-top:10px;" >             
			   <form name="form1" id="form1" action="${pageContext.request.contextPath }/comments_savereply.action" method="post">      
			        <input type="hidden"  name="userid" value="<s:property value="#session.existUser.uid"/>" />           
			        <input type="hidden"  name="productid" value="<s:property value="model.product.pid"/>" />                
			        <input type="hidden"  name="pid" value="<s:property value="model.product.pid"/>" />                  
					<div>     
					   <textarea name="contentStart" style="height:80px;width:96%;align:left;" readonly="readonly">        
 //&nbsp;@<s:property value="model.user.name"/>:&nbsp;&nbsp;${model.content}
				       </textarea>  
					</div>
					<div style="margin-left:10px;margin-right:10px;mgin-top:10px;">                           
					    <textarea id="content" name="content" style="height:200px;width:500px">   
					    </textarea>       
					</div>  
				</form>     
			</div>          
</body>
</html>