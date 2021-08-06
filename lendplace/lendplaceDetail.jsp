<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/YOGI/static/js/dtpicker/jquery.simple-dtpicker.css">
<link rel="stylesheet" href="/YOGI/static/css/alertify.default.css">
<script src="/YOGI/static/js/alertify.min.js"></script>
<script src="/YOGI/static/js/dtpicker/jquery-1.7.1.js"></script>
<script src="/YOGI/static/js/dtpicker/jquery.simple-dtpicker.js"></script>
<script src="/YOGI/static/js/ckeditor/ckeditor.js"></script>
<style type="text/css">
a:link { color: black; text-decoration: none;}
a:visited { color: black; text-decoration: none;}
a:hover { color: black; text-decoration:none;}



div.back{
	z-index: 0;
    position:relative;
    top:0px;
	width:1296px;	height:1959px;
	background-image:url('lendplace/css/lendplaceDetail/back1.png');
}
img.Back{
	position:relative;
    top:40px;
    left: 30px;
    cursor:pointer;
	   
}
div.lp_detail_subject{
	padding-left: 140px;
	position: relative;
	top:55px;
	margin-left: 0px;
	text-align: left;
	font-family: sans-serif;
	font-weight:bold;
	font-size: xx-large;
	
}
img.detail_img{
	
	width: 610px;
	height: 440px;
	}
div.img{
	z-index:-3;
	position: relative;
	top: 65px;
	padding-left: 140px;
}
div.l_sdate{
	position: relative;
	top: -315px;
	left: 940px;
	text-align:left;
	font-family: sans-serif;
	font-size: x-large;
	width: 200px;
}
div.l_edate{
	position: relative;
	top: -260px;
	left: 940px;
	text-align: left;
	font-family: sans-serif;
	font-size: x-large;
	width: 200px;
}
div.l_addr{
position: relative;
	top: -130px;
	left: 820px;
	text-align: left;
	font-family: sans-serif;
	font-size: x-large;
	width: 430px;
	height: 90px;
}
div.l_pnum{
position: relative;
	top: -513px;
	left: 940px;
	text-align: left;
	font-family: sans-serif;
	font-size: x-large;
	width: 200px;

}
div.l_payment{
position: relative;
	top: -330px;
	left: 940px;
	text-align: left;
	font-family: sans-serif;
	font-size: x-large;
	width: 300px;
}
img.list{
position: relative;
	top: -184px;
	left: 820px;
	cursor:pointer;

}
img.rental{
position: relative;
	top: 400px;
	left: 770px;
	cursor:pointer;

}
div.content{
	position:relative;
	top:-480px;
	left:205px;
	width: 882px;
	height: 230px;
	border : 0;
	padding: 0;
	margin: 0;
	border-collapse: collapse;
	border-spacing: 0.3px;
	text-align: left;
	font-family: sans-serif;
	font-size: x-large;
}
input.delete{
	position:relative;
	top: 535px;
	left: 1070px;
	
}
input[type=text].date{
	
	width:19px;
	height: 21px;
	font-size: x-small;
	color: gray;
	text-align: center;
}
form.lendplacebook{
    position: relative;
    top: 865px;
    left: 770px;
    width: 200px;
}
input[type=text].date{
	color: black;
	position: relative;
	z-index: 8;
	width:80px;
	height: 23px;
	font-size: small;
	text-align: center;
	top: -5px;
	left: 37px;
}

div.datepicker{
	position: relative;
    right: 570px;
    top: -410px;
}
div.datepicker_header{
	width: 428px;

}
.datepicker > .datepicker_inner_container > .datepicker_calendar{ 
	width: 436px;
}
table.datepicker_table{
	width: 428px;
	height: 429px;
}
</style>
</head>
<body marginwidth="0">
<div class="back">
<img src="lendplace/css/lendplaceDetail/Shape.png" class="Back" onclick="location.href='lendplace.action'">
<s:if test="#session.session_m_id == 'admin'">
<input type="button" class="delete" value="삭제" onclick="location.href='lendplaceDelete.action?l_no=<s:property value="l_no"/>'"/>
</s:if>




