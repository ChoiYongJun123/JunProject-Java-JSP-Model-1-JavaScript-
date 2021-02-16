<%@page import="member.MemberBean"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">

</head>
<body>
<%
// 세션값 가져오기
String id=(String)session.getAttribute("id");
// MemberDAO mdao 객체생성
MemberDAO mdao=new MemberDAO();
// MemberBean mb= getMember(id) 메서드호출
MemberBean mb=mdao.getMember(id);
%>
<div id="wrap">
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/top.jsp"/>

<!-- 헤더들어가는 곳 -->

<!-- 본문들어가는 곳 -->
<!-- 본문메인이미지 -->
<div id="sub_img_member"></div>
<!-- 본문메인이미지 -->
<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
<li><a href="deleteForm.jsp">회원 탈퇴</a></li>

</ul>
</nav>
<!-- 왼쪽메뉴 -->
<!-- 본문내용 -->

<article>
<h1>회원 탈퇴</h1>
<form action="deletePro.jsp" id="join" method="post" name="fr">
<fieldset>
<legend>회원 탈퇴</legend>
<label>아이디</label>
<input type="text" name="id" class="id" value=<%=id %>>
<input type="button" value="중복 확인" class="dup"><br>
<label>비밀번호</label>
<input type="password" name="pass" ><br>
<label>비밀번호 확인</label>
<input type="password" name="pass2"><br>
</fieldset>

<div class="clear"></div>
<div id="buttons">
<input type="submit" value="회원 탈퇴" class="submit">
<input type="reset" value="취소" class="cancel" name="cancel" onclick="location.href='../main/main.jsp'">
</div>
</form>
</article>
<!-- 본문내용 -->
<!-- 본문들어가는 곳 -->

<div class="clear"></div>
<!-- 푸터들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"/>
<!-- 푸터들어가는 곳 -->
</div>
</body>
</html>