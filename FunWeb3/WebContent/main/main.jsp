<%@page import="center.CenterBean"%>
<%@page import="center.CenterDAO"%>
<%@page import="today.TodayDAO"%>
<%@page import="today.TodayBean"%>
<%@page import="board.BoardBean"%>
<%@page import="event.EventBean"%>
<%@page import="event.EventDAO"%>
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
<link href="../css/front.css" rel="stylesheet" type="text/css">

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
<%
	String id= request.getParameter("id");
id = (String)session.getAttribute("id");

// BoardDAO bdao 객체생성
BoardDAO bdao=new BoardDAO();
EventDAO edao = new EventDAO();
TodayDAO tdao = new TodayDAO();
CenterDAO cdao = new CenterDAO();
// 게시판 전체 글 개수 가져오기   select count(*) from board
// int count =  getBoardCount()
int count=bdao.getBoardCount();
count = edao.getBoardCount();
// 한페이지 보여줄 글개수 설정
int pageSize=5;

// 현페이지 번호 
String pageNum=request.getParameter("pageNum");


if(pageNum==null){
	pageNum="1";
}

int currentPage=Integer.parseInt(pageNum);
// List boardList  =  getBoardList()  메서드 만들고 호출
//시작하는 행번호 구하기

// int startRow = ((currentPage * pageSize)-9);
// int startRow = ((currentPage * pageSize)-(pageSize-1));
int startRow=(currentPage-1)*pageSize+1;

//마지막 행번호 구하기 - 알고리즘

int endRow= currentPage*pageSize;

// String sql="select * from board order by num desc limit startRow-1,pageSize";

List<BoardBean> boardList=bdao.getBoardList(startRow, pageSize);
List<EventBean> boardList2=edao.getBoardList(startRow,pageSize);
List<TodayBean> todayList=tdao.getBoardList(startRow, pageSize);
List<CenterBean> centerList=cdao.getBoardList(startRow, pageSize);

%>


<div id="wrap">
<!-- 헤더파일들어가는 곳 -->
<jsp:include page="../inc/top.jsp"/>

<!-- 헤더파일들어가는 곳 -->
<!-- 메인이미지 들어가는곳 -->
<div class="clear"></div>
<div id="main_img"><img src="../images/main_img.jpg"
 width="971" height="282"></div>
<!-- 메인이미지 들어가는곳 -->
<!-- 메인 콘텐츠 들어가는 곳 -->
<article id="front">
<div id="solution">
<div id="hosting">

<h3>오늘의 라인업</h3>
<p><%
 	// 5단계 while 다음행 이동  num,subject,name,date,readcount 열 가져오기
    for(int i=0;i<1;i++){
 	TodayBean tb=todayList.get(i);
 %>
<tr><td class="contxt"><textarea rows="8"><%=tb.getContent()%></textarea></a></td><br>
    </tr>	
	<%
			}
		%>  </p>
</div>

<div id="security">
  
<h3><a href="../event/event.jsp">이벤트</h3></a>
<p> <%
 	// 5단계 while 다음행 이동  num,subject,name,date,readcount 열 가져오기
    for(int i=0;i<boardList2.size();i++){
 	EventBean bb=boardList2.get(i);
 %>
<tr><td class="contxt"><a href="../event/content.jsp?num=<%=bb.getNum()%>"><%=bb.getSubject()%></a></td><br>
    </tr>	
	<%
			}
		%>   </p>
</div>
<div id="payment">
<h3>공지사항</h3>
<p><%
 	// 5단계 while 다음행 이동  num,subject,name,date,readcount 열 가져오기
    for(int i=0;i<centerList.size();i++){
 	CenterBean cb=centerList.get(i);
 %>
<tr><td class="contxt"><a href="../center/content.jsp?num=<%=cb.getNum()%>"><%=cb.getSubject()%></a></td><br>
    </tr>	
	<%
			}
		%></p>
</div>
</div>
<div class="clear"></div>
<div id="sec_news">
<h3><span class="orange">지점현황</h3>
<dl>
<dt>서면점</dt>
<dd><a href="../company/map.jsp">서면점 오시는길</a></dd>
</dl>
<dl>
<dt>동래점</dt>
<dd><a href="../company/map2.jsp">동래점 오시는길</a></dd>
</dl>
<dl>
<dt>경대점</dt>
<dd><a href="../company/map3.jsp">경대점 오시는길</a></dd>
</dl>
<dl>
<dt>팝업스토어</dt>
<dd><a href="../company/map4.jsp">팝업스토어 오시는길</a></dd>
</dl>
</div>
<div id="news_notice">
<h3 class="brown"><a href="../free/free.jsp">자유게시판</a></h3>
<table>
<%
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
    // 5단계 while 다음행 이동  num,subject,name,date,readcount 열 가져오기
   for(int i=0;i<boardList.size();i++){
	BoardBean bb=boardList.get(i);
%>
<tr><td class="contxt"><a href="../free/content.jsp?num=<%=bb.getNum()%>"><%=bb.getSubject() %></a></td>
    <td><%=sdf.format(bb.getDate()) %></td></tr>	
	<%
}
    %>  
</table>
</div>
</article>
<!-- 메인 콘텐츠 들어가는 곳 -->
<div class="clear"></div>
<!-- 푸터 들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"/>
<!-- 푸터 들어가는 곳 -->
</div>
</body>
</html>