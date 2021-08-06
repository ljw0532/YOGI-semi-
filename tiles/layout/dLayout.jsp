<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta content="text/html; charset=UTF-8">
<title><tiles:getAsString name="title"/></title>
</head>
<body>
<!-- style="position: fixed;" -->

<TABLE border:none; CELLPADDING="0" CELLSPACING="0" style="margin-top:-8px; margin-left:-8px;" WIDTH="1440" HEIGHT="1959">
	<TR>
		<td valign="top" ROWSPAN="2" WIDTH="150px"><tiles:insertAttribute name="sidebar"/></td>
		<td valign="top"><tiles:insertAttribute name="body"/></td>
	</TR>
</TABLE>

</body>
</html>