<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<style>
.sidebar{
	width:150px;
	height:1024px;
	background-image:url('tiles/layout/sideBar/back.png');
	
}
img.yogi{
	position:relative;
	top:29px;
	left:36px;
	cursor:pointer
}

img.My{
	position:relative;
	left:45px;
	top:749px;
	cursor:pointer
}

img.Logout{
	position:relative;
	left:50px;
	top:812px;
	cursor:pointer
}

img.About{
	position:relative;
	left:54px;
	top:875px;
	cursor:pointer
}
</style>

<script>
function goodBye(){
	alert("또 놀러오세용~");
	location.href='logout.action';
}
</script>
<div class="sidebar">
	<img src="tiles/layout/sideBar/Yogi.png" class="yogi" onclick="location.href='main.action'"><br>
	<img src="tiles/layout/sideBar/MyPage.png" class="My" onclick="location.href='mypageView.action'"><br>
	<img src="tiles/layout/sideBar/Logout.png" class="Logout" onclick="goodBye()"><br>
	<img src="tiles/layout/sideBar/About.png" class="About" onclick="location.href='about.action'">
</div>

</body>
</html>