<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<style>
.back{
	width:1290px;	height:770px;
	background-image:url('main/mainPic3.png');
}

img.text{
	position:relative;	top:160px;	left:770px;
	width:426;	height:127;
}

img.find{
	width:250px;	height:49px;
	position:relative;	top:320px;	left:910px;
	cursor:pointer
}
img.make{
	width:250px;	height:49px;
	position:relative;	top:330px;	left:910px;
	cursor:pointer
}
img.place{
	width:250px;	height:49px;
	position:relative;	top:340px;	left:910px;
	cursor:pointer
}


</style>
<div class="back">
	<img src="main/text.png" class="text"><br>
	<img src="main/findBtn.png" class="find" onclick="location.href='group.action'"><br>
	<img src="main/makeBtn.png" class="make" onclick="location.href='groupWriteForm.action'"><br>
	<img src="main/placeBtn.png" class="place" onclick="location.href='lendplace.action'"><br>
</div>

	
</body>
</html>