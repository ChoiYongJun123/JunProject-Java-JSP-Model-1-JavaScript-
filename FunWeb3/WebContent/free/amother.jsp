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
int num = Integer.parseInt(request.getParameter("num"));
String id=(String)session.getAttribute("id");
String name = request.getParameter("name");
// BoardDAO bdao 객체 생성
BoardDAO bdao = new BoardDAO();

// 리턴값없음 updateReadcount(num) 메서드 만들고 호출
bdao.updateReadcount(num);
// BoardBean bb   = getBoard(num) 메서드 만들고 호출
BoardBean bb = bdao.getBoard(num);
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
				<li><a href="free.jsp">자유게시판</a></li>
				<li><a href="#">이벤트</a></li>
				<li><a href="#">1:1 문의</a></li>
				<li><a href="#">Service Policy</a></li>
			</ul>
		</nav>
		<!-- 왼쪽메뉴 -->
		
		<!-- 게시판 -->
		<div id="table_search">
			<form method="post" action="free.jsp" name="boardForm"
				enctype="multipart/form-data">
				<input type="hidden" name="board_id" value="<%=num%>">
				<input type="hidden" name="num" value="<%=num%>">
				<table width="600" border="1" bordercolor="black" align="center">
											
						<%
						if(session.getAttribute("id") != null){
						%>	
						<%if(session.getAttribute("id").equals(bb.getName())) { %>
						<tr>
						<td id="name" name="name">작성자</td>
						<td><%=bb.getName()%></td>
					</tr>
					<tr>
						<td id="title">제 목</td>
						<td name="subject"  size="70"	maxlength="100"  >
						<%=bb.getSubject() %>
							</td>
					</tr>
					<tr>
						<td id="title">내 용</td>
						<td name="conent" cols="72" rows="20"  height="300" ><%=bb.getContent() %>
						
		
						</td>
					</tr>
					<tr>
						<td id="title">파일첨부</td>
						<td><input type="file" name="board_file" /></td>
					</tr>

					<tr align="center" valign="middle">
						<td colspan="5">
						<a href="deletePro.jsp"><input type="button" value="글삭제"></a>
						<a href="updatePro.jsp"><input type="button" value="글수정"></a>
						
						<%} %>
						<%} else{ %>
						<form method="post" action="free.jsp" name="boardForm"
				enctype="multipart/form-data">
				<input type="hidden" name="board_id" value="<%=num%>">
				<input type="hidden" name="num" value="<%=num%>">
						<table width="600" border="1" bordercolor="black" align="center">
						<tr>
						<td id="name" name="name">작성자</td>
						<td><%=bb.getName()%></td>
					</tr>
					<tr>
						<td id="title">제 목</td>
						<td name="subject"  size="70"	maxlength="100"  readonly>
						<%=bb.getSubject() %>
							</td>
					</tr>
					<tr>
						<td id="title">내 용</td>
						<td name="conent" cols="72" rows="20"  height="300" readonly><%=bb.getContent() %>
						
		
						</td>
					</tr>
					<tr>
						<td id="title">파일첨부</td>
						<td><input type="file" name="board_file"   readonly></td>
					</tr>

					<tr align="center" valign="middle">
						<td colspan="5">
						<%}%>
						<a href="javascript:history.back()"><input type="button" value="목록"></a>	
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