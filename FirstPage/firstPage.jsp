<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/YOGI/members/membersForm/none.css" type="text/css"><title>요기요기 모여라~!</title>
<script type="text/javascript" src="/YOGI/static/js/jquery-3.1.0.js"></script>
<script>
$(document).ready(function() {
	$('#m_id').focus();
});
$(function() {
	$('#m_password').keypress(function(event) {
		if (event.keyCode == 13) { //여기서 keyCode 13은 엔터키를 의미한다.
			insert();
		}
	});
});
	function insert() {
		var join = document.userinput

		if (join.m_id.value == "") {
			alert("id를 입력해주세요");
			join.m_id.focus();
			return false;
		}

		if (join.m_password.value == "") {
			alert("비밀번호를 입력해주세요");
			join.m_password.focus();
			return false;
		}

		document.userinput.submit();
	}
	

</script>
<style>
.back{
	width:1440px;	height:1024px;
	background-image:url('FirstPage/background.png');
	border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;
}
.loginForm
{	width:482px;	height:837px;
	position:relative;	top:76px;	left:488px;
	background-image:url('FirstPage/loginForm.png');
}

input.id{
	position:relative;	top:517px;
	width:237px;	height:50px;
	padding-left: 60px; 
	background-image:url('FirstPage/idForm.png');
	border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;
}
input.password{
	position:relative;	top:530px;
	width:237px;	height:49px;
	padding-left: 60px;
	background-image:url('FirstPage/passwordForm.png');
	border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;
}
.login{
	position:relative;	top: 545px;	left : 107px;
	width:123px;	height:50px;
	background-image:url('FirstPage/loginBtn.png');
	cursor:pointer
}
.find{
	position:relative;	top: 530px;	left : 94px;
	width:157px;	height:16px;
	background-image:url('FirstPage/findBtn.png');
	border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;
	cursor:pointer
}
.create{
	position:relative;	top:593px;
	width:163px;	height:16px;
	background-image:url('FirstPage/createBtn.png');
	border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;
	cursor:pointer
}

</style>
</head>
<body  class="back">


<div class="loginForm">
	&nbsp;&nbsp;&nbsp;&nbsp;
	<form action="login.action" method="post" name="userinput">
		<center>
		<input autocomplete="off" class="id" id="m_id" type="text" name="m_id" placeholder="id를 입력해주세요" maxlength="20" />
		<input autocomplete="off" class="password" id="m_password" type="password" placeholder="비밀번호를 입력해주세요" name="m_password" maxlength="20" />
		</center>
		<input class="find" type="button" onclick="location.href='FindForm.action'" />
		<input class="login" type="button" onclick="insert()"/><br>
		<center>
		<input class="create" type="button" onclick="location.href='CreateForm.action'" />
		</center>
	</form>
	
</div>
</body>
</html>