<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="EUC-KR"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/YOGI/static/css/openmeetform.css">
<link rel="stylesheet" href="/YOGI/static/js/dtpicker/jquery.simple-dtpicker.css">
<link rel="stylesheet" href="/YOGI/static/css/alertify.default.css">
<script src="/YOGI/static/js/alertify.min.js"></script>
<script src="/YOGI/static/js/dtpicker/jquery-1.7.1.js"></script>
<script src="/YOGI/static/js/dtpicker/jquery.simple-dtpicker.js"></script>
<script src="/YOGI/static/js/ckeditor/ckeditor.js"></script>
<script src="/YOGI/static/js/openmeetform.js"></script>
<script src="//apis.daum.net/maps/maps3.js?apikey=a18085cad4f8315645fc4a233bdb2875&libraries=services"></script>

<script type = "text/javascript">
$(function() {
	$('.date').appendDtpicker({
		"futureOnly" : true,
		"autodateOnStart" : false,
		"locale" : "ko",
		"dateFormat": "YY.MM.DD",
		"dateOnly": true,
		"closeOnSelected": true
	});

	$('#startdt').change(function() {
		var de = new Date($('#startdt').handleDtpicker('getDate')); // constructor need to avoid linking object
		de.setDate(de.getDate());
		$('#enddt').handleDtpicker('setMinDate', de); //set min end date is 7 day later then start date
	});	
	
});
$('#searchAddrEnterKey').keypress(function(event) {
	if (event.keyCode == 13) { //여기서 keyCode 13은 엔터키를 의미한다.
		searchSubmit();
	}
});

function valueCheck() {
	var f = document.gow_form;
    
	if (!f.gg_name.value) {
		alertify.error('모임명이 입력되지 않았습니다.');
		f.gg_name.focus();
		return false;
	}
	if (!f.gg_place.value) {
		alertify.error('상세주소가 입력되지 않았습니다.');
		f.gg_place.focus();
		return false;
	}
	if (!f.gg_total.value) {
		alertify.error('인원이 입력되지 않았습니다.');
		f.gg_total.focus();
		return false;			
	} 
	else if (f.gg_total.value < 2) {
		alertify.error('최소인원은 2명입니다.');
		f.gg_total.focus();
		f.gg_total.value = 2;
		return false;
	}
	if (!f.gg_cost.value) {
		alertify.error('비용이 입력되지 않았습니다.');
		f.gg_cost.focus();
		return false;
	} 
	if (!f.upload.value) {
		alertify.error('대표 이미지가 선택되지 않았습니다.');
		f.upload.focus();
		return false;
	}
	if (!f.gg_detail.value) {
		alertify.error("내용이 입력되지 않았습니다.");
		f.gg_detail.focus();
		return false;
	}
	if (!f.temp_gg_date.value) {
		alertify.error('모임일시가 지정되지 않았습니다.');
		f.temp_gg_date.focus();
		return false;
	}
    
	f.submit();
 }
</script>

<style>
.back {
	width: 1290px;
	height: 770px;
}


.category {
	position: relative;
	width: 435px;
	height: 36px;
	padding-left: 280px;
	background-image: url('group/image/categorySelect.png');
	border: none;
	border-right: 0px;
	border-top: 0px;
	boder-left: 0px;
	boder-bottom: 0px;
}

.meetingName {
	position: relative;
	width: 471px;
	height: 35px;
	padding-left: 280px;
	background-image: url('group/image/meetingName.png');
	border: none;
	border-right: 0px;
	border-top: 0px;
	boder-left: 0px;
	boder-bottom: 0px;
}

.searchButton {
	
}

.detailAddress {
	position: relative;
	width: 471px;
	height: 34px;
	padding-left: 280px;
	background-image: url('group/image/detailedAddress.png');
	border: none;
	border-right: 0px;
	border-top: 0px;
	boder-left: 0px;
	boder-bottom: 0px;
}

.placeName {
	margin-top: 12px;
	margin-left: 263px;
	position: relative;
	width: 469px;
	height: 35px;
	padding-left: 20px;
	background-image: url('group/image/place_name.png');
	border: none;
	border-right: 0px;
	border-top: 0px;
	boder-left: 0px;
	boder-bottom: 0px;
}

