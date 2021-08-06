<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta content="text/html; charset=UTF-8">
<title><tiles:getAsString name="title"/></title>
</head>
<body>
<TABLE border:none; CELLPADDING="0" CELLSPACING="0" style="margin-top:-8px; margin-left:-8px;"WIDTH="1440" HEIGHT="1024">
	<TR>
		<TD valign="top" ROWSPAN="3" WIDTH="150px"><tiles:insertAttribute name="sidebar"/></td>
		<TD valign="top" height="770"><tiles:insertAttribute name="body1"/></td>
	</TR>

	<TR>
		<td valign="top" ><tiles:insertAttribute name="body2"/></td>
	</TR>
</TABLE>

</body>
</html>