<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
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



<title>Insert title here</title>

   <SCRIPT type = "text/javascript">
   $(document).ready(function() {
	   $('.date1').appendDtpicker({
		"futureOnly" : true,
		"autodateOnStart" : false,
		"locale" : "ko",
		"dateFormat": "YY.MM.DD",
		"dateOnly": true,
		"closeOnSelected": true,
		"calendarMouseScroll": false
		});
	});
   
   
   
   function valueCheck() {
      var f = document.lp_form;
      
      if(f.l_t_sdate.value == "") {
         alertify.error("��� ���� ��¥�� �Է����ּ���");
         f.l_t_sdate.focus();
         return false;
      }
      
      if(f.l_t_edate.value == "") {
          alertify.error("��� ���� ��¥�� �Է����ּ���");
          f.l_t_edate.focus();
          return false;
       }
           
      if(f.l_addr.value == "") {
          alertify.error("��� �� �ּҸ� �Է����ּ���");
          f.l_addr.focus();
          return false;
       }
      
      if(f.l_enable.value == "") {
          alertify.error("�� �ο��� �Է����ּ���");
          f.l_enable.focus();
          return false;
       }
      
      if(f.l_payment.value == "") {
          alertify.error("����� �Է����ּ���");
          f.l_payment.focus();
          return false;
       }
      
      if(f.l_subject.value == "") {
          alertify.error("��Ҹ��� �Է����ּ���");
          f.l_subject.focus();
          return false;
       }
      
      if(f.l_content.value == "") {
          alertify.error("������ �Է����ּ���");
          f.l_content.focus();
          return false;
       }
      
      document.lp_form.submit();
   }
   
   </SCRIPT>
   
 <style>
 .RentalRogo{
 margin-top: 30px;
 margin-left: 50px;
 
 }
 
 .date{
 margin-top: 0px;
 margin-left: 100px;
 
 }

.addrSearch{
   margin-bottom: 20px;
   margin-left: 100px;
   position:relative;
   width:327px;
   height:34px;
   background-image:url('/YOGI/lendplace/css/lendplaceForm/addrsearch.png');
   border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;
}

.addrForm{
   margin-top: 20px;
   margin-left: 100px;
   position:relative;
   width:482px;
   height:34px; padding-left:270px;
   background-image:url('/YOGI/lendplace/css/lendplaceForm/addrForm.png');
   border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;
}

.totalPeople{
   margin-top: 20px;
   margin-left: 100px;
   position:relative;
   width:482px;
   height:34px; padding-left:270px;
   background-image:url('/YOGI/lendplace/css/lendplaceForm/totalpeople.png');
   border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;
}

.fee{
   margin-top: 20px;
   margin-left: 100px;
   position:relative;
   width:183px;
   height:34px; padding-left:270px;
   background-image:url('/YOGI/lendplace/css/lendplaceForm/fee.png');
   border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;
}

.name{
   margin-top: 20px;
   margin-left: 100px;
   position:relative;
   width:482px;
   height:34px; padding-left:270px;
   background-image:url('/YOGI/lendplace/css/lendplaceForm/placename.png');
   border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;
}

.detail{
   margin-top: 30px;
   margin-left: 100px;
   position:relative;
   width:560px;
   height:328px; padding-left:270px;
   background-image:url('/YOGI/lendplace/css/lendplaceForm/detail.png');
   border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;
}

.search{
   margin-left:20px;
   padding-bottom:20px;
   position:relative;
   width:245px;
   height:50px;
   background-image:url('/YOGI/lendplace/css/lendplaceForm/searchbtn.png');
   border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;
   cursor:pointer
}

.repimg{
   margin-top:20px;
   margin-left: 100px;
   position:relative;
   width:386px;
   height:40px;
   background-image:url('/YOGI/lendplace/css/lendplaceForm/rep_img.png');
   border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;
}

.create{
	margin-top:50px;
   margin-bottom:0px;
   margin-left:300px;
   position:relative;
   width:172px;
   height:50px;
   background-image:url('/YOGI/lendplace/css/lendplaceForm/createbtn.png');
   border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;
   cursor:pointer
}

.cancel{
margin-top:20px;
   margin-bottom:400px;
   position:relative;
   width:172px;
   height:50px;
   background-image:url('/YOGI/lendplace/css/lendplaceForm/cancelbtn.png');
   border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;
   cursor:pointer
}

.map_title { position: relative; width: 730px;   height:350px; margin-left: 100px;}

div.map_title{
   border-color: gray;
   border-style: solid;
   border-width: thin;
   position:relative;

}
</style>

</head>
<body>

<div class = "RentalRogo" align="left">
	<img src="/YOGI/lendplace/css/lendplaceForm/placeRental.png">
</div>

<!-- ��� Ÿ��Ʋ  -->
<form name="lp_form"  action="lendplaceFormInsert.action" method="post" enctype="multipart/form-data" theme="simple">
<br>
<div class = "date">
<h2>Rentable period</h2>
<input type="text" autocomplete="off" class="date1" name="l_t_sdate" id="startdt2" size="13">&nbsp;&nbsp;~&nbsp;
<input type="text" autocomplete="off" class="date1" name="l_t_edate" id="enddt2" size="13">
<br>
</div>
<input class = "addrSearch" id="search_keyword_addr" type="text" name="" size="53%" onkeypress="searchAddrEnterKey();" maxlength="25">
<input class = "search" type="button" value="" onclick="searchAddrEnterKey('13');">
   <div class="map_title">
   <div id="map" style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>
   </div>