.totalMeetingPerson {
	position: relative;
	width: 471px;
	height: 34px;
	padding-left: 280px;
	background-image: url('group/image/totalMeetingPerson.png');
	border: none;
	border-right: 0px;
	border-top: 0px;
	boder-left: 0px;
	boder-bottom: 0px;
}

.fee {
	position: relative;
	width: 174px;
	height: 34px;
	padding-left: 280px;
	background-image: url('group/image/fee.png');
	border: none;
	border-right: 0px;
	border-top: 0px;
	boder-left: 0px;
	boder-bottom: 0px;
}

.back {
	margin-top: -150px;
	margin-left: 40px;
}

.back2 {
	margin-top: 40px;
	margin-left: 60px;
}

input.date {
	width:225px; 
	height:35px;
	margin-left: 142px;
	padding-left:5px;
	background-image: url('group/image/CalendarBox.png');
	border:none; border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;
}

div.mapAll {
	margin-left: 263px;
}

input.repimg{
   width:386px;
   height:40px;
   background-image:url('/YOGI/lendplace/css/lendplaceForm/rep_img.png');
   border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;
}

textarea.meetingDetail {
	position: relative;
	width: 550px;
	height: 308px;
	padding-left: 280px;
	padding-top: 20px; 
	background-image : url('group/image/meetingDetail.png');
	border: none;
	border-right: 0px;
	border-top: 0px;
	boder-left: 0px;
	boder-bottom: 0px;
}

.open{

    position:relative;
	width:172px;
    height:50px;
	background:url('group/image/open.png');
	cursor:pointer;
	border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;
}
.cancel{
	position:relative;
	width:172px;
    height:50px;
	background:url('group/image/cancel.png');
	cursor:pointer;
	border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;
}
div.buttonOC{
	position: relative;
	margin-top: 70px;
	margin-left: 420px;
	margin-bottom: 100px;
	
}
</style>

</head>
<body>
<form name="gow_form"  action="groupWrite.action" method="post" enctype="multipart/form-data" theme="simple">
	<input type="hidden" name="m_grade" value="<s:property value="m_grade"/>">
	<input type="hidden" name="m_no1" value="<s:property value="m_no1"/>">
	<br>
	<div class="back">
		<img src="group/image/Shape.png" onclick="location.href='main.action'">
		<img src="group/image/makeGroup.png">
		<br>
		<div class="back2">
			<select class="category" name="gg_category">
					<option value="실외활동">실외활동</option>
					<option value="패션">패션</option>
					<option value="맛집">맛집</option>
					<option value="게임">게임</option>
					<option value="동물">동물</option>
					<option value="보드게임">보드게임</option>
					<option value="전시/공연">전시/공연</option>
					<option value="취업/스터디">취업/스터디</option>
					<option value="춤">춤</option>
					<option value="독서/토론">독서/토론</option>
					<option value="음악">음악</option>
					<option value="언어교환">언어교환</option>
					<option value="여행">여행</option>
					<option value="웰빙">웰빙</option>
					<option value="공예">공예</option>
				</select>
			<br><br>
			<input autocomplete="off" class="meetingName" type="text" name="gg_name" placeholder="모임명을 입력해주세요." maxlength="32">
			<br><br>
			<img alt="" src="group/image/meetingDate.png">
			<input autocomplete="off" type="text" class="date" name="temp_gg_date" size="5">
			<br><br>
			<div class="mapAll">
				<input autocomplete="off" name ="search_keyword_addr" id="search_keyword_addr" type="text" size="53%" placeholder="※현재 장소신청은 서울만 가능합니다" onkeypress="searchAddrEnterKey();" maxlength="25" class="searchAddrEnterKey"> 
				<input type="button" value="검색" onclick="searchAddrEnterKey('13');" class="searchButton"> 
				<div class="map_wrap">
					<div id="map" style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>
				</div>
			</div>
			<br><br>
			<input id="detail_addr" type="text" name="gg_place" size="73%" placeholder="지도를 클릭하면 주소가 자동으로 입력됩니다." maxlength="30" class="detailAddress">
			<br>
			<input class="placeName" type="text" id="place_name" name="gg_simple" placeholder="지도를 클릭하면  장소 이름이 자동으로 입력됩니다." maxlength="50">
			<br><br>
			<input type="number" id = "gg_total" name="gg_total" value="2" size="5" maxlength="6" class="totalMeetingPerson">
			<br><br>
			<input type="number" id="gg_cost" name="gg_cost" value="0" size="5" maxlength="7" class="fee">
			<br><br>
			<textarea name="gg_detail" class="meetingDetail"></textarea>
			<br><br>
			<input class="repimg">
			<s:file name="upload"theme="simple"/>
			<br>
		</div>
		<div class="buttonOC">
			<input type="button" onclick="valueCheck();" class="open">&nbsp;&nbsp;&nbsp; 
			<input type="button" onclick="location.href='main.action'" class="cancel">
		</div>
	</div>
