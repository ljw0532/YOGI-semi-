<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.gg_name{
	font-size:18px;
	color:#fff;
	font-weight:bold;
	margin-left:30px;
	margin-top:200px;
	position: absolute;
	z-index: 1;
}
.img-cover{
   position: absolute;
   height: 254px;
   width: 306px;
   background-color: rgba(0, 0, 0, 0.4);                                                                 
   z-index:2;
}

</style>
</head>

<body>
<table  border:none; CELLPADDING="0" CELLSPACING="0">
	<tr>
		<td width=372>
			<center><img src="main/Recommend.png"></center>
		</td>
		<s:iterator value="res" status="stat">
		<s:if test="%{#stat.index < 3}">
	<s:url id="groupDetailURL" action="groupDetail">
					<s:param name="gg_no">
						<s:property value="gg_no"/>
					</s:param>
				</s:url>

		<td width=306; height="254" margin=0>
			<s:a href="%{groupDetailURL}">
				<div class="img-cover">
					<div class="gg_name">
						<s:property value="gg_name"/>
					</div>
				</div>
					<img style="width:306px; height: 254px;" src='/YOGI/temp/themnail/<s:property value="gg_small_img"/>' />
				
			</s:a>
		</td>
		</s:if>
		</s:iterator>
	</tr>
</table>
</body>
</html>