<input class = "addrForm" id="detail_addr" type="text" name="l_addr" size="73%" placeholder="������ Ŭ���ϸ� �ּҰ� �ڵ����� �Էµ˴ϴ�." maxlength="30">
<br>
<input class="totalPeople" type="number" name="l_enable" value="2" size="5" maxlength="6">&nbsp;&nbsp;</b>
<br>
<br>
<input class="fee" type="number" name="l_payment" value="" size="5" maxlength="7">
<br>
<input class="name" id="o_title" name="l_subject" rows="1" cols="100" maxlength="100"></input>

<textarea class="detail" name="l_content" rows="10" cols="71" maxlength="90"></textarea>
<br>
<br>
<br>

<input class="repimg">
<s:file name="upload" theme="simple"/>
<br>

<input class = "create" type="button" value=" " onclick="valueCheck();">&nbsp;&nbsp;&nbsp; 
<input class = "cancel" type="button" value=" " onclick="location.href='main.action'">

</form>


<script src="//apis.daum.net/maps/maps3.js?apikey=a18085cad4f8315645fc4a233bdb2875&libraries=services"></script>
<script>
   var mapContainer = document.getElementById('map'), // ������ ǥ���� div 
   mapOption = {
      center : new daum.maps.LatLng(37.566826, 126.9786567), // ������ �߽���ǥ
      level : 3
   // ������ Ȯ�� ����
   };

   // ������ �����մϴ�    
   var map = new daum.maps.Map(mapContainer, mapOption);

   // ��� �˻� ��ü�� �����մϴ�
   var ps = new daum.maps.services.Places(); 
   var searchAddr = document.getElementById('search_keyword_addr');
   function searchAddrEnterKey(btn){
       if(event.keyCode == 13 || btn==13) {
         ps.keywordSearch(searchAddr.value, placesSearchCB); 
      }
   }
   
   // Ű���� �˻� �Ϸ� �� ȣ��Ǵ� �ݹ��Լ� �Դϴ�
   function placesSearchCB (status, data, pagination) {
       if (status === daum.maps.services.Status.OK) {

           // �˻��� ��� ��ġ�� �������� ���� ������ �缳���ϱ�����
           // LatLngBounds ��ü�� ��ǥ�� �߰��մϴ�
           var bounds = new daum.maps.LatLngBounds();

           for (var i=0; i<data.places.length; i++) {
               displayMarker(data.places[i]);    
               bounds.extend(new daum.maps.LatLng(data.places[i].latitude, data.places[i].longitude));
           }       
           // �˻��� ��� ��ġ�� �������� ���� ������ �缳���մϴ�
           map.setBounds(bounds);
       } 
   }

   // ������ ��Ŀ�� ǥ���ϴ� �Լ��Դϴ�
   function displayMarker(place) {
       // ��Ŀ�� �����ϰ� ������ ǥ���մϴ�
       var marker = new daum.maps.Marker({
           map: map,
           position: new daum.maps.LatLng(place.latitude, place.longitude) 
       });

       daum.maps.event.addListener(marker, 'click', function() {
          searchDetailAddrFromCoords(new daum.maps.LatLng(place.latitude, place.longitude), function(status, result) {
            if (status === daum.maps.services.Status.OK) {
               var detailAddr = !!result[0].roadAddress.name ? result[0].roadAddress.name : result[0].jibunAddress.name;
               document.getElementById('detail_addr').value=detailAddr;
               document.getElementById('o_title').value=place.title;
               // ��Ŀ�� Ŭ���ϸ� ��Ҹ��� ���������쿡 ǥ��˴ϴ�
                 infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.title + '</div>');
                 infowindow.open(map, marker);
            }
         });
       });
   }
   
   // �ּ�-��ǥ ��ȯ ��ü�� �����մϴ�
   var geocoder = new daum.maps.services.Geocoder();
   var marker = new daum.maps.Marker() // Ŭ���� ��ġ�� ǥ���� ��Ŀ�Դϴ�
    ,infowindow = new daum.maps.InfoWindow({
      zindex : 1
   });  // Ŭ���� ��ġ�� ���� �ּҸ� ǥ���� �����������Դϴ�
   
   // ������ Ŭ������ �� Ŭ�� ��ġ ��ǥ�� ���� �ּ������� ǥ���ϵ��� �̺�Ʈ�� ����մϴ�
   daum.maps.event.addListener(map, 'click', function(mouseEvent) {
      searchDetailAddrFromCoords(mouseEvent.latLng, function(status, result) {
         if (status === daum.maps.services.Status.OK) {
            var detailAddr = !!result[0].roadAddress.name ? result[0].roadAddress.name : result[0].jibunAddress.name;
            document.getElementById('detail_addr').value=detailAddr;
            
            // ��Ŀ�� Ŭ���� ��ġ�� ǥ���մϴ� 
            marker.setPosition(mouseEvent.latLng);
            marker.setMap(map);
            
            // ���������쿡 Ŭ���� ��ġ�� ���� ������ �� �ּ������� ǥ���մϴ�
            infowindow.setContent('<div style="padding:5px;font-size:12px;">' + detailAddr + '</div>');
            infowindow.open(map, marker);
         }
      });
   });

   function searchAddrFromCoords(coords, callback) {
      geocoder.coord2addr(coords, callback); // ��ǥ�� ������ �ּ� ������ ��û�մϴ�
   }

   function searchDetailAddrFromCoords(coords, callback) {
      geocoder.coord2detailaddr(coords, callback); // ��ǥ�� ������ �� �ּ� ������ ��û�մϴ�
   }
</script>



   

</body>
</html>