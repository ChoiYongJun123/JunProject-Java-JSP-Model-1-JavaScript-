<%@page import="event.EventBean"%>
<%@page import="java.awt.Event"%>
<%@page import="event.EventDAO"%>
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
<%
	// int num = num파라미터 가져오기
int num = Integer.parseInt(request.getParameter("num").trim());
String id=(String)session.getAttribute("id");
String name = request.getParameter("name");
// BoardDAO bdao 객체 생성
EventDAO bdao = new EventDAO();

// 리턴값없음 updateReadcount(num) 메서드 만들고 호출
bdao.updateReadcount(num);
// BoardBean bb   = getBoard(num) 메서드 만들고 호출
EventBean bb = bdao.getBoard(num);
%>
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
<li><a href="../free/free.jsp">자유게시판</a></li>
<li><a href="../down/fnotice.jsp">다운로드 게시판</a></li>
<li><a href="event.jsp">이벤트</a></li>
			</ul>
		</nav>
		<!-- 왼쪽메뉴 -->
		
		<!-- 게시판 -->
		<article>
			<form method="post" action="event.jsp" name="boardForm"
				enctype="multipart/form-data">
				<table id ="notice" >
					<tr><td>글번호</td><td><%=bb.getNum() %></td>
    				<td>조회수</td><td><%=bb.getReadcount() %></td></tr>
					<tr><td>글쓴이</td><td><%=bb.getName() %></td>
    				<td>작성일</td><td><%=bb.getDate() %></td></tr>
					<tr><td>글제목</td><td colspan="3"><%=bb.getSubject() %></td></tr>
					<tr><td>글내용</td><td colspan="3"><%=bb.getContent() %></td></tr>
					<tr><td></td><td></td>
					</tr>

								
								<div id="table_search">
						<%
						if(session.getAttribute("id") != null){
						%>	
						<%if(session.getAttribute("id").equals(bb.getName())) { %>
						<tr><td><input type="button" value="글삭제" onclick="location.href='BoarddeleteForm.jsp?num=<%=bb.getNum()%>'"></td>
						<td><input type="button" value="글수정" onclick="location.href='BoardupdateForm.jsp?num=<%=bb.getNum()%>'"></td></tr>
						<%} %>
						<%} else{ %>
						<%}%>
						<tr><td><a href="javascript:history.back()"><input type="button" value="목록"></a>	
						</div>	
						</td></tr>
						
				</table>
		</form>
</article>
<div class="clear"></div>


<!-- 게시판 -->
<!-- 본문들어가는 곳 -->
<div class="clear"></div>
		<!-- 게시판 -->
		<!-- 본문들어가는 곳 -->
		<!-- 푸터들어가는 곳 -->
		<jsp:include page="../inc/bottom.jsp" />

		<!-- 푸터들어가는 곳 -->
	</div>
</body>
</html>