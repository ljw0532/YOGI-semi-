<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="/YOGI/members/membersForm/root.css" type="text/css">
<link rel="stylesheet" href="/YOGI/members/membersForm/alertify.default.css">
<script src="/YOGI/members/membersForm/alertify.min.js"></script>

<title>회원정보 수정</title>
<script type="text/javascript">
	var kor_check = /([^가-힣ㄱ-ㅎㅏ-ㅣ\x20])/i;
	var eng_check = /^[A-za-z]/g;
	var num_check = /^[0-9]*$/;
	var phone_check1 = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;
	var phone_check2 = /^\d{2,3}-\d{3,4}-\d{4}$/;
	
	function update() {

		var join = document.userinput
		
		if (join.m_password.value == "") {
			alertify.error("비밀번호를 입력해주세요");
			join.m_password.focus();
			return false;
		}
		
		if (userinput.m_password.value.length < 4) {
			alertify.error("최소 4자리 이상 입력해주세요!");
			userinput.m_password.focus();
			return false;
		}
		
		if (join.m_password_check.value == "") {
			alertify.error("비밀번호를 한번 더 입력해주세요!");
			join.m_password.focus();
			return false;
		} 
		
		if (join.m_password_check.value != join.m_password.value) {
			alertify.error("비밀번호를 틀리게 입력하셨습니다...");
			join.m_password.focus();
			return false;
		} 
		
		
		if (join.m_phone.value == "") {
			alertify.error("전화번호를 입력해주세요");
			join.m_phone.focus();
			return false;
		}

		if(!join.m_phone.value.match(phone_check1) && !join.m_phone.value.match(phone_check2)){
			alertify.error("전화번호 형식이 잘못되었습니다. 다시 입력해주세요.");
			alertify.log("예) 010-1234-1234<br> 또는 02-123-1234");
			join.m_phone.focus();
			return false;
		}

		join.submit();
	}
	
	function delete_member(){
		alert("잘가.... 따흑...!");
		location.href='DeleteMembers.action';
	}
	
</script>

<style>
.background{
	width:1440px; height:1024px;
	background-image:url('members/membersForm/background.png');
	border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;
}

img.back{
	position:relative; left:60px; top:60px;
	width:25px; height:25px;
	border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;
	cursor:pointer
}

.register{
	position:relative; margin-top: 150px; margin-left:151px;
	float:left;
	width:608px; height:531px;
	background-image:url('members/membersForm/editForm.png');
	border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;
}
.area{
	position:relative; margin-top: 30px; margin-left:42px;
	float:left;
	width:520px; height:294px;
	background-image:url('members/membersForm/areaForm.png');
	border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;
}

.category{
	position:relative; margin-top: 154px; margin-left:42px;
	float:left;
	width:520px; height:294px;
	background-image:url('members/membersForm/categoryForm.png');
	border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;
}

input.id{
	position:relative; margin-top:80px; left:50px;
	width:190px; height:36px; padding-left: 224px;
	background-image:url('members/membersForm/ID.png');
	border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;
}
input.pw{
	position:relative; margin-top:48px; left:50px;
	width:264px; height:36px; padding-left: 224px;
	background-image:url('members/membersForm/pw.png');
	border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;
}
input.c_pw{
	position:relative; margin-top:50px; left:50px;
	width:264px; height:36px; padding-left: 224px;
	background-image:url('members/membersForm/c_pw.png');
	border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;
}
input.name{
	position:relative; margin-top:50px; left:50px;
	width:189px; height:36px; padding-left: 224px;
	background-image:url('members/membersForm/name.png');
	border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;
}
input.phone{
	position:relative; margin-top:50px; left:50px;
	width:264px; height:35px; padding-left: 224px;
	background-image:url('members/membersForm/phone.png');
	border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;
}

input.modify{
	position:relative; top:70px;
	width:218px; height:49px;
	background-image:url('members/membersForm/modify.png');
	border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;
	cursor:pointer
}
input.delete{
	position:relative; top:70px; left:160px;
	width:218px; height:49px;
	background-image:url('members/membersForm/delete.png');
	border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;
	cursor:pointer
}
</style>

</head>
<body>
<div class="background">
<img src="members/findForm/back.png" class="back" onclick="location.href='mypageView.action'">

<form method="post" action="ModifyMembers.action" name="userinput">
<div class="register">
	<input class="id" name="m_id" id="m_id" value="${session_m_id}" readonly>

	<input class="pw" type="password" name="m_password" id="m_password" placeholder=" 4자리 이상  입력해주세요"  maxlength="15">
	<input class="c_pw" type="password" id="m_password_check" placeholder=" 비밀번호를 한번 더 확인해주세요!"  maxlength="15">
	<input class="name" value="${session_m_name}" readonly>
	<input class="phone" type="text" value="${session_m_phone}" name="m_phone" id="m_phone" placeholder="ex) 010-1234-1234"  maxlength="13">
