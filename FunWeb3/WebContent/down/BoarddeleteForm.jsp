<%@page import="down.DownBean"%>
<%@page import="down.DownDAO"%>
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
// int num  num파라미터 가져오기
int num = Integer.parseInt(request.getParameter("num"));

DownDAO bdao=new DownDAO();
//BoardBean bb  = getBoard(num)
DownBean bb=bdao.getBoard(num);


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
<li><a href="fnotice.jsp">다운로드 게시판</a></li>
<li><a href="../event/event.jsp">이벤트</a></li>
			</ul>
		</nav>
		<!-- 왼쪽메뉴 -->
		<!-- 게시판 -->
		<div id="table_search">
			<form action="BoarddeletePro.jsp" method="post">
				<input type="hidden" name="num" value="<%=num%>">
				<article>
				<table id ="notice" >
					<tr><td>글번호</td><td><%=bb.getNum() %></td>
    				<td>조회수</td><td><%=bb.getReadcount() %></td></tr>
					<tr><td>글쓴이</td><td><%=bb.getName() %></td>
    				<td>작성일</td><td><%=bb.getDate() %></td></tr>
					<tr><td>글제목</td><td colspan="3"><%=bb.getSubject() %></td></tr>
					<tr><td>파일</td><td colspan="3"><img src="../upload/<%=bb.getFile() %>" width="100" height="50"></td></tr>
					<tr><td>글내용</td><td colspan="3"><%=bb.getContent() %></td></tr>
					<tr><td>비밀번호</td><td><input type="password" name="pass"></td></tr>
					<tr><td></td><td></td>
					</tr>
						<td colspan="5">
<%-- 					<a href="BoardupdatePro.jsp?num=<%=num%>" > --%>
						<input type="submit" value="글삭제" ></a>
						<a href="fnotice.jsp"><input type="button" value="목록"></a>	
						</td>
				</table>
				</article>
			</form>



		</div>

		<!-- 게시판 -->


</form>	
</body>
</html>

