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

.rList {
	margin-top : 100px;
	margin-left : 160px;
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
    border-bottom: 1px solid #fff;
    border-top: 2px solid #036;
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
		<img src="admin/image/membership.png" class="membership" onclick="location.href='adminMemberList.action'"> 
		<img src="admin/image/reportYello.png" class="report" onclick="location.href='adminReport.action'"> 
		<img src="admin/image/place.png" class="place" onclick="location.href='adminPlace.action'">
		
		<div class="rList">
	<table width=100% cellpadding=0 cellspacing=0 align="center" class="board">
		<thead>
		<tr>
			<th colspan="5" align="center" style="border-right: 1px solid #fff;">
				주최자
			</th>
			<th colspan="3" align="center">
				모임
			</th>
			<th></th>
		</tr>
		<tr>
			<td align="center">m no.</td>
			<td align="center">ID</td>
			<td align="center">이름</td>
			<td align="center">점수</td>
			<td align="center">신고 횟수 (주최자)</td>
			<td align="center">모임 명</td>
			<td align="center">주최 날짜</td>
			<td align="center">신고 횟수 (모임)</td>
			<td align="center"></td>
		</tr>
		</thead>
		<tbody>
		<s:iterator value="reportList" status="stat">
			<s:url id="groupDetailURL" action="groupDetail">
				<s:param name="gg_name">
					<s:property value="gg_name" />
				</s:param>
			</s:url>
			<tr>
				<td align="center" style="border-bottom: 1px solid #ccc;">
					<s:property value="m_no" />
				</td>
				<td align="center" style="border-bottom: 1px solid #ccc;">
					<s:property value="m_id"/>
				</td>
				<td align="center" style="border-bottom: 1px solid #ccc;">
					<s:property value="m_name"/>
				</td>
				<td align="center" style="border-bottom: 1px solid #ccc;">
					<s:property value="m_grade" />
				</td>
				<td align="center" style="border-bottom: 1px solid #ccc;">
					<s:property value="m_penalty" />
				</td>
				<td align="center" style="border-bottom: 1px solid #ccc;">
					<s:a href="%{groupDetailURL}">
						<s:property value="gg_name" />
					</s:a>
				</td>
				<td align="center" style="border-bottom: 1px solid #ccc;">
					<s:property value="gg_date" />
				</td>
				<td align="center" style="border-bottom: 1px solid #ccc;">
					<s:property value="gg_penalty" />
				</td>
				<td align="center" style="border-bottom: 1px solid #ccc;">
					<input type="button" value="추방" onclick="location.href='adminDeleteMember.action?&m_no=<s:property value="m_no"/>'">
				</td>
			</tr>
		</s:iterator>
		</tbody>
		<s:if test="reportList.size() <= 0">
			<tr>
				<td colspan="9" align="center"><h3>신고된 모임이 없습니다.</h3></td>
			</tr>
		</s:if>
		
		<!-- 페이징 -->
		<tr>
			<td colspan="9" width="100%" align="center" style="padding-top: 20px; padding-bottom: 10px">
				<s:property value="pagingHtml" escape="false" />
			</td>
		</tr>


		<!-- 게시판 검색 -->
		<tr>
			<td colspan="9" align="center">
				<form method="post" action="adminReport.action">
					<table>
						<tr>
							<td>
								<select name="searchKeyR">
									<option value="0" selected="selected">모임 이름</option>
									<option value="1">주최자 ID</option>
									<option value="2">주최자 명</option>
								</select>
							</td>
							<td>
								<input type="text" name="searchWordR" size="15" maxlength="50" />
							</td>
							<td>
								<input type="submit" value="검색" />
							</td>
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