</div>

<div class="category">
	<input type="checkbox" style="margin-top:77px; margin-left:80px;" name="m_fav_field" value="실외활동">실외활동
	<input type="checkbox" style="margin-left:80px;" name="m_fav_field" value="패션">패션
	<input type="checkbox" style="margin-left:80px;" name="m_fav_field" value="맛집">맛집<br>
	
	<input type="checkbox" style="margin-top:25px; margin-left:80px;" name="m_fav_field" value="게임">게임
	<input type="checkbox" style="margin-left:108px;" name="m_fav_field" value="동물">동물
	<input type="checkbox" style="margin-left:80px;" name="m_fav_field" value="보드게임">보드게임<br>
	
	<input type="checkbox" style="margin-top:25px; margin-left:80px;" name="m_fav_field" value="전시/공연">전시/공연
	<input type="checkbox" style="margin-left:75px;" name="m_fav_field" value="취업/스터디">취업/스터디
	<input type="checkbox" style="margin-left:32px;" name="m_fav_field" value="춤">춤<br>
	
	<input type="checkbox" style="margin-top:25px; margin-left:80px;" name="m_fav_field" value="독서/토론">독서/토론
	<input type="checkbox" style="margin-left:75px;" name="m_fav_field" value="음악">음악
	<input type="checkbox" style="margin-left:80px;" name="m_fav_field" value="언어교환">언어교환<br>
	
	<input type="checkbox" style="margin-top:25px; margin-left:80px;" name="m_fav_field" value="여행">여행
	<input type="checkbox" style="margin-left:108px;" name="m_fav_field" value="웰빙">웰빙
	<input type="checkbox" style="margin-left:80px;" name="m_fav_field" value="공예">공예
	
</div>

<div class="area">
	<input type="checkbox" style="margin-top:67px; margin-left:80px;"name="m_fav_area" value="종로구">종로구
	<input type="checkbox" style="margin-left:40px;" name="m_fav_area" value="중구">중구
	<input type="checkbox" style="margin-left:54px;" name="m_fav_area" value="용산구">용산구
	<input type="checkbox" style="margin-left:40px;" name="m_fav_area" name="m_fav_area" value="성동구">성동구<br>
	
	<input type="checkbox" style="margin-top:15px; margin-left:80px;" name="m_fav_area" value="광진구">광진구
	<input type="checkbox" style="margin-left:40px;" name="m_fav_area" value="동대문구">동대문구
	<input type="checkbox" style="margin-left:26px;" name="m_fav_area" value="중랑구">중랑구
	<input type="checkbox" style="margin-left:40px;" name="m_fav_area" value="성북구">성북구<br>

	<input type="checkbox" style="margin-top:15px; margin-left:80px;" name="m_fav_area" value="강북구">강북구
	<input type="checkbox" style="margin-left:40px;" name="m_fav_area" value="도봉구">도봉구
	<input type="checkbox" style="margin-left:40px;" name="m_fav_area" value="노원구">노원구
	<input type="checkbox" style="margin-left:40px;" name="m_fav_area" value="은평구">은평구 <br>
	
	<input type="checkbox" style="margin-top:15px; margin-left:80px;" name="m_fav_area" value="서대문구">서대문구
	<input type="checkbox" style="margin-left:26px;" name="m_fav_area" value="마포구">마포구
	<input type="checkbox" style="margin-left:40px;" name="m_fav_area" value="양천구">양천구
	<input type="checkbox" style="margin-left:40px;" name="m_fav_area" value="강서구">강서구<br>
	
	<input type="checkbox" style="margin-top:15px; margin-left:80px;" name="m_fav_area" value="구로구">구로구
	<input type="checkbox" style="margin-left:40px;" name="m_fav_area" value="금천구">금천구
	<input type="checkbox" style="margin-left:40px;" name="m_fav_area" value="영등포구">영등포구
	<input type="checkbox" style="margin-left:26px;" name="m_fav_area" value="동작구">동작구<br>
	
	<input type="checkbox" style="margin-top:15px; margin-left:80px;" name="m_fav_area" value="관악구">관악구
	<input type="checkbox" style="margin-left:40px;" name="m_fav_area" value="서초구">서초구
	<input type="checkbox" style="margin-left:40px;" name="m_fav_area" value="강남구">강남구
	<input type="checkbox" style="margin-left:40px;" name="m_fav_area" value="송파구">송파구<br>
	
	<input type="checkbox" style="margin-top:15px; margin-left:80px;" name="m_fav_area" value="강동구">강동구
</div>
<center>
	<input class="modify" type="button" onclick="update()">
</center>
	<input class="delete"  type="button" onclick="delete_member()">
</form>
</div>
</body>
</html>
