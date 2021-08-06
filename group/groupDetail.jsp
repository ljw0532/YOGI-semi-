<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/YOGI/static/css/openmeetdetail.css">
<link rel="stylesheet" href="/YOGI/static/css/alertify.default.css">
<script src="/YOGI/static/js/alertify.min.js"></script>
<script src="//apis.daum.net/maps/maps3.js?apikey=a18085cad4f8315645fc4a233bdb2875&libraries=services" onerror="alertify.log('지도 로드중 에러!')"></script>
<script>
function map() {
	var popupX=(window.screen.width/2)-(700/2);
	
	var popupY=(window.screen.height/2)-(500/2);

	var uri='http://192.168.30.191:8080/YOGI/group/map.jsp?gg_place=<s:property value="detailData.gg_place"/>&gg_simple=<s:property value="detailData.gg_simple"/>';
	var res = encodeURI(uri);
	
	window.open(res,"post","toolbar=no ,width=700 ,height=500 ,directories=no,status=yes,scrollbars=no,menubar=no,left="+ popupX +",top="+ popupY +", screenX="+ popupX +", screenY= "+ popupY);
	    }
</script>
<style>
.back{
	width:1289px;	height:1959px;
	background-image:url('group/detail_image/back.png');
}
img.backshape{
	cursor:pointer;
	position:relative; left:20px; top:20px;
	width:25px; height:25px;
	border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;
}
.details{
	width:609px;	height:495px;
	background-image:url('group/detail_image/details.png');
	margin-top:30px; margin-left:30px;	float:left;
}
.attendants{
	width:390px;	height:495px;
	background-image:url('group/detail_image/attendants.png');
	margin-top:30px; margin-left:40px;	float:left;
}
.comments{
	width:1016px;	height:543px;
	background-image:url('group/detail_image/comments.png');
	margin-top:30px; margin-left:30px;	float:left;
}
.commentsForm{
	width:916px;	height:126px;
	background-image:url('group/detail_image/commentsForm.jpeg');
	margin-top:10px;
}
input.clarity{
	position:relative; left:788px;	top:-3px;
	width:128px;	height:30px;
	border:none;
	background:url('group/detail_image/clarity.png')
}
.line{
	width:916px; height:1px;
	border:none;
	background-image:url('group/detail_image/line.png');
}
input.yetZzim{
	cursor:pointer;
	width:30px; height:28px;
	border:none;
	background:url('group/detail_image/yetZzim.png');
}
input.Zzim{
	cursor:pointer;
	width:30px; height:28px;
	border:none;
	background:url('group/detail_image/Zzim.png');
}
input.join{
	cursor:pointer;
	width:250px; height:37px;
	border:none;
	background:url('group/detail_image/joinBtn.png');
}
input.cancel{
	cursor:pointer;
	width:250px; height:37px;
	border:none;
	background:url('group/detail_image/cancelBtn.png');
}
p{
	font-weight:bold;
}
b{
	font-weigt:500;
}
div.MD
{
	position: relative;
	top:5px; left:850px;
}
.imgSize{
	margin-left: 50px;
	width: 580px;
	height: 370px;
}
td.detailContent{
	margin-left: 100px;
}

</style>
</head>
<body>
<div class="back">

<img src="members/findForm/back.png" class="backshape" onclick="location.href='group.action'">
<div class="MD">
<s:if test="#session.session_m_no == detailData.m_no">
	<input type="button" value="수정" onclick="location.href='groupModifyForm.action?gg_no=<s:property value="detailData.gg_no"/>'">
	<input type="button" value="삭제" onclick="location.href='groupDelete.action?gg_no=<s:property value="detailData.gg_no"/>&m_no=<s:property value="m_no"/>&m_grade=<s:property value="m_garde"/>'">
</s:if>
</div>
 
<table border:none; CELLPADDING="0" CELLSPACING="0" width="1000" height="620" style="margin-top:30px; margin-left:20px">
<tr>
	<td colspan=2>
		<center>
			<p><font color="#7a7a7a" ><s:property value="detailData.gg_category"/></font></p>
			<p><font size="14px"><s:property value="detailData.gg_name"/></font></p>
			<p><font size="3px"><s:property value="detailData.gg_host"/></font><p>
			
		</center>
	</td>
