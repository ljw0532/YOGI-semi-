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

.mList{
	margin-top : 100px;
	margin-left : 180px;
	width: 1000px;
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


</style>
</head>
<body>
	<div class="back">
		<img src="admin/image/membershipYello.png" class="membership" onclick="location.href='adminMemberList.action'"> 
		<img src="admin/image/report.png" class="report" onclick="location.href='adminReport.action'"> 
		<img src="admin/image/place.png" class="place" onclick="location.href='adminPlace.action'">
		<div class="mList">
			<table class="board" width=100% cellpadding=0 cellspacing=0
				align="center">
				<thead>
				<tr>
					<th align="center">no.</th>
					<th align="center">ID</th>
					<th align="center">이름</th>
					<th align="center">Phone</th>
					<th align="center">가입날짜</th>
					<th align="center">점수</th>
					<th align="center">경고 횟수</th>
				</tr>
				</thead>
				<tbody>
				<s:iterator value="memList" status="stat">
					<tr>
						<td style="border-bottom: 1px solid #ccc;" align="center"><s:property value="m_no" /></td>
						<td style="border-bottom: 1px solid #ccc;" align="center"><s:property value="m_id" /></td>
						<td style="border-bottom: 1px solid #ccc;" align="center"><s:property value="m_name" /></td>
						<td style="border-bottom: 1px solid #ccc;" align="center"><s:property value="m_phone" /></td>
						<td style="border-bottom: 1px solid #ccc;" align="center"><s:date name="m_date" format="yyyy.MM.dd" /></td>
						<td style="border-bottom: 1px solid #ccc;" align="center"><s:property value="m_grade" /></td>
						<td style="border-bottom: 1px solid #ccc;" align="center"><s:property value="m_penalty" /></td>
					</tr>
				</s:iterator>
				</tbody>
				<s:if test="memList.size() <= 0">
					<tr>
						<td td colspan="7" align="center"><h3>등록된 회원이 없습니다.</h3></td>
					</tr>
				</s:if>

				<!-- 페이징 -->
				<tr>
					<td colspan="7" width="100%" align="center"
						style="padding-top: 20px; padding-bottom: 10px"><s:property
							value="pagingHtml" escape="false" /></td>
				</tr>


				<!-- 게시판 검색 -->
				<tr>
					<td colspan="7" align="center">
						<form method="post" action="adminMemberList.action">
							<table>
								<tr>
									<td><select name="searchKey">
											<option value="0" selected="selected">이름</option>
											<option value="1">ID</option>
									</select></td>
									<td><input autocomplete="off" type="text" name="searchWord" size="15"
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