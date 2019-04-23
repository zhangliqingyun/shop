<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>清云商城后台管理系统</title>
<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/image/1.ico"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />


<style type="text/css">
body {
  color: white;
}
</style>

<body style="background: #FD8000">   
<center><s:actionerror /></center>   
<form method="post" action="${pageContext.request.contextPath }/adminUser_login.action" target="_parent" name='theForm' >
  <table cellspacing="0" cellpadding="0" style="margin-top: 160px" align="center">
  <tr>
    <td style="padding-left: 50px">
      <table style="border:10px solid #FAA550;background-color:white;width:400px;">  
      <tr style="line-height:40px">
        <td colspan="2" align="center" style="background-color:#CB6703">清云网后台管理系统</td>  
      </tr>
      <tr style="line-height:60px">
        <td style="color:black;text-align:right">用户名：</td>   
        <td><input type="text" name="username" style="width:150px" /></td>
      </tr>
      <tr>
        <td style="color:black;text-align:right">密码：</td>
        <td><input type="password" name="password"  style="width:150px"/></td>
      </tr>
            
      <tr>     
         <td>&nbsp;</td><td><input type="submit" style="cursor:pointer;width:155px;color:white;background-color:#CB6703;border:none;height:25px;font-size:18px;" class="button" value="登录"/></td>   
      </tr>
      </table>   
    </td>
  </tr>
  </table>
  <input type="hidden" name="act" value="signin" />
</form>

</body>