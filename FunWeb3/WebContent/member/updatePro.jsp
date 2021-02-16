<%@page import="member.MemberBean"%>
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
request.setCharacterEncoding("utf-8");
String id =(String)session.getAttribute("id");
String pass = request.getParameter("pass");
String email = request.getParameter("email");


String phone = request.getParameter("phone");
String mobile = request.getParameter("mobile");

MemberDAO mdao = new MemberDAO();
MemberBean mb = new MemberBean();
mb.setId(id);
mb.setPass(pass);
mb.setEmail(email);

mb.setPhone(phone);
mb.setMobile(mobile);

mdao.updateMember(mb);
//세션 초기화
session.invalidate();
// "로그아웃" main.jsp 이동
%>
<script type="text/javascript">
	alert("회원정보가 수정되었습니다 재로그인 해주세요!");
	location.href="../main/main.jsp";
</script>
</body>
</html>