<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/YOGI/static/css/root.css" type="text/css">
<link rel="stylesheet" href="/YOGI/static/css/alertify.default.css">
<link rel="stylesheet"	href="/YOGI/static/js/dtpicker/jquery.simple-dtpicker.css">
<script src="/YOGI/static/js/alertify.min.js"></script>
<script src="/YOGI/static/js/dtpicker/jquery-1.7.1.js"></script>
<script src="/YOGI/static/js/dtpicker/jquery.simple-dtpicker.js"></script>

<script type="text/javascript">
	$(function() {
		$('#searchbox').keypress(function(event) {
			if (event.keyCode == 13) { //여기서 keyCode 13은 엔터키를 의미한다.
				searchSubmit();
			}
		});
		$('.btnEventSearch').click(function(event) {
			searchSubmit();
			});
		$('.Reset').click(function(event) {
			document.search_form.reset();
			}); 
		
		$('.date').appendDtpicker({
		"futureOnly" : true,
		"autodateOnStart" : false,
		"locale" : "ko",
		"dateFormat": "YY/MM/DD",
		"dateOnly": true,
		"closeOnSelected": true,
		"calendarMouseScroll": false
		});
	});		
 		    function searchSubmit(){
 			var categorySize = "";
 			$("input[name=Category]:checked").each(function() {
 			if(categorySize == ""){
 			categorySize = $(this).val();
 			} else {
 			categorySize = categorySize + "|" + $(this).val();
 			}
 			});
 			var addrSize = "";
 			$("input[name=Addr]:checked").each(function() {
 			if(addrSize == ""){
 			addrSize = $(this).val();
 			} else {
 			addrSize = addrSize + "|" + $(this).val();
 			}
 			});
 			var paySize = "";
 			$("input[name=Pay]:checked").each(function() {
 			if(paySize == ""){
 			paySize = $(this).val();
 			} else {
 			paySize = paySize + "|" + $(this).val();
 			}
 			});
 			var dateSizs = "";
 			if(categorySize.length > 0){
 				$('#searchCategory').val(categorySize);
 			}
 			if(addrSize.length > 0){
 				$('#searchAddr').val(addrSize);
 			}
 			if(paySize.length > 0){
 				$('#searchPay').val(paySize);
 			}
 			if ($('#startdt').val() != null) {
 				$('#searchMStart').val($('#startdt').val());
 			}
 			document.search_form.submit();
		}
 		 	</script>
<style>
.back
{
	z-index:0;
	position: relative;
	top:0px;
	width:1400px;	height:812px;
	background-image:url('group/image/background.png');
}
.head{
position: relative;
top:0px; left: 20px;
}

img.find
{
	position: relative;
	top: 150px;	left:320px;
	width:211px;	height:50px;
}
img.shape
{
	cursor:pointer;
	position: relative;
	top: 5px;	left:35px;
	width:25px;	height:25px;
}
img.place
{
	cursor:pointer;
	position: relative;
	top: 0px;	left:1050px;
	width:84px;	height:13px;
}
img.mkgroup
{
	cursor:pointer;
	position: relative;
	top: 5x;	left:800px;
	width:84px;	height:13px;
}

.category
{
	z-index:1;
	position: relative;
	top: 200px; left:50px;
	width:343px;	height:348px;
	background-image:url('group/image/Category.png');
}
.region
{
	z-index:1;	
	position: relative;
	top: -148px; left:450px;
	width:337px;	height:347px;
	background-image:url('group/image/Region.png');
	border: none;
}

table.group_img_base{
	padding: 0;
	margin-top: 30px;
	border-collapse: collapse;
	border-spacing: 0.3px;
	width: 383px;
	height: 539px;
	background-image: url('group/image/groupCard.png');
	
	margin-bottom: 50px;
}

img.group_rep {
	width: 340px;
	height: 300px;
	margin-left: 21px;
	margin-top: -60px;
}
a.contentSubject{
	padding-top:-20px;
	text-decoration: none;
	color: gray;
	font-size: 20px;
}

td.group_view_subject{
	text-align:center;
	font-family: sans-serif;
	font-weight:bold;
	font-size:x-medium;
	height: 25px;
}


