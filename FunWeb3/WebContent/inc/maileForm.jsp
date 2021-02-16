<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table{
		width : 450px;
		margin : auto;
	}
	h1{
		text-align: center;
	}
	td{
		border : 1px dotted gray;
	}
</style>
</head>
<body>
<form action="mailSend.jsp" method="post">
<table>
	<tr><td> 보내는 사람 메일 : </td><td><input type="text" name="sender" value="dydwns264@gmail.com"></td></tr>
	<tr><td> 받는 사람 메일 : </td><td><input type="text" name="receiver"></td></tr>
	<tr><td> 제목 : </td><td><input type="text" name="subject"></td></tr>
	<tr>
		<td>내용 : </td>
		<td><textarea name ="content" rows="20" cols="40">저에게 메일을 보내실 분은 dydwns264@gmail.com 으로 보내주세요</textarea></td>
	</tr>
	
	<tr>
		<td align=center colspan=2><input type="submit" value="보내기"></td>
	</tr>	
</table>
</form>
</body>
</html>