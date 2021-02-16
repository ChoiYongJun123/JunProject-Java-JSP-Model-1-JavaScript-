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
// String id pass 파라미터 가져오기
String id=request.getParameter("id");
String pass=request.getParameter("pass");
// MemberDAO mdao 객체생성
MemberDAO mdao=new MemberDAO();
//신호값 정하기 1 : 아이디 비밀번호 일치,  0 : 비밀번호 틀림, -1 : 아이디없음
// int check  =  userCheck(id,pass)  함수 만들고 호출
int check=mdao.userCheck(id, pass);

if(check==1){
	// 1 : 아이디 비밀번호 일치
	// 세션값 생성 "id",id
		session.setAttribute("id", id);
//		// main.jsp 이동
		response.sendRedirect("../main/main.jsp");
}else if(check==0){
// 	0 : 비밀번호 틀림
	%>
	<script type="text/javascript">
		alert("비밀번호 틀림");
		history.back();
	</script>
	<%
}else{
	//check==-1  아이디없음
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