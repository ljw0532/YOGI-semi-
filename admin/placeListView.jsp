<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.back {
	width: 1294px;
	height: 1024px;
	background-image: url('admin/image/background.png');
}

.pList {
	margin-top: 70px;
	margin-left: 120px;
	width: 1080px;
	height: 600px;
}

img.membership {
	position: relative;
	margin-top: 600px;
	margin-left: 200px;
	width: 176px;
	height: 16px;
	cursor:pointer
}

img.report {
	position: relative;
	margin-top: 600px;
	margin-left: 200px;
	width: 122px;
	height: 16px;
	cursor:pointer
}

img.place {
	position: relative;
	margin-top: 600px;
	margin-left: 200px;
	width: 129px;
	height: 16px;
	cursor:pointer
}

table.board thead th{
    padding: 5px;
    color: #369;
    border-top: 2px solid #036;
    border-bottom: 2px solid #036;
    background-color: #ccc;
}

table.board thead td{
    font-weight: bold;
    padding: 5px;
    color: #369;
    border-bottom: 2px solid #036;
    background-color: #ccc;
}

input.lpOpen {
	margin-bottom: 20px;
}
</style>
</head>
<body>
	<div class="back">
		<img src="admin/image/membership.png" class="membership" onclick="location.href='adminMemberList.action'"> 
		<img src="admin/image/report.png" class="report" onclick="location.href='adminReport.action'"> 
		<img src="admin/image/placeYello.png" class="place" onclick="location.href='adminPlace.action'">
		
		<div class="pList">
			<input class="lpOpen" type="button" value="장소등록" onclick="location.href='lendplaceForm.action'">
			<table class="board" width=100% cellpadding=0 cellspacing=0
				align="center">
				<thead>
				<tr>
					<th>no.</th>
					<th>장소 이름</th>
					<th>상세 주소</th>
					<th>렌탈 가능 기간</th>
					<th>예약한 회원 ID</th>
					<th>예약 날짜</th>
				</tr>
				</thead>
				<tbody>
				<s:iterator value="lendPList" status="stat">
					<s:url id="lendplaceDetailURL" action="lendplaceDetail">
						<s:param name="l_no">
							<s:property value="l_no" />
						</s:param>
					</s:url>
					<tr class="board_content_tr">
						<td style="border-bottom: 1px solid #ccc;"><s:property value="l_no" /></td>
						<td style="border-bottom: 1px solid #ccc;"><s:a href="%{lendplaceDetailURL}">
								<s:property value="l_subject" />
							</s:a></td>
						<td style="border-bottom: 1px solid #ccc;" align="center"><s:property value="l_addr" /></td>
						<td style="border-bottom: 1px solid #ccc;" align="center"><s:property value="l_sdate" />&nbsp;~&nbsp;<s:property value="l_edate" /></td>
						<td style="border-bottom: 1px solid #ccc;" align="center"><s:property value="m_id" /></td>
						<td style="border-bottom: 1px solid #ccc;" align="center"><s:property value="l_date"/></td>
					</tr>
				</s:iterator>
				</tbody>
				<s:if test="lendPList.size() <= 0">
					<tr>
						<td colspan="6" align="center"><h3>예약된 장소가 없습니다.</h3></td>
					</tr>
				</s:if>

				<!-- 페이징 -->
				<tr>
					<td colspan="6" width="100%" align="center"
						style="padding-top: 20px; padding-bottom: 10px"><s:property
							value="pagingHtml" escape="false" /></td>
				</tr>

				<!-- 게시판 검색 -->
				<tr>
					<td colspan="8" align="center">
						<form method="post" action="adminPlace.action">
							<table>
								<tr>
									<td><select name="searchKeyP">
											<option value="0" selected="selected">장소 이름</option>
											<option value="1">주소</option>
											<option value="2">예약한 회원 ID</option>
									</select></td>
									<td><input type="text" name="searchWordP" size="15"
										maxlength="50" /></td>
									<td><input type="submit" value="검색" /></td>
								</tr>
							</table>
						</form>
					</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>