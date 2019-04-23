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
		<form id="userAction_save_do" name="Form1" action="${pageContext.request.contextPath}/convenience_update.action" method="post">   
			&nbsp;
			<input type="hidden" name="id" value="<s:property value="model.id"/>"/>
			<table cellSpacing="1" cellPadding="5" width="100%" align="center" bgColor="#eeeeee" style="border: 1px solid #F0A050" border="0">
				<tr>
					<td class="ta_01" align="center" bgColor="#F0A050" colSpan="4"
						height="26">
						<strong><STRONG>编辑便民信息</STRONG>  
						</strong>
					</td>
				</tr>

				<tr>
					<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
						便民信息标题：
					</td>
					<td class="ta_01" bgColor="#ffffff" >
						<input type="text" name="title" value="<s:property value="model.title"/>" id="userAction_save_do_logonName" class="bg"/>
					</td>
					<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
						便民信息内容：  
					</td>
					<td class="ta_01" bgColor="#ffffff">  
						<textarea rows="7" cols="32" name="content" ><s:property value="model.content"/></textarea>
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