<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>아이디 중복 확인</title>
<script language="javascript">
	function windowclose() {
		opener.document.userinput.m_id.value = "${m_id}";
		/* opener.document.userinput.checkConfirmId.value="1"; */
		window.close();
	}

	function check() {
		if (idChk.m_id.value == "") {
			alert("아이디를 입력해 주세요");
			idChk.m_id.focus();
			return false;
		}
	}
</script>
</head>
<body style="font-family: sans-serif;">
	<s:if test="chkId==1">

		<form name=idChk onsubmit="return check();">

			<table align="center" width="265" border="0" cellspacing="0" cellpadding="0">

				<tr height="25">
					<td bgcolor="red" align="left" colspan="1" width="10"></td>
					<td align="left" colspan="3">
						<font color="black"><strong>&nbsp;&nbsp;ID 중복</strong></font>
					</td>
				</tr>

			</table>

			<br>

			<table align="center" width="265" border="0" cellspacing="0" cellpadding="0">

				<tr bgcolor="red">
					<td height="1"></td>
				</tr>

				<tr height="10">
					<td></td>
				</tr>

				<tr>
					<td>
						<font color="red">"${m_id }" 는 이미 사용중인 아이디입니다. 다른 아이디를 선택해 주세요</font>
					</td>
				</tr>

				<tr height="10">
					<td></td>
				</tr>

				<tr bgcolor="red">
					<td height="1"></td>
				</tr>

			</table>

			<br> <br>

			<table align="center" width="265" border="0" cellspacing="0" cellpadding="0">

				<tr height="25">
					<td bgcolor="#FF2929" align="left" colspan="1" width="10"></td>
					<td align="left" colspan="3">
						<font color="black"><strong>&nbsp;&nbsp;ID 중복 확인</strong></font>
					</td>
				</tr>

			</table>

			<br>

			<table align="center" width="265" border="0" cellspacing="0" cellpadding="0">

				<tr bgcolor="#FF2929">
					<td height="1"></td>
				</tr>

				<tr height="10">
					<td></td>
				</tr>

				<tr align="center">
					<td>
						<input type=text maxlength=20 name="m_id" />
					</td>
				<tr>
				
				<tr align="center">
					<td style="padding-top:9px;">
						<input type=submit value="ID 중복확인" />
					</td>
				<tr>
				
				<tr height="10">
					<td></td>
				</tr>

				<tr bgcolor="#FF2929">
					<td height="1"></td>
				</tr>

				<tr height="20">
					<td></td>
				</tr>

				<tr>
					<td align="center">
						<input type="button" class="login1" value="닫기" onclick="javascript:window.close();" />
					</td>
				</tr>

			</table>

		</form>

	</s:if>

	<s:else>

		<table align="center" width="265" border="0" cellspacing="0" cellpadding="0">

			<tr height="25">
				<td bgcolor="#FF2929" align="left" colspan="1" width="10"></td>
				<td align="left" colspan="3">
					<font color="black"><strong>&nbsp;&nbsp;사용 가능</strong></font>
				</td>
			</tr>

		</table>

		<br>

		<table align="center" width="265" border="0" cellspacing="0" cellpadding="0">

			<tr bgcolor="#FF2929">
				<td height="1"></td>
			</tr>

			<tr height="10">
				<td></td>
			</tr>

			<tr>
				<td>입력하신 "${m_id}" 는 사용할 수 있는 아이디입니다.</td>
			</tr>

			<tr height="10">
				<td></td>
			</tr>

			<tr bgcolor="#FF2929">
				<td height="1"></td>
			</tr>

			<tr height="20">
				<td></td>
			</tr>

			<tr>
				<td align="center">
					<input type="button" style="width: 113px" class="login1" value="닫기" onclick="javascript:window.close();" />
				</td>
			</tr>
		</table>
	</s:else>
</body>
</html>