.search{
		z-index:2;
		position: relative;
		top: -500px; margin-left: 830px;
}
input.Searchbox
{
	position: relative;
	margin-top: 30px; margin-left: 10px;
	background: url('group/image/Keyword.png');
	padding-left: 148px;
	border:none; 
}
.Group{
	position: relative;
	top:-100px;
}
img.groups
{
	position: relative;
	margin-top: 10px; left:60px;
	width:82px;	height:29px;	
}
input.date {
   position: relative;
   width:238px; 
   height:36px;
   padding-left:148px;
   margin-top:14px;
   margin-left:10px;
   background: url('group/image/dcbox.png');
   border:none; border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;

}.btnEventSearch{
	cursor:pointer;
    position: relative;
    top: 80px; left:-265px;
    width: 258px; height: 53px;
    border:none;
}
.Reset{
	cursor:pointer;
	z-index:3;
	position: relative;
    margin-top: 20px; margin-left:10px;
    width: 50px; height: 16px;
    border: 0;
}
.charge{
	position: relative;
	margin-left:10px
}
.Nocharge{
	position: relative;
	margin-left:10px
}
td.gg_name{
	position:relative;
	text-decoration: none;
	top:-30px;
	color: gray;
	font-size: 18px;
	text-align:center;
	font-family: sans-serif;
	font-weight:bold;
	height: 25px;
}
td.gg_etc{
	text-decoration: none;
	color: gray;
	font-size: 15px;
	text-align: center;
	
}

</style>
</head>

<body>
<div class="back">
<form name="search_form" action="search.action" method="post">

<!-- 화면 상단 --><div class="head">
<img src="group/image/Shape.png" class="shape" onclick="history.go(-1)">
<img src="group/image/Place Rental.png" class="place" onclick="location.href='lendplace.action'">
<img src="group/image/Make Group.png" class="mkgroup" onclick="location.href='groupWriteForm.action'">
<img src="group/image/FindGroup.png" class="find">
</div>

<input id="searchCategory" type="hidden" name="searchCategory">
<input id="searchAddr" type="hidden" name="searchAddr">
<input id="searchPay" type="hidden" name="searchPay">
<input id="searchMStart" type="hidden" name="searchMStart">
<div class="category">
	
	<input type="checkbox" style="margin-top:65px; margin-left:30px;" name="Category" value="실외활동"><font class="jg">실외활동</font>
	<input type="checkbox" style="margin-left:45px;" name="Category" value="패션">패션
	<input type="checkbox" style="margin-left:50px;" name="Category" value="맛집">맛집<br>
	
	<input type="checkbox" style="margin-top:40px; margin-left:30px;" name="Category" value="게임">게임
	<input type="checkbox" style="margin-left:72px;" name="Category" value="동물">동물
	<input type="checkbox" style="margin-left:49px;" name="Category" value="보드게임">보드게임<br>
	
	<input type="checkbox" style="margin-top:40px; margin-left:30px;" name="Category" value="전시/공연">전시/공연
	<input type="checkbox" style="margin-left:40px;" name="Category" value="공예">공예
	<input type="checkbox" style="margin-left:50px;" name="Category" value="춤">춤<br>
	
	<input type="checkbox" style="margin-top:40px; margin-left:30px;" name="Category" value="독서/토론">독서/토론
	<input type="checkbox" style="margin-left:40px;" name="Category" value="음악">음악
	<input type="checkbox" style="margin-left:50px;" name="Category" value="언어교환">언어교환<br>
	
	<input type="checkbox" style="margin-top:40px; margin-left:30px;" name="Category" value="여행">여행
	<input type="checkbox" style="margin-left:70px;" name="Category" value="웰빙">웰빙
	<input type="checkbox" style="margin-left:50px;" name="Category" value="취업/스터디">취업/스터디
</div>

