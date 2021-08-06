<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.background{
	width:1440px; height:1024px;
	background-image:url('members/findForm/background.png');
	border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;
}
.whiteForm{
	position:relative; left:418px; top:332px;
	width:617px; height:342px;
	background-image:url('members/findForm/whiteForm.png');
	border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;
}
input.next{
	width:123px; height:38px;
	background-image:url('members/findForm/nextBtn.png');
	border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;
	cursor:pointer
}
.yourPW{
	position:relative; left:80px; top:90px;
	width:406px; height:87px;
	background-image:url('members/findForm/yourPW.png');
	border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;
}
.oops{
	position:relative; left:43px; top:90px;
	width:550px; height:89px;
	background-image:url('members/findForm/Oops.png');
	border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;
}

</style>
</head>
<body class="background">
<div class="whiteForm">
	<s:if test="chk==0">
		<div class="yourPW"></div>
		<input class="next" style="position:relative; left:420px; top:170px;" type="button" onclick="location.href='first.action'">
	</s:if>
	<s:else>
		<div class="oops"></div>
		<input class="next" style="position:relative; left:420px; top:170px;" type="button" onclick="location.href='first.action'">
	</s:else>	
</div>
</body>
</html>