<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style>
.back{
	width:1290px;
	height:1024px;
	background-image:url('mypage/image/my_background.png');
}
img.edit{
	width:81px; height:14px;
	position:relative; top:-80px; left:1160px;
	border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;
	cursor:pointer
}
img.profile{
	 position:relative; top:71px; left:833px;
	 width:135px; height:135px; 
}
p{	
	position:relative; top:55px; left:938px;
	color:#FFFFFF;	font-family:"돋움",Monospace;		font-size:30px;	font-weight:800;
}

img.mine{
	position:relative; top:365px; margin-left:160px;
	width:116px; height:16px; 
	cursor:pointer
}
img.myown{
	position:relative; top:365px; margin-left:150px;
	width:135px; height:16px; 
	cursor:pointer
}
img.prefer{
	position:relative; top:365px; margin-left:150px;
	width:127px; height:16px; 
	cursor:pointer
}
img.location{
	position:relative; top:365px; margin-left:150px;
	width:137px; height:16px; 
	cursor:pointer
}

.placebookView{
	margin-top: 450px;
	margin-left: 150px;
	width: 1000px;
	height: 600px;
}

</style>
</head>
<body>
<div class = "back">
	<img src="mypage/image/editBtn.png" class="edit" onclick="location.href='ModifyForm.action'">
	<img src="/YOGI/mypage/image/bonobono.png"  class="profile">
	<p>${session_m_id}님</p>
	<img src="mypage/image/mine.png" class="mine" onclick="location.href='mypageWriteHistory.action'">
	<img src="mypage/image/myown.png" class="myown" onclick="location.href='mypageMeetHistory.action'">
	<img src="mypage/image/prefer.png" class="prefer" onclick="location.href='mypageZzimHistory.action'">
	<img src="mypage/image/Location_Application.png" class="location" onclick="location.href='mypagePlacebookHistory.action'">

<div class = "placebookView">

<table width="1100" border="0" cellspacing="0" cellpadding="2" align ="center">
 <tr align="center">
      		<td width="30" align="left"><strong>번호</strong></td>
		<td width="300"><strong>제목</strong></td>
        		<td width="50"align="left"><strong>신청날짜</strong></td>
        		
	<s:iterator value="Plist" status="stat">
			<s:url id="lendplaceDetailURL" action="lendplaceDetail">
				<s:param name="l_no">
					<s:property value="l_no" />
				</s:param>
			</s:url>
			
			<tr>
				<td>
					<s:property value="l_no" />
				</td>
				

				<td>
					<s:a href="%{lendplaceDetailURL}">
						<s:property value="l_subject" />
					</s:a>
				</td>
				
				<td>
					<s:property value="pblist[#stat.index]"/>
				</td>
				
				<td>
				<input type="button" value="취소" onclick="location.href='placebookDelete.action?l_no=<s:property value="l_no"/>'">
				</td>
			</tr>
		</s:iterator>

		<s:if test="Plist.size() <= 0">
			<tr>
				<td colspan="5" align="center">
					<h3>신청한 장소가 없습니다.</h3>
				</td>
			</tr>
		</s:if>

		<!-- 페이징 -->
		<tr>
			<td colspan="5" width="100%" align="center" style="padding-top: 20px; padding-bottom: 10px">
				<s:property value="pagingHtml" escape="false" />
			</td>
		</tr>
</table>
</div>
</div>
</body>
</html>