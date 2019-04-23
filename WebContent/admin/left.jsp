<%@ page language="java" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>菜单</title>
<!-- 
<link href="${pageContext.request.contextPath}/css/left.css" rel="stylesheet" type="text/css"/>
<link rel="StyleSheet" href="${pageContext.request.contextPath}/css/dtree.css" type="text/css" />
 -->
 <style type="text/css">
     a:hover { border:solid 1px white; }  
 </style>
</head>
<body style="background-color: #F0A050">  

<div style="border:solid 2px #F7BF93;">
	<div style="background-color: #F7BF93;color:white;line-height:30px;height:30px;width:124px">
	    <&nbsp;&nbsp; &nbsp;功能导航 &nbsp;&nbsp;&nbsp;>
	</div>
	<div style="margin-top:15px;">
	    <a href="${pageContext.request.contextPath}/user_manager.action" target="mainFrame" ><img src="${pageContext.request.contextPath}/image/yhgl.jpg" style="height:25px;width:120px;border:solid 2px white;"/></a>
	</div>
	<div style="margin-top:3px;">
	     <a href="${pageContext.request.contextPath}/adminCategory_findAll.action" target="mainFrame" ><img src="${pageContext.request.contextPath}/image/yjfl.jpg" style="height:25px;width:120px;border:solid 2px white;"/></a>
	</div>
	<div style="margin-top:3px;">
	     <a href="${pageContext.request.contextPath}/adminCategorySecond_findAll.action?page=1" target="mainFrame" ><img src="${pageContext.request.contextPath}/image/ejfl.jpg" style="height:25px;width:120px;border:solid 2px white;"/></a>
	</div>
	<div style="margin-top:3px;">
	     <a href="${pageContext.request.contextPath}/adminProduct_findAll.action?page=1" target="mainFrame" ><img src="${pageContext.request.contextPath}/image/spgl.jpg" style="height:25px;width:120px;border:solid 2px white;"/></a>
	</div>
	<div style="margin-top:3px;">
	    <a href="${pageContext.request.contextPath}/adminOrder_findAll.action?page=1" target="mainFrame" > <img src="${pageContext.request.contextPath}/image/ddgl.jpg" style="height:25px;width:120px;border:solid 2px white;"/></a>
	</div>
	<div style="margin-top:3px;">
	     <a href="${pageContext.request.contextPath}/returnMessage_list.action?page=1" target="mainFrame" ><img src="${pageContext.request.contextPath}/image/fkxx.jpg" style="height:25px;width:120px;border:solid 2px white;"/></a>
	</div>
	<div style="margin-top:3px;">
	     <a href="${pageContext.request.contextPath}/comments_list.action?page=1" target="mainFrame" ><img src="${pageContext.request.contextPath}/image/plgl.jpg" style="height:25px;width:120px;border:solid 2px white;"/></a>
	</div>
	<div style="margin-top:3px;">
	     <a href="${pageContext.request.contextPath}/adminProduct_checkList.action?page=1" target="mainFrame" ><img src="${pageContext.request.contextPath}/image/shgl.jpg" style="height:25px;width:120px;border:solid 2px white;"/></a>
	</div>
	<div style="margin-top:3px;">
	     <a href="${pageContext.request.contextPath}/report_list.action?page=1" target="mainFrame" ><img src="${pageContext.request.contextPath}/image/jbgl.jpg" style="height:25px;width:120px;border:solid 2px white;"/></a>
	</div>
	<div style="margin-top:3px;">
	     <a href="${pageContext.request.contextPath}/convenience_list.action?page=1" target="mainFrame" ><img src="${pageContext.request.contextPath}/image/bmgl.jpg" style="height:25px;width:120px;border:solid 2px white;"/></a>
	</div>
  
</div>

<!-- 
<table width="100" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="12"></td>
  </tr>
</table>
<table width="100%" border="0">
  <tr>
    <td>
<div class="dtree">

	<a href="javascript: d.openAll();">展开所有</a> | <a href="javascript: d.closeAll();">关闭所有</a>
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/dtree.js"></script>
	<script type="text/javascript">

		d = new dTree('d');
		d.add('01',-1,'系统菜单树');
		d.add('0101','01','用户管理','','','mainFrame');
		d.add('010101','0101','用户管理','${pageContext.request.contextPath}/user_manager.action','','mainFrame');
		d.add('0102','01','一级分类管理','','','mainFrame');
		d.add('010201','0102','一级分类管理','${pageContext.request.contextPath}/adminCategory_findAll.action','','mainFrame');
		d.add('0103','01','二级分类管理','','','mainFrame')
		d.add('010301','0103','二级分类管理','${pageContext.request.contextPath}/adminCategorySecond_findAll.action?page=1','','mainFrame');
		d.add('0104','01','商品管理','','','mainFrame')
		d.add('010401','0104','商品管理','${pageContext.request.contextPath}/adminProduct_findAll.action?page=1','','mainFrame');
		d.add('0105','01','订单管理','','','mainFrame')
		d.add('010501','0105','订单管理','${pageContext.request.contextPath}/adminOrder_findAll.action?page=1','','mainFrame');
		d.add('0106','01','反馈信息','','','mainFrame')
		d.add('010601','0106','反馈信息','${pageContext.request.contextPath}/returnMessage_list.action?page=1','','mainFrame');
		d.add('0107','01','评论管理','','','mainFrame')
		d.add('010701','0107','评论管理','${pageContext.request.contextPath}/comments_list.action?page=1','','mainFrame');
		d.add('0108','01','审核管理','','','mainFrame')
		d.add('010801','0108','审核管理','${pageContext.request.contextPath}/adminProduct_checkList.action?page=1','','mainFrame');
		d.add('0109','01','举报管理','','','mainFrame')    
		d.add('010901','0109','举报管理','${pageContext.request.contextPath}/report_list.action?page=1','','mainFrame');
		d.add('0110','01','便民管理','','','mainFrame')
		d.add('011001','0110','便民管理','${pageContext.request.contextPath}/convenience_list.action?page=1','','mainFrame');
		document.write(d);    

	</script>
</div>	</td>
  </tr>
</table>
 -->
</body>
</html>
