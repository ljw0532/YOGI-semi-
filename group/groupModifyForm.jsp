<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/YOGI/static/css/openmeetform.css">
<link rel="stylesheet"
   href="/YOGI/static/js/dtpicker/jquery.simple-dtpicker.css">
<link rel="stylesheet" href="/YOGI/static/css/alertify.default.css">
<script src="/YOGI/static/js/alertify.min.js"></script>
<script src="/YOGI/static/js/dtpicker/jquery-1.7.1.js"></script>
<script src="/YOGI/static/js/dtpicker/jquery.simple-dtpicker.js"></script>
<script src="/YOGI/static/js/ckeditor/ckeditor.js"></script>
<script src="/YOGI/static/js/openmeetform.js"></script>

<script>
  
   
   $(function() {
		$('.date').appendDtpicker({
			"futureOnly" : false,
			"autodateOnStart" : false,
			"locale" : "ko",
			"dateFormat": "YY.MM.DD",
			"dateOnly": true	
		});	
		
		$('#startdt').change(function() {
			var de = new Date($('#startdt').handleDtpicker('getDate')); // constructor need to avoid linking object
			de.setDate(de.getDate());
			$('#enddt').handleDtpicker('setMinDate', de); //set min end date is 7 day later then start date
		});	
		
		
		var f = document.gow_form;
		$('.open').click(function(event) {
			f.submit();
			});
		
	});
	$('#searchAddrEnterKey').keypress(function(event) {
		if (event.keyCode == 13) { //여기서 keyCode 13은 엔터키를 의미한다.
			searchSubmit();
		}
	});
</script>
<style>
.back {
   width: 1290px;
   height: 770px;
}

.category {
   position: relative;
   width: 158px;
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
   height: 18px;
   width: 19px;
   margin-left: 150px;
   border: none;
   border-right: 0px;
   border-top: 0px;
   boder-left: 0px;
   boder-bottom: 0px;
   background-image: url('group/image/calendar.png');
}

div.mapAll {
   margin-left: 263px;
}

div.file {
   position: relative;
   width: 74px;
   height: 34px;
   padding-left: 262px;
   background-image: url('group/image/representativeImg.png');
   border: none;
   border-right: 0px;
   border-top: 0px;
   boder-left: 0px;
   boder-bottom: 0px;
}

.open{
cursor:pointer;
}
.cancel{
cursor:pointer;
}
textarea.tb{
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

input.date {
	width:225px; 
	height:35px;
	margin-left: 142px;
	padding-left: 5px;
	background-image: url('group/image/CalendarBox.png');
	border:none; border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;
}

</style>

</head>
<body>
    <s:form onsubmit="return valueCheck();" name="gow_form" action="groupModify" method="post" enctype="multipart/form-data" theme="simple">
   	<input type="hidden" name="gg_no" value="<s:property value="gg_no"/>">  
   <div class="back">
      <img src="group/image/Shape.png" onclick="location.href='groupDetail.action'">
      &nbsp;&nbsp;&nbsp;
      <img src="group/image/makeGroup.png">
      <div class="back2">
              
            <input type="text" name="gg_category" class="category" value="<s:property value="detailData.gg_category"/>" readonly="readonly">
            <br>
            <br>
            <br>
            <input class="meetingName" type="text" name="gg_name" value="<s:property value="detailData.gg_name"/>" readonly="readonly">

            <br>
            <br>
            <br>
            <img alt="" src="group/image/meetingDate.png">
            <input autocomplete="off" type="text" class="date" name="gg_mdate" id="startdt" size="13" value="<s:property value="detailData.gg_date"/>">
            <br>
            <br>
            <br>
            <div class="mapAll">
               <input autocomplete="off" id="search_keyword_addr" type="text" name="" size="53%" placeholder="search for a place" onkeypress="searchAddrEnterKey();" maxlength="25" class="searchAddrEnterKey"> 
               <input type="button" value="검색" onclick="searchAddrEnterKey('13');" class="searchButton"> 
               <br> <br>
               <div class="map_wrap">
                  <div id="map"
                     style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>
               </div>
               <br>
            </div>
            <input id="detail_addr" type="text" name="gg_place" size="73%" value="<s:property value="detailData.gg_place"/>" maxlength="30" class="detailAddress">
            <br>
            <input class="placeName" type="text" name="gg_simple" value="<s:property value="detailData.gg_simple"/>" placeholder="지도를 클릭하면  장소 이름이 자동으로 입력됩니다." maxlength="30" id="place_name">
            <br>
            <br>
            <br>

            
            
            <br>
            <br>
            <br>

            <input type="number" name="gg_total" value="<s:property value="detailData.gg_total"/>" size="5" maxlength="6" class="totalMeetingPerson" readonly="readonly">

            <br>
            <br>
            <br>
            
            <input type="number" name="gg_cost" value="<s:property value="detailData.gg_cost"/>" size="5" maxlength="15" class="fee">
            
            <br>
            <br>
               <textarea name="gg_detail" class="tb"><s:property value="detailData.gg_detail"/></textarea>
            <br>
            <br>
            <br>
            <div class="mapAll">
               * 기본 연락처와 이메일 정보는 회원가입시 입력한 정보로 자동 설정됩니다.<br> * 다른 사람의 전화번호를
               입력했을 경우, 개인정보 도용으로 처벌 받을 수 있습니다.<br> * YOGI는 신청자와 개설자 간의 분쟁에
               책임지지 않습니다.
            </div>
      </div>
      <br> <br>
      <hr>
      <br> <br>
      <div align="center">

         <img src="group/image/open.png" onclick="return valueCheck();" class="open">&nbsp;&nbsp;&nbsp; 
         <img src="group/image/cancel.png" onclick="history.go(-1)" class="cancel"></div>
   </div>
  </s:form>
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