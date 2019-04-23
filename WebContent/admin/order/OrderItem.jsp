<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<table width="100%" border="0" >
	<s:iterator var="orderItem" value="list">
		<tr>
			<td><img width="40px" height="45px" src="${pageContext.request.contextPath }/<s:property value="#orderItem.product.image"/>"/></td>
			<td><s:property value="#orderItem.subtotal"/></td>
			<td><s:property value="#orderItem.itemid"/></td>
		</tr>
	</s:iterator>
</table>