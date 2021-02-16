<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
function pValue(){
	
	document.getElementById("userId").value=opener.document.fr.id.value;
	
}

function blankCheck(p) {
	var id=p.id.value;
	if(id.length<4){
		alert("아이디는 4글자 이상 입력해 주세요");
		return false
		}
	return true;
}





</script>
<title>Insert title here</title>
</head>
<body onload="pValue()">

	<div style = "text-align: center;" id="wrap">
		<h3>아이디 중복확인</h3>
		<form method="post"
				action="idCheckProc.jsp"
				onsubmit="return blankCheck(this)">
				
		아이디 : <input type="text" name="id" maxlength="10" autofocus id="userId">
		<input type="submit" value = "중복확인">
		</form>
		</div>
</body>
</html>