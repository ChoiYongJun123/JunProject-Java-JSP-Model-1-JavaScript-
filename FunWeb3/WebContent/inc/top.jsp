<%@page import="member.MemberDAO"%>
<%@page import="member.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<header>
<%
String id=(String)session.getAttribute("id");
%>

<%
MemberBean mb=new MemberBean();
MemberDAO mdao=new MemberDAO();
mb=mdao.getMember(id);
if(id ==null){%>

     <div id="login">
	<a href="../member/login.jsp">로그인</a> | <a href="../member/join.jsp">회원가입</a></div>

	
<%} else {%>
	<div id="login"><%=id %>님 |
	
	 <a href="../member/updateForm.jsp">내정보</a> | <a href="../member/logout.jsp">로그아웃</a> </div>
	
<%}%>


<div class="clear"></div>
<!-- 로고들어가는 곳 -->
<div id="logo"><a href="../main/main.jsp" target="_self"><img src="../images/logo.gif" width="265" height="62" alt="Fun Web"></a></div>
<!-- 로고들어가는 곳 -->
<nav id="top_menu">
<ul>
<!-- 	<li><a href="../main/main.jsp">HOME</a></li> -->
	<li><a href="../company/welcome.jsp">소개</a></li>
	<li><a href="../free/free.jsp">자유게시판</a></li>
	<li><a href="../gallery/fnotice.jsp">갤러리</a></li>
	<li><a href="../center/notice.jsp">고객센터</a></li>
</ul>
</nav>
</header>