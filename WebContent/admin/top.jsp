<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
	<head>
	<meta http-equiv="Content-Language" content="zh-cn">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
	<!--  
	<style type="text/css">
		BODY {
			MARGIN: 0px;
			BACKGROUND-COLOR: #ffffff
		}
		
		BODY {
			FONT-SIZE: 12px;
			COLOR: #000000
		}
		
		TD {
			FONT-SIZE: 12px;
			COLOR: #000000
		}
		
		TH {
			FONT-SIZE: 12px;
			COLOR: #000000
		}
   </style>
   -->
		<link href="${pageContext.request.contextPath}/css/Style.css" rel="stylesheet" type="text/css">
	</HEAD>
	
	<body style="background-color:#CB6703;width:100%"> 
	<table>
	   <tr>
	       <td style="color:white;font-size:18px;border:2px solid white;width:7%;">  
	                                    清&nbsp; &nbsp;云 &nbsp;&nbsp;网<br/>
	           qingyun.com
	       </td>
	       <td style="color:white;font-size:36px;font-style:italic;width:60%;">  
	            <span style="padding-left:70px;">清&nbsp; &nbsp;云&nbsp; &nbsp;后&nbsp; &nbsp;台&nbsp; &nbsp;管&nbsp; &nbsp;理&nbsp; &nbsp;系&nbsp; &nbsp;统</span>
	       </td>
	       <td style="color:white;width:33%">     
	             <div style="float:right;">欢迎您:<s:property value="#session.existAdminUser.username"/> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span  id="time"></span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/adminUser_logout.action" target="_parent" style="color:white;text-decoration: none">退出</a></div>
					<script type="text/javascript">   
						function showLocale(objD){
							var str,colorhead,colorfoot;
							var yy = objD.getYear();
							if(yy<1900) yy = yy+1900;
							var MM = objD.getMonth()+1;
							if(MM<10) MM = '0' + MM;
							var dd = objD.getDate();
							if(dd<10) dd = '0' + dd;
							var hh = objD.getHours();
							if(hh<10) hh = '0' + hh;
							var mm = objD.getMinutes();
							if(mm<10) mm = '0' + mm;
							var ss = objD.getSeconds();
							if(ss<10) ss = '0' + ss;
							var ww = objD.getDay();
							if  ( ww==0 )  colorhead="<font color=\"white\">";
							if  ( ww > 0 && ww < 6 )  colorhead="<font color=\"white\">";
							if  ( ww==6 )  colorhead="<font color=\"white\">";  
							if  (ww==0)  ww="星期日";
							if  (ww==1)  ww="星期一";
							if  (ww==2)  ww="星期二";
							if  (ww==3)  ww="星期三";
							if  (ww==4)  ww="星期四";
							if  (ww==5)  ww="星期五";
							if  (ww==6)  ww="星期六";
							colorfoot="</font>"
							str = colorhead + yy + "-" + MM + "-" + dd + " " + hh + ":" + mm + ":" + ss + "  " + ww + colorfoot;
							return(str);
							}
							function tick()
							{
							var today;
							today = new Date();
							document.getElementById("time").innerHTML = showLocale(today);
							window.setTimeout("tick()", 1000);
							}
							tick();
					</script>
			
	       </td>
	   </tr>
	</table>
	<!-- 
		<table width="100%" height="70%"  border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td>
					<img width="95px" height="55px"src="${pageContext.request.contextPath}/image/r___________renleipic_01/qingYun.png">
				</td>

				<td width="100%" background="${pageContext.request.contextPath}/images/top_100.jpg">
				</td>
			</tr>
		</table>
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td height="30" valign="bottom" background="${pageContext.request.contextPath}/images/mis_01.jpg">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="85%" align="left">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<font color="#000000"> 
								     <script language="JavaScript">
										tmpDate = new Date();
										date = tmpDate.getDate();
										month= tmpDate.getMonth() + 1 ;
										year= tmpDate.getFullYear();
										document.write(year);
										document.write("年");
										document.write(month);
										document.write("月");
										document.write(date);
										document.write("日 ");
										
										myArray=new Array(6);
										myArray[0]="星期日"
										myArray[1]="星期一"
										myArray[2]="星期二"
										myArray[3]="星期三"
										myArray[4]="星期四"
										myArray[5]="星期五"
										myArray[6]="星期六"
										weekday=tmpDate.getDay();
										if (weekday==0 | weekday==6)
										{
										document.write(myArray[weekday])
										}
										else
										{document.write(myArray[weekday])
										};

									</script> 
								</font>
							</td>
							<td width="15%">
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td width="16"
											background="${pageContext.request.contextPath}/images/mis_05b.jpg">
											<img
												src="${pageContext.request.contextPath}/images/mis_05a.jpg"
												width="6" height="18">
										</td>
										<td width="155" valign="bottom"
											background="${pageContext.request.contextPath}/images/mis_05b.jpg">
											用户名：
											<font color="blue"><s:property value="#session.existAdminUser.username"/></font>
										</td>    
										<td>
										    <a href="${pageContext.request.contextPath}/adminUser_logout.action" target="_parent">退出</a>
										</td>
									</tr>   
								</table>
							</td>
							<td align="right" width="5%">
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		 -->
		 
	</body>
</HTML>
