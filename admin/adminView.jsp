<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.back{
	width:1294px;
	height:1024px;
	background-image:url('admin/image/background.png');
}
img.membership{
	position:relative; margin-top:600px; margin-left:200px;
	width:176px; height:16px; 
	cursor:pointer
}
img.report{
	position:relative; margin-top:600px; margin-left:200px;
	width:122px; height:16px; 
	cursor:pointer
}
img.place{
	position:relative; margin-top:600px; margin-left:200px;
	width:129px; height:16px; 
	cursor:pointer
}


</style>
</head>
<body>
	<div class = "back">
		<img src="admin/image/membership.png" class="membership" onclick="location.href='adminMemberList.action'">
		<img src="admin/image/report.png" class="report" onclick="location.href='adminReport.action'">
		<img src="admin/image/place.png" class="place" onclick="location.href='adminPlace.action'">
		
	</div>
</body>
</html>