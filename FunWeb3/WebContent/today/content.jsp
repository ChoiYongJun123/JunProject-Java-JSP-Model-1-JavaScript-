<%@page import="today.TodayBean"%>
<%@page import="today.TodayDAO"%>
<%@page import="center.CenterBean"%>
<%@page import="center.CenterDAO"%>
<%@page import="board.BoardBean"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
<!--[if lt IE 9]>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js" type="text/javascript"></script>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/ie7-squish.js" type="text/javascript"></script>
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js" type="text/javascript"></script>
<![endif]-->
<!--[if IE 6]>
 <script src="../script/DD_belatedPNG_0.0.8a.js"></script>
 <script>
   /* EXAMPLE */
   DD_belatedPNG.fix('#wrap');
   DD_belatedPNG.fix('#main_img');   

 </script>
 <![endif]-->
</head>
<body>
<div id="wrap">
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/top.jsp" />
<!-- 헤더들어가는 곳 -->

<!-- 본문들어가는 곳 -->
<!-- 메인이미지 -->
<div id="sub_img_center"></div>
<!-- 메인이미지 -->

<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
<li><a href="../center/notice.jsp">공지사항</a></li>
<li><a href="today.jsp">오늘의 라인업</a></li>
</ul>
</nav>
<!-- 왼쪽메뉴 -->
<%
	String id=(String)session.getAttribute("id");
//int num = num파라미터 가져오기
int num =Integer.parseInt(request.getParameter("num"));
// BoardDAO bdao 객체 생성
TodayDAO bdao=new TodayDAO();
// 리턴값없음 updateReadcount(num) 메서드 만들고 호출
bdao.updateReadcount(num);
// BoardBean bb   = getBoard(num) 메서드 만들고 호출
TodayBean bb=bdao.getBoard(num);
%>
<!-- 게시판 -->
<article>
<h1>Notice Content</h1>
<table id="notice">
<tr><td>글번호</td><td><%=bb.getNum() %></td>
    <td>조회수</td><td><%=bb.getReadcount() %></td></tr>
<tr><td>글쓴이</td><td><%=bb.getName() %></td>
    <td>작성일</td><td><%=bb.getDate() %></td></tr>
<tr><td>글제목</td><td colspan="3"><%=bb.getSubject() %></td></tr>
<tr><td>글내용</td><td colspan="3"><pre><%=bb.getContent() %></pre></td></tr>
</table>

					<div id="table_search">
					<form method="post" action="today.jsp" name="boardForm" enctype="multipart/form-data">
						<tr align="center" valign="middle">
						<td colspan="5">
						<%
						if(session.getAttribute("id") != null){
						%>	
						<%if(session.getAttribute("id").equals(bb.getName())) { %>
						<input type="button" value="글삭제" onclick="location.href='BoarddeleteForm.jsp?num=<%=bb.getNum()%>'">
						<input type="button" value="글수정" onclick="location.href='BoardupdateForm.jsp?num=<%=bb.getNum()%>'">
						<%} %>
						<%} else{ %>
						<%}%>
						<a href="javascript:history.back()"><input type="button" value="목록"></a>	
						</td>
					</tr>
			</form>
			<div class="clear"></div>
<div id="page_control">

</div>
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