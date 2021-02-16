<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
// id 세션값 가져오기
String id=(String)session.getAttribute("id");
// pass 파라미터 값 가져오기
String pass=request.getParameter("pass");
// MemberDAO mdao 객체생성
MemberDAO mdao=new MemberDAO();
// int check =  userCheck(id,pass)
int check=mdao.userCheck(id, pass);

// check==1    deleteMember(id)  세션값 초기화  main.jsp이동
// check==0 "비밀번호틀림" 뒤로이동
// check==-1 "아이디없음" 뒤로이동

if(check==1){
	//수정작업 deleteMember(id)함수정의 호출
	mdao.deleteMember(id);
	//세션초기화
	session.invalidate();
	%>
	<script type="text/javascript">
		alert("회원탈퇴 되셨습니다");
		location.href = "../main/main.jsp";
	</script>
	<%
}else if(check==0){
	%>
	<script type="text/javascript">
		alert("비밀번호 틀림");
		history.back();
	</script>
	<%
}else{
	%>
	<script type="text/javascript">
		alert("아이디없음");
		history.back();
	</script>
	<%
}

%>
</body>
</html>