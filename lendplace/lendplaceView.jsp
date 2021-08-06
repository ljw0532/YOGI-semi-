<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head >
<meta content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/YOGI/static/js/dtpicker/jquery.simple-dtpicker.css">
<link rel="stylesheet" href="/YOGI/static/css/alertify.default.css">
<script src="/YOGI/static/js/alertify.min.js"></script>
<script src="/YOGI/static/js/dtpicker/jquery-1.7.1.js"></script>
<script src="/YOGI/static/js/dtpicker/jquery.simple-dtpicker.js"></script>
<script src="/YOGI/static/js/ckeditor/ckeditor.js"></script>
<script src="/YOGI/static/js/openmeetform.js"></script>
<script type="text/javascript">
 		$(function() {
		$('#searchbox').keypress(function(event) {
			if (event.keyCode == 13) { //여기서 keyCode 13은 엔터키를 의미한다.
				searchSubmit();
			}
		});
		$('.Search').click(function(event) {
			searchSubmit();
			});
		$('.Reset').click(function(event) {
			document.search_form.reset();
			});
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
 		    function searchSubmit(){
 			var areaSize = "";
 			$("input[name=area]:checked").each(function() {
 			if(areaSize == ""){
 			areaSize = $(this).val();
 			} else {
 			areaSize = areaSize + "|" + $(this).val();
 			}
 			});
 			
 			if(areaSize.length > 0){
 				$('#search_area').val(areaSize);
 			}
 			document.search_form.submit();
		}
 		 	</script>
<style>
a {text-decoration: none;}
div.back{
	z-index: 0;
    position:relative;
    top:-44px;
	width:1290px;	height:935px;
	background-image:url('lendplace/css/lendplaceView/back.png');
}
img.Back{
	z-index: 1;
	position: relative;
	top:40px;
	left: 30px;
	cursor:pointer
}
img.MakeGroup{
	z-index: 1;
	position: relative;
	left: 950px;
	top: 35px;
	cursor:pointer
}
img.PlaceRental{
	z-index: 1;
	position: relative;
	left: 1005px;
	top: 35px;
	cursor:pointer
}
img.All{
	z-index: 6;
	position: relative;
	left: 950px;
	top: -135px;
	cursor: pointer
	
}
img.Reset{
	z-index: 6;
	position: relative;
	left: 1120px;
	top:-135px;
	cursor:pointer
}
table.list{
	z-index: 1;
   	position:relative;
    left:0px;
    top: 200px;
    width: 400;
}
img.keyword{
	z-index: 1;
	position: relative;
	left: 80px;
	top: 65px;
}
input.searchbox{
	z-index: 8;
	position: relative;
	left: 955px;
	top: -3px;
	width: 237px; height: 30px;
}
img.budget{
	z-index: 1;
	position: relative;
	left: 595px;
	top: 90px;
}
input.min_pay{
	z-index: 8;
	position: relative;
	left: 312px;
	top: 76px;
	width: 119px; height: 30px;
}
input.max_pay{
	z-index: 8;
	position: relative;
	left: 336px;
	top: 76px;
	width: 119px; height: 30px;
}
img.region{
	z-index: 1;
	position:relative;
	left: 0px;
	top: 180px;
}
img.date1{
	z-index: 1;
	position: relative;
	left: 35px;
	top: 180px;
}
img.Search{
	z-index: 6;
	position: relative;
	top: 300px;
	right: 365px;
	cursor:pointer
}
div.area{
	z-index: 2;
	position:relative;
	top:-235px;
	left:15px;
	width: 500px;
	
}
table.list{
	position: relative;
	top: -165px;
	
}
table.lp_img_base{
	padding: 0;
	margin: 0;
	border-collapse: collapse;
	border-spacing: 0.3px;
 	width: 383px;
	height: 539px;
 	background-image: url('group/image/groupCard.png');
}
img.lendplace_rep {
	width: 340px;
	height: 300px;
	margin-left: 23px;
	margin-top: -25px;
	
}
td.lp_view_subject{
	padding-top:-20px;
	text-decoration: none;
	color: gray;
	font-size: 20px;
	text-align:center;
	font-family: sans-serif;
	font-weight:bold;
	height: 25px;
	
	
	
}
td.lp_view_addr{
	padding-top:-20px;
	text-decoration: none;
	color: gray;
	font-size: 20px;
	text-align: center;
	
}

td.lendplace_paging{
	padding-top:50px;
	text-align: center;
	font-family: sans-serif;
	font-weight:bold;
	font-size: large;
	width: 100%;
}
input[type=text].date{
	position: relative;
	z-index: 8;
	width:80px;
	height: 23px;
	font-size: small;
	text-align: center;
	left: 68px;
}
div.date2{
	z-index:4;
	position: relative;
	left: 840px;
	bottom: 430px;
	width: 200px;
}
div.datepicker{
	position: relative;
    right: 377px;
    top: -120px;
}
div.datepicker_header{
	width: 316px;

}
.datepicker > .datepicker_inner_container > .datepicker_calendar{ 
	width: 323px;
}
table.datepicker_table{
	width: 316px;
	height: 265px;
}

</style>
</head>
<body>

<div class="back">
<img class="Back" src="lendplace/css/lendplaceView/Shape.png" onclick="location.href='main.action'">
<img class="MakeGroup" src="lendplace/css/lendplaceView/MakeGroup.png" onclick="location.href='groupWriteForm.action'">
<img class="PlaceRental" src="lendplace/css/lendplaceView/PlaceRental.png" onclick="location.href='lendplace.action'">

<form name="search_form" action="lsearch.action" method="post">
<input id="search_area" type="hidden" name="search_area">
<img class="Reset" src="lendplace/css/lendplaceView/Reset.png" >
<img class="All" src="lendplace/css/lendplaceView/All.png" onclick="location.href='lendplace.action'">

<img class="region" src="lendplace/css/lendplaceView/region.png">
<img class="date1" src="lendplace/css/lendplaceView/date.png">

<img class="keyword" src="lendplace/css/lendplaceView/keyword.png">
<input autocomplete="off" class="searchbox" id="searchbox" type="text" name="searchWord" maxlength="10" placeholder="예)역삼동,음향,주차 등" style="background-color:transparent;" />

<img class="budget" src="lendplace/css/lendplaceView/budget.png">
<input autocomplete="off" class="min_pay" type="text" name="min_pay" id="min_pay" size="13" placeholder="0" style="background-color:transparent;">
<input autocomplete="off" class="max_pay" type="text" name="max_pay" id="max_pay" size="13" placeholder="0" style="background-color:transparent;">


<img class="Search" src="lendplace/css/lendplaceView/Search.png">

<div class="area">
	<input type="checkbox" style="margin-top:67px; margin-left:90px; "name="area" value="종로구">종로구
	<input type="checkbox" style="margin-left:47px;" name="area" value="중구">중구
	<input type="checkbox" style="margin-left:60px;" name="area" value="용산구">용산구
	<br>
	<input type="checkbox" style="margin-top:15px; margin-left:90px;" name="area" value="광진구">광진구
	<input type="checkbox" style="margin-left:47px;" name="area" value="동대문구">동대문구
	<input type="checkbox" style="margin-left:32px;" name="area" value="중랑구">중랑구
	<br>
	<input type="checkbox" style="margin-top:15px; margin-left:90px;" name="area" value="강북구">강북구
	<input type="checkbox" style="margin-left:47px;" name="area" value="도봉구">도봉구
	<input type="checkbox" style="margin-left:46px;" name="area" value="노원구">노원구
	<br>
	<input type="checkbox" style="margin-top:15px; margin-left:90px;" name="area" value="서대문구">서대문구
	<input type="checkbox" style="margin-left:34px;" name="area" value="마포구">마포구
	<input type="checkbox" style="margin-left:46px;" name="area" value="양천구">양천구
	<br>
	<input type="checkbox" style="margin-top:15px; margin-left:90px;" name="area" value="구로구">구로구
	<input type="checkbox" style="margin-left:47px;" name="area" value="금천구">금천구
	<input type="checkbox" style="margin-left:46px;" name="area" value="영등포구">영등포구
	<br>
	<input type="checkbox" style="margin-top:15px; margin-left:90px;" name="area" value="관악구">관악구
	<input type="checkbox" style="margin-left:47px;" name="area" value="서초구">서초구
	<input type="checkbox" style="margin-left:46px;" name="area" value="강남구">강남구
	<br>
	<input type="checkbox" style="margin-top:15px; margin-left:90px;" name="area" value="강동구">강동구
	<input type="checkbox" style="margin-left:47px;" name="area" value="성동구">성동구
	<input type="checkbox" style="margin-left:46px;" name="area" value="성북구">성북구
	<br>
	<input type="checkbox" style="margin-top:15px; margin-left:90px;" name="area" value="은평구">은평구 
	<input type="checkbox" style="margin-left:47px;" name="area" value="강서구">강서구
	<input type="checkbox" style="margin-left:46px;" name="area" value="동작구">동작구
	<br>
	<input type="checkbox" style="margin-top:15px; margin-left:90px;" name="area" value="송파구">송파구
</div>
<div class="date2">
<font color="white" size="5">Date</font><input autocomplete="off" type="text" class="date" name="l_t_date" id="startdt2" size="13" style="background-color:transparent;">
</div>
</form>

<!-- 장소 리스트 -->
<table border="0"  cellpadding="5" class="list" width="100%">
<s:iterator value="list" status="stat">
	<s:url id="lendplaceDetailURL" action="lendplaceDetail">
		<s:param name="l_no">
			<s:property value="l_no"/>
		</s:param>
		<s:param name="currentPage">
			<s:property value="currentPage"/>
		</s:param>
	</s:url>
	<s:if test="#stat.index%3 == 0"> <!-- 한 줄에 몇개의 게시물이 나오는지 설정하는곳  -->
	<tr>
	</s:if>
	
	<td align="center" width="33%">
		<s:a  href="%{lendplaceDetailURL}">
			<table border="0" class="lp_img_base">
			<tr>
			<td><img class="lendplace_rep" src="/YOGI/temp/img/<s:property value="l_rep_img"/>" /></td>
			</tr>
			<tr>
			<td class="lp_view_subject"><s:property value="l_subject"/></td> <!-- 추가적으로 내용들을 더 띄우고 싶으면 이쪽에 추가하면 됨  -->
			</tr>
			<tr>
			<td class="lp_view_addr"><s:property value="l_addr"/></td>
			</tr>
			</table>
		</s:a>
	</td>
</s:iterator>

	<s:if test="list.size() <= 0">
		<tr>
		<td align="center" class="none" width=100%><h2>등록된 게시물이 없습니다.</h2></td>
		</tr>		
    </s:if>
<!-- 페이징 -->
<tr>
<td colspan="3" class="lendplace_paging"><s:property value="pagingHtml" escape="false"/></td>
</tr>
</table>

</div>
</body>
</html>