</tr>
<tr height="434">
	<td><img class="imgSize" src='/YOGI/temp/img/<s:property value="detailData.gg_img"/>'/></td>
	<td class="detailContent">
		
		<p><img src="group/detail_image/w_time.png">&nbsp;&nbsp;&nbsp;<s:property value="detailData.gg_date"/></p> <br>
		<p><img src="group/detail_image/w_place.png">&nbsp;&nbsp;
		<s:a href="javascript:map();"><s:property value="detailData.gg_place"/>(<s:property value="detailData.gg_simple"/>)</s:a></p>
		<br>
		 <p><img src="group/detail_image/w_person.png">&nbsp; 총인원 : <s:property value="detailData.gg_total"/>명 /현재 신청인원: <s:property value="gelist.size()"/>명</p>
		<br>		
		<s:if test="detailData.gg_cost > 0">
			<p><img src="group/detail_image/w_money.png">&nbsp; <s:property value="detailData.gg_cost"/>원</p>
		</s:if>
		<s:if test="detailData.gg_cost == 0">
			<p><img src="group/detail_image/w_money.png"> NO CHARGE</p>
		</s:if>
		<br>
		
		<form action="groupLike.action" method="post">
			<input type="hidden" name="gg_no" value="<s:property value="gg_no"/>">
			<input type="hidden" name="m_no" value="<s:property value="m_no"/>">
		<s:if test="detailData.gg_Ilikeit == null" >
			<input class="yetZzim" type="submit" value="">
		</s:if>
		<s:else>
			<input class="Zzim" type="submit" value="">
		</s:else>
		</form>
			
		<br><br>
		<form action="groupEnroll.action" method="post">
			<input type="hidden" name="gg_no" value="<s:property value="gg_no"/>">
			<input type="hidden" name="m_no" value="<s:property value="m_no"/>">			
		<s:if test="detailData.gg_permit == 0" >
		<font color="red"><p>신청마감!!</p></font><br>
		
		<s:if test="detailData.gg_Ienroll != null" >
		<input class="cancel" type="submit" value="">	
		<input type="hidden" name="gg_enable" value="<s:property value="gg_enable"/>">
		<input type="hidden" name="m_grade" value="<s:property value="m_grade"/>">
		</s:if>
				
		</s:if>
		
		<s:else>
			<s:if test="detailData.gg_Ienroll == null" >
				<input class="join" type="submit" value="">
				<input type="hidden" name="gg_enable" value="<s:property value="gg_enable"/>">
				<input type="hidden" name="m_grade" value="<s:property value="m_grade"/>">
			</s:if>
			<s:else>
				<input class="cancel" type="submit" value="">
				<input type="hidden" name="gg_enable" value="<s:property value="gg_enable"/>">
				<input type="hidden" name="m_grade" value="<s:property value="m_grade"/>">
			</s:else>
		</s:else>
		</form>
		
	</td>
</tr>
</table>
<div class="details">
	<div style="margin-top : 90px; margin-left : 45px; margin-right:45px">
	<b><s:property value="detailData.gg_detail" escape="false"/></b>
	</div>
</div>

<div class="attendants">
	<div style="margin-top : 90px; margin-left : 45px; margin-right:45px">
		<s:iterator value="gelist" status="stat">
		<s:if test="%{#stat.index < 6}">
			<p><s:property value="m_name"/>님 <br><p>
		</s:if>
		</s:iterator>
	<s:if test="gelist.size() <= 0">	
		신청자가 없습니다.<br> 첫 참가자가 되어주세요! >__ㅇ
	</s:if>
	</div>
</div>

<div class="comments"><br><br><br>
<font style="margin-left:170px; margin-top:0px">(<s:property value="cmtData.size()"/>)<br></font>
	<s:form action="group_insert_cmt"  method="post">
	<input type="hidden" name="m_grade" value="<s:property value="m_grade"/>">
	<input type="hidden" name="m_no1" value="<s:property value="m_no1"/>">
	
	<div class="commentsForm" style="margin-top : 20px; margin-left : 44px; margin-right:45px">
		<input type="hidden" name="gg_no" value="<s:property value="gg_no"/>">
		<textarea id="cmt_content" name="c_content" style="width:910px; height:88px;" placeholder="Write your comment" title="Write your comment" ></textarea>
		<input class="clarity" type="submit" value="">
	</div>
	</s:form>
	<div class="line" style="margin-top:20px; margin-left:43px;"></div>
	<div style=" margin-left:50px;">
	
		<s:iterator value="cmtData" status="stat" >
			<s:property value="m_name"/> :
			<s:property value="c_content"/>	 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;   
			<s:property value="c_date"/>
			<s:if test="#session.session_m_no == m_no">
					<input type="hidden" name="c_no" value="<s:property value="%{cmtData[#stat.index].c_no}"/>">
					<input type="hidden" name="gg_no" value="<s:property value="detailData.gg_no"/>">
						<input type="hidden" name="m_grade" value="<s:property value="m_grade"/>">
						<input type="hidden" name="m_no1" value="<s:property value="m_no1"/>">
				[<font color="red"><a href="group_delete_cmt.action?c_no=<s:property value="%{cmtData[#stat.index].c_no}"/>&gg_no=<s:property value="gg_no"/>">삭제</a></font>]
				
			</s:if>
			<div class="line" style="margin-top:5px; margin-botton:5px; margin-left:-5px;"></div>
		</s:iterator>
		
	</div>
</div>

</body>
</html>