<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="/YOGI/static/js/jquery-3.1.0.js"></script>
<script>
$(function () {
$('.id_next').click(function(event) {
	document.userinputID.submit();
	});
$('.pw_next').click(function(event) {
	document.userinputPW.submit();
	});
});
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.background{
	width:1440px; height:1024px;
	background-image:url('members/findForm/background.png');
	border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;
}
img.back{
	position:relative; left:-1200px; top:60px;
	width:25px; height:25px;
	border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;
}
.findIdForm{
	width:482;	height:741px;
	float:left; relative; 
	margin-left: 230px;	margin-top: 150px;	margin-right:50px;
	background-image:url('members/findForm/idForm.png');
}	
.findPWForm{
	width:482;	height:741px;
	float:left;
	relative; 	margin-top: 150px;
	background-image:url('members/findForm/pwForm.png');
}
input.id_name{
	position:relative; top:490px;
	width:232px; height:45px;	padding-left: 65px;
	background-image:url('members/findForm/name.png');
	border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;
	
}
input.id_phone{
	position:relative; top:520px;
	width:172px; height:45px;	padding-left: 125px; 
	background-image:url('members/findForm/phone2.png');
	border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;
}
img.id_next{
	position:relative; top:560px;
	width:218px; height:49px;
	border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;
	cursor:pointer
	
}
input.pw_id{
	position:relative; top:440px;
	width:232px; height:45px;	padding-left: 65px;
	background-image:url('members/findForm/id.png');
	border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;
}
input.pw_name{
	position:relative; top:465px;
	width:232px; height:45px;	padding-left: 65px;
	background-image:url('members/findForm/name.png');
	border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;
	
}
input.pw_phone{
	position:relative; top:490px;
	width:172px; height:45px;	padding-left: 125px; 
	background-image:url('members/findForm/phone2.png');
	border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;
}
img.pw_next{
	position:relative; top:513px;
	width:218px; height:49px;
	border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;
	cursor:pointer
}

</style>
</head>
<body>
	<div class="background" style="margin-top:-8px; margin-left:-8px;">
	<img src="members/findForm/back.png" class="back" onclick="location.href='first.action'">
	<div class="findIdForm" style="width:482px; height:741px">
	<form method="post" action="FindId.action" name="userinputID">
	<center>
		<input class="id_name" type="text" name="m_name" id="m_name"  maxlength="9"><br>
		<input class="id_phone" type="text" name="m_phone" id="m_phone" placeholder="ex) 010-1234-1234"  maxlength="13">
		<img src="members/findForm/next.png" class="id_next"/><br>
	</center>		
	</form>
	</div>
		
	<div class="findPWForm" style="width:482px; height:741px">
	<form method="post" action="FindPW.action" name="userinputPW">
	<center>
		<input class="pw_id" type="text" name="m_id" id="m_id"  maxlength="9"><br>
		<input class="pw_name" type="text" name="m_name" id="m_name"  maxlength="9"><br>
		<input class="pw_phone" type="text" name="m_phone" id="m_phone" placeholder="ex) 010-1234-1234"  maxlength="13">		
		<img src="members/findForm/next.png" class="pw_next"/><br>
	</center>
	</form>
	</div>
	</div>
	
</body>
</html>