<div class="region">
	<input type="checkbox" style="margin-top:58px; margin-left:30px;"name="Addr" value="종로구">종로구
	<input type="checkbox" style="margin-left:25px;" name="Addr" value="중구">중구
	<input type="checkbox" style="margin-left:25px;" name="Addr" value="용산구">용산구
	<input type="checkbox" style="margin-left:25px;" name="Addr" name="Addr" value="성동구">성동구<br>
	
	<input type="checkbox" style="margin-top:25px; margin-left:29px;" name="Addr" value="광진구">광진구
	<input type="checkbox" style="margin-left:25px;" name="Addr" value="강동구">강동구
	<input type="checkbox" style="margin-left:14px;" name="Addr" value="중랑구">중랑구
	<input type="checkbox" style="margin-left:24px;" name="Addr" value="성북구">성북구<br>

	<input type="checkbox" style="margin-top:25px; margin-left:29px;" name="Addr" value="강북구">강북구
	<input type="checkbox" style="margin-left:25px;" name="Addr" value="도봉구">도봉구
	<input type="checkbox" style="margin-left:13px;" name="Addr" value="노원구">노원구
	<input type="checkbox" style="margin-left:24px;" name="Addr" value="은평구">은평구 <br>
	
	<input type="checkbox" style="margin-top:25px; margin-left:29px;" name="Addr" value="서대문구">서대문구
	<input type="checkbox" style="margin-left:12px;" name="Addr" value="마포구">마포구
	<input type="checkbox" style="margin-left:13px;" name="Addr" value="양천구">양천구
	<input type="checkbox" style="margin-left:25px;" name="Addr" value="강서구">강서구<br>
	
	<input type="checkbox" style="margin-top:25px; margin-left:29px;" name="Addr" value="구로구">구로구
	<input type="checkbox" style="margin-left:25px;" name="Addr" value="금천구">금천구
	<input type="checkbox" style="margin-left:14px;" name="Addr" value="영등포구">영등포구
	<input type="checkbox" style="margin-left:12px;" name="Addr" value="동작구">동작구<br>
	
	<input type="checkbox" style="margin-top:25px; margin-left:29px;" name="Addr" value="관악구">관악구
	<input type="checkbox" style="margin-left:25px;" name="Addr" value="서초구">서초구
	<input type="checkbox" style="margin-left:13px;" name="Addr" value="강남구">강남구
	<input type="checkbox" style="margin-left:24px;" name="Addr" value="송파구">송파구<br>
	
	<input type="checkbox" style="margin-top:25px; margin-left:145px;" name="Addr" value="동대문구">동대문구
</div>

<div class="search">
<input class="Searchbox" autocomplete="off" id="searchbox" tyep="text" name="searchWord" style="width:237px; height:35px; color:white;" value="<s:property value="searchWord"/>">
<br>
<input autocomplete="off" type="text" class="date" id="startdt" size="5" style="color:white;"><br>
<img src="group/image/Charge.png" class="charge"><input type="checkbox" style="margin-top: 30px; margin-left:54px;" name="Pay" value="유료"><br>
<img src="group/image/No Charge.png" class="Nocharge"><input type="checkbox" style="margin-left:25px;" name="Pay" value="무료"><br><br><br>
<img src="group/image/Reset.png" class="Reset"><br>
<img src="group/image/Search.png" class="btnEventSearch">
</div>
</form>

	<div class="Group">
		<img src="group/image/Groups.png" class="groups">
	
	
		<table border="0" width=100% cellpadding=5>

			<s:iterator value="list" status="stat">
				<s:url id="groupDetailURL" action="groupDetail">
					<s:param name="gg_no">
						<s:property value="gg_no"/>
					</s:param>
					<s:param name="currentPage">
						<s:property value="currentPage"/>
					</s:param>
				</s:url>
	
				<s:if test="#stat.index%3 == 0">
				<tr>
				</s:if>

				<td width="33%" align="center" >
					<s:a href="%{groupDetailURL}">
						<table border="0" class="group_img_base">
							<tr>
								<td>
									<img class="group_rep" src='/YOGI/temp/themnail/<s:property value="gg_small_img"/>' />
								</td>
							</tr>
							<tr >
								<td class="gg_name">
									<s:property value="gg_name" /><br>
									<s:property value="gg_date" /><br>
									<s:property value="gg_simple" /><br>
									
									<s:if test="gg_cost > 0">
										￦ <s:property value="gg_cost" />
									</s:if>
									<s:if test="gg_cost == 0">
										무료
									</s:if>
								<br>
									<s:if test="gg_total == gg_enable">
										<font color="red">신청마감!!</font>
									</s:if>
									<s:if test="gg_total != gg_enable">
										<br>
									</s:if>
								</td>
							</tr>
						</table>
					</s:a>
				</td>
							
			</s:iterator>

					<s:if test="list.size() <= 0">
						<tr>
							<td width=40%></td>
							<td width=60%><h3>등록된 게시물이 없습니다.</h3></td>
						</tr>
					</s:if>

					<!-- 페이징 -->
					<s:if test="list.size() > 0">
						<tr align="center">
							<td colspan="3" class="group_paging">
								<s:property value="pagingHtml" escape="false" />
							</td>
						</tr>
				</s:if>
		</table>
	</div>

</div>

</body>
</html>