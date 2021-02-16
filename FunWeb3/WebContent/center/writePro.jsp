<%@page import="center.CenterBean"%>
<%@page import="center.CenterDAO"%>
<%@page import="board.BoardDAO"%>
<%@page import="board.BoardBean"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	// center/writePro.jsp
// 한글처리
request.setCharacterEncoding("utf-8");
// name pass subject content 파라미터 가져오기
String name=request.getParameter("name");
String pass=request.getParameter("pass");
String subject=request.getParameter("subject");
String content=request.getParameter("content");
// int readcount=0 ,  Timestamp date  = 현시스템날짜
int readcount=0;
Timestamp date=new Timestamp(System.currentTimeMillis());

// 패키지 board  파일이름 BoardBean  만들기  멤버변수 set() get()
// BoardBean bb 객체생성
// 멤버변수 <= 파라미커 값 저장
CenterBean bb=new CenterBean();
bb.setName(name);
bb.setPass(pass);
bb.setSubject(subject);
bb.setContent(content);
bb.setReadcount(readcount);
bb.setDate(date);

// 패키지 board 파일이름 BoardDAO 만들기
// 리턴값없음 insertBoard(bb) 메서드 만들기
// BoardDAO bdao 객체 생성
// insertBoard(bb) 메서드 호출 
CenterDAO bdao=new CenterDAO();
bdao.insertBoard(bb);
// notice.jsp 글목록 이동
response.sendRedirect("notice.jsp");
%>
</body>
</html>



