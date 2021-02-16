<%@page import="board.BoardDAO"%>
<%@page import="board.BoardBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
<%

String id=(String)session.getAttribute("id");
if(id == null){
	if(id.equals("admin")){
      response.sendRedirect("../member/login.jsp");
}}
%>
</head>
<body>
<div id="wrap">
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/top.jsp"/>
<!-- 헤더들어가는 곳 -->

<!-- 본문들어가는 곳 -->
<!-- 메인이미지 -->
<div id="sub_img_center"></div>
<!-- 메인이미지 -->

<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
<li><a href="../free/free.jsp">자유게시판</a></li>
<li><a href="../down/fnotice.jsp">다운로드 게시판</a></li>
<li><a href="event.jsp">이벤트</a></li>
</ul>
</nav>
<!-- 왼쪽메뉴 -->

<!-- 게시판 -->
<article>
<h1>글쓰기</h1>
<form action="BoardwritePro.jsp" method="post" >
<table id="notice">
<tr><td>글쓴이</td><td><input type="text" size="70"  name="name" value="<%=id%>" readonly></td></tr>
<tr><td>제목</td><td><input size="70" maxlength="100" type="text" name="subject"></td></tr>
<tr><td>내용</td>
    <td><textarea  cols="72" rows="20" rows="10" cols="20" name="content"></textarea></td></tr>
</table>

<div id="table_search">
<input type="submit" value="글쓰기" class="btn" >
<input type="button" value="글목록" class="btn" onclick="location.href='event'.jsp'">
</div>
</form>

<div class="clear"></div>
<div id="page_control">
<a href="#">Prev</a>
<a href="#">1</a><a href="#">2</a><a href="#">3</a>
<a href="#">4</a><a href="#">5</a><a href="#">6</a>
<a href="#">7</a><a href="#">8</a><a href="#">9</a>
<a href="#">10</a>
<a href="#">Next</a>
</div>
</article>
<!-- 게시판 -->
<!-- 본문들어가는 곳 -->
<div class="clear"></div>
<!-- 푸터들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"/>

<!-- 푸터들어가는 곳 -->
</div>
</body>
</html>