</form>

<script
		src="//apis.daum.net/maps/maps3.js?apikey=a18085cad4f8315645fc4a233bdb2875&libraries=services"></script>

	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new daum.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		// 지도를 생성합니다    
		var map = new daum.maps.Map(mapContainer, mapOption);

		// 장소 검색 객체를 생성합니다
		var ps = new daum.maps.services.Places();
		var searchAddr = document.getElementById('search_keyword_addr');
		function searchAddrEnterKey(btn) {
			if (event.keyCode == 13 || btn == 13) {
				ps.keywordSearch(searchAddr.value, placesSearchCB);
			}
		}

		// 키워드 검색 완료 시 호출되는 콜백함수 입니다
		function placesSearchCB(status, data, pagination) {
			if (status === daum.maps.services.Status.OK) {

				// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
				// LatLngBounds 객체에 좌표를 추가합니다
				var bounds = new daum.maps.LatLngBounds();

				for (var i = 0; i < data.places.length; i++) {
					displayMarker(data.places[i]);
					bounds.extend(new daum.maps.LatLng(data.places[i].latitude,
							data.places[i].longitude));
				}
				// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
				map.setBounds(bounds);
			}
		}

		// 지도에 마커를 표시하는 함수입니다
		function displayMarker(place) {
			// 마커를 생성하고 지도에 표시합니다
			var marker = new daum.maps.Marker(
					{
						map : map,
						position : new daum.maps.LatLng(place.latitude,
								place.longitude)
					});

			daum.maps.event
					.addListener(
							marker,
							'click',
							function() {
								searchDetailAddrFromCoords(
										new daum.maps.LatLng(place.latitude,
												place.longitude),
										function(status, result) {
											if (status === daum.maps.services.Status.OK) {
												var detailAddr = !!result[0].roadAddress.name ? result[0].roadAddress.name
														: result[0].jibunAddress.name;
												document
														.getElementById('detail_addr').value = detailAddr;
												document
														.getElementById('place_name').value = place.title;
												// 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
												infowindow
														.setContent('<div style="padding:5px;font-size:12px;">'
																+ place.title
																+ '</div>');
												infowindow.open(map, marker);
											}
										});
							});
		}

		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new daum.maps.services.Geocoder();
		var marker = new daum.maps.Marker() // 클릭한 위치를 표시할 마커입니다
		, infowindow = new daum.maps.InfoWindow({
			zindex : 1
		}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다

		// 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
		daum.maps.event
				.addListener(
						map,
						'click',
						function(mouseEvent) {
							searchDetailAddrFromCoords(
									mouseEvent.latLng,
									function(status, result) {
										if (status === daum.maps.services.Status.OK) {
											var detailAddr = !!result[0].roadAddress.name ? result[0].roadAddress.name
													: result[0].jibunAddress.name;
											document
													.getElementById('detail_addr').value = detailAddr;

											// 마커를 클릭한 위치에 표시합니다 
											marker
													.setPosition(mouseEvent.latLng);
											marker.setMap(map);

											// 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
											infowindow
													.setContent('<div style="padding:5px;font-size:12px;">'
															+ detailAddr
															+ '</div>');
											infowindow.open(map, marker);
										}
									});
						});

		function searchAddrFromCoords(coords, callback) {
			geocoder.coord2addr(coords, callback); // 좌표로 행정동 주소 정보를 요청합니다
		}

		function searchDetailAddrFromCoords(coords, callback) {
			geocoder.coord2detailaddr(coords, callback); // 좌표로 법정동 상세 주소 정보를 요청합니다
		}
	</script>

</body>
</html>