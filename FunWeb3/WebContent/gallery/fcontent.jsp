<%@page import="gallery.ImageBean"%>
<%@page import="gallery.ImageDAO"%>
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
<li><a href="fnotice.jsp">갤러리게시판</a></li>

</ul>
</nav>
<!-- 왼쪽메뉴 -->
<%
//int num = num파라미터 가져오기
int num =Integer.parseInt(request.getParameter("num"));
// BoardDAO bdao 객체 생성
ImageDAO bdao=new ImageDAO();
// 리턴값없음 updateReadcount(num) 메서드 만들고 호출
bdao.updateReadcount(num);
// BoardBean bb   = getBoard(num) 메서드 만들고 호출
ImageBean bb=bdao.getBoard(num);
%>
<!-- 게시판 -->
<article>
<h1>File Notice Content</h1>
<table id="notice">
<tr><td>글번호</td><td><%=bb.getNum() %></td>
    <td>조회수</td><td><%=bb.getReadcount() %></td></tr>
<tr><td>글쓴이</td><td><%=bb.getName() %></td>
    <td>작성일</td><td><%=bb.getDate() %></td></tr>
<tr><td>글제목</td><td colspan="3"><%=bb.getSubject() %></td></tr>
<tr><td>파일</td>
    <td colspan="3">
    하이퍼링크 : <a href="../upload/<%=bb.getFile() %>"><%=bb.getFile() %></a><br>
                    <img src="../upload/<%=bb.getFile() %>" width="100" height="50"> 파일다운 : <a href="file_down.jsp?file_name=<%=bb.getFile() %>"><%=bb.getFile() %></a>
                    </td></tr>
<tr><td>글내용</td><td colspan="3"><%=bb.getContent() %></td></tr>
</table>
<div id="table_search">
<%
// 글수정, 글삭제  - 로그인인증 , 내가 쓴글 일 경우 버튼이 보이기
// 로그인인증 = 세션값이 있으면
String id=(String)session.getAttribute("id");
if(id!=null){
	// 내가 쓴글인지 확인 : 로그인 사람 , 디비에 글쓴사람 일치하면 글수정,글삭제 보이기
	if(id.equals(bb.getName())){
		%>
		<input type="button" value="글수정" class="btn" 
onclick="location.href='BoardupdateForm.jsp?num=<%=bb.getNum()%>'">
<input type="button" value="글삭제" class="btn" 
onclick="location.href='BoarddeleteForm.jsp?num=<%=bb.getNum()%>'">
		<%
	}
}
%>
<input type="button" value="글목록" class="btn" 
onclick="location.href='fnotice.jsp'">
</div>	
<div class="clear"></div>
<div id="page_control">

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