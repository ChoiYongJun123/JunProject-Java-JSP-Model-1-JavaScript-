<%@page import="center.CenterBean"%>
<%@page import="center.CenterDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.BoardBean"%>
<%@page import="java.util.List"%>
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
<li><a href="notice.jsp">공지사항</a></li>
<li><a href="../today/today.jsp">오늘의 라인업</a></li>



</ul>
</nav>
<!-- 왼쪽메뉴 -->
<%
	//BoardDAO bdao 객체생성
CenterDAO bdao=new CenterDAO();
// 게시판 전체 글 개수 가져오기   select count(*) from board
// int count =  getBoardCount()
int count=bdao.getBoardCount();
// 한페이지 보여줄 글개수 설정
int pageSize=15;
//현페이지 번호 가져오기  
//http://localhost:8080/FunWeb/center/notice.jsp
//http://localhost:8080/FunWeb/center/notice.jsp?pageNum=2
//pageNum 파라미터 가져오기
String pageNum= request.getParameter("pageNum");
// pageNum 파라미터값이 없으면  "1"로 설정
if(pageNum==null){
	pageNum="1";
}
// pageNum -> 정수형 
int currentPage=Integer.parseInt(pageNum);
// 시작하는 행번호 구하기 - 알고리즘
int startRow= (currentPage-1)*pageSize+1;
//마지막 행번호 구하기 - 알고리즘
int endRow=currentPage*pageSize;
//List boardList  =  getBoardList()  메서드 만들고 호출
//List<BoardBean> boardList=bdao.getBoardList();
//select * from board order by num desc limit 시작행-1,개수
List<CenterBean> boardList=bdao.getBoardList(startRow,pageSize);
// 날짜 모양 변경   날짜 => 문자열
SimpleDateFormat sdf =new SimpleDateFormat("yyyy.MM.dd");
%>
<!-- 게시판 -->
<article>
<h1>Notice [전체 글 개수 : <%=count%>]</h1>
<table id="notice">
<tr><th class="tno">No.</th>
    <th class="ttitle">Title</th>
    <th class="twrite">Writer</th>
    <th class="tdate">Date</th>
    <th class="tread">Read</th></tr>
    <%
    	for(int i=0;i<boardList.size();i++){
    		CenterBean bb=boardList.get(i);
    %>
<tr onclick="location.href='content.jsp?num=<%=bb.getNum()%>'"><td><%=bb.getNum() %></td>
    <td class="left"><%=bb.getSubject() %></td>
    <td><%=bb.getName() %></td><td><%=sdf.format(bb.getDate()) %></td>
    <td><%=bb.getReadcount() %></td></tr>    	
    	<%
    }
    %>
</table>
<div id="table_search">
<form action="noticeSearch.jsp" method="post">
<input type="text" name="search" class="input_box">
<input type="submit" value="search" class="btn">
</form>
</div>
<%
//  String id = 세션값 가져오기 
String id=(String)session.getAttribute("id");
// 세션값이 있으면 글쓰기 버튼 보이기
if(id != null){
	if(id.equals("admin")){

	%>
<div id="table_search">
<input type="button" value="글쓰기" class="btn" 
onclick="location.href='writeForm.jsp'">
</div>	
	<%
}}
%>
<div class="clear"></div>
<div id="page_control">
<%
//전체 페이지 수 구하기  - 알고리즘
int pageCount= count/pageSize+(count%pageSize==0?0:1);
//한화면에 보여지는 페이지개수 설정 
int pageBlock=10;
//시작하는 페이지번호 구하기 -알고리즘
int startPage= (currentPage-1)/pageBlock*pageBlock+1;
//끝나는 페이지번호 구하기 - 알고리즘
int endPage= startPage + pageBlock -1;
//끝나는 페이지 10   전체 페이지 5  => 끝나는 페이지 5변경
if(endPage > pageCount){
endPage=pageCount;
}
if(startPage > pageBlock){
%><a href="notice.jsp?pageNum=<%=startPage-pageBlock%>">Prev</a><%
}
for(int i=startPage;i<=endPage;i++){
	%>
	<a href="notice.jsp?pageNum=<%=i%>"><%=i %></a>
	<%
}
if(endPage < pageCount){
%><a href="notice.jsp?pageNum=<%=startPage+pageBlock%>">Next</a><%
}
%>
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