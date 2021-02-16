<%@page import="event.EventBean"%>
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
	// // int num  num파라미터 가져오기
int num = Integer.parseInt(request.getParameter("num"));
// BoardDAO bdao 객체생성
EventDAO bdao=new EventDAO();
// BoardBean bb  = getBoard(num)
EventBean bb=bdao.getBoard(num);
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
		<div id="table_search">
			<form method="post" action="BoardupdatePro.jsp" >
				<input type="hidden" name="num" value="<%=num%>">
				<table width="600" border="1" bordercolor="black" align="center">
					<tr>
						<td type="text" id="name" name="name" value="<%=bb.getName()%>">작성자</td>
						<td><%=bb.getName()%></td>
					</tr>
					<tr>
						<td id="title">제 목</td>
						<td><input type="text" name="subject" value="<%=bb.getSubject()%>"></td>
					</tr>
					<tr>
						<td id="title">내 용</td>
						<td ><textarea name="content" cols="72" rows="20"  height="300" ><%=bb.getContent()%></textarea></td></tr>
					
					<tr>
						<td id="title">파일첨부</td>
						<td><input type="file" name="board_file" ></td>
					</tr>

					<tr align="center" valign="middle" value="<%=bb.getNum()%>">
						<td colspan="5">
<%-- 					<a href="BoardupdatePro.jsp?num=<%=num%>" > --%>
						<input type="submit" value="수정" ></a>
						<a href="free.jsp"><input type="button" value="목록"></a>	
						</td>
					</tr>
				</table>
			</form>



		</div>

		<!-- 게시판 -->
		<!-- 본문들어가는 곳 -->
		<!-- 푸터들어가는 곳 -->
		<jsp:include page="../inc/bottom.jsp" />

		<!-- 푸터들어가는 곳 -->
	</div>
</body>
</html>