<div class="lp_detail_subject"><s:property value="detailData.l_subject"/></div><!-- 제목 -->


<div class="img">
<img class="detail_img" src="/YOGI/temp/themnail/<s:property value='detailData.l_rep_img'/>"/>
</div>

<div class="l_sdate"><s:property value="detailData.l_sdate"/></div>

<div class="l_edate"><s:property value="detailData.l_edate"/></div>

<div class="l_addr"><a href="javascript:map();"><s:property value="detailData.l_addr"/>&nbsp;(<s:property value="detailData.l_subject"/>)</a></div>

<div class="l_pnum"><s:property value="detailData.l_enable"/>명</div>

<div class="l_payment"><s:property value="detailData.l_payment"/>원</div>


<img src="lendplace/css/lendplaceDetail/list.png" class="list" onclick="location.href='lendplace.action'">

<form action="lendplaceBook.action" method="post" name="lendplacebook" class="lendplacebook">
	<input id="m_no" type="hidden" name="m_no" value="<s:property value="#session.session_m_no"/>">
	<input id="l_no" type="hidden" name="l_no" value="<s:property value="detailData.l_no"/>">
	
    <font size="5">Date</font><input autocomplete="off" type="text" class="date" name="l_date" id="startdt2" size="13">
</form>
<!-- 
<form name="lendplacebook" action="DateCheckAction">
	<div class="date">
		<input type="text" class="dtpicker_omview" id="startdt" name="l_date" size="5" style="top:30px; margin-left:20px;">
		<input value="check" type="button" onclick="checkDate(this.form)"/>
	</div>
	<input id="l_no" type="hidden" name="l_no" value="<s:property value="detailData.l_no"/>">
</form>
 -->

<img src="lendplace/css/lendplaceDetail/rental.png" class="rental" onclick="return lp_check();">


<div class="content"><s:property value="detailData.l_content" escape="false"/></div> 
 
<script>
$(function() {
   $('.date').appendDtpicker({
	"inline": true,
	"futureOnly" : false,
	"autodateOnStart" : false,
	"locale" : "ko",
	"dateFormat": "YY.MM.DD",
	"dateOnly": true,
	"calendarMouseScroll": false
	});
});	

function checkDate(userinput) {
	var url = "DateCheckAction.action?l_date=" + document.userinput.l_date.value+"&l_no=<s:property value='detailData.l_no'/>";
	var join = document.userinput;
	if (join.l_date.value == null) {
		alertify.error("날짜를 입력해주세요.");
		join.m_id.focus();
		return false;
	}
	open(url, "confirm", "toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=300,height=400");
}	

function map(){
	var popupX=(window.screen.width/2)-(700/2);
	
	var popupY=(window.screen.height/2)-(500/2);
	
	var uri='http://192.168.30.191:8080/YOGI/lendplace/map.jsp?l_addr=<s:property value="detailData.l_addr"/>&l_subject=<s:property value="detailData.l_subject"/>';
	var res = encodeURI(uri);
	
	
	window.open(res,"post","toolbar=no ,width=700 ,height=500 ,directories=no,status=yes,scrollbars=no,menubar=no,left="+ popupX +",top="+ popupY +", screenX="+ popupX +", screenY= "+ popupY);
	}

/* 장소사용 신청전 로그인 확인  */
function lp_check(kind){
	var session_id = '<s:property value="#session.session_m_id"/>';
	
	if(session_id == null || session_id.length <= 0){
		alertify.error("로그인 상태가 아닙니다.");
		return false;
	}
	if(session_id != null){
		document.lendplacebook.submit();
	}
}

function checkDate(userinput) {
	var url = "DateCheckAction.action?l_date=" + document.userinput.l_date.value+"&l_no=<s:property value='detailData.l_no'/>";
	var join = document.userinput;
	if (join.l_date.value == null) {
		alertify.error("날짜를 입력해주세요.");
		join.m_id.focus();
		return false;
	}
	open(url, "confirm", "toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=300,height=400");
}

</script>
</div>
<body>
</html>