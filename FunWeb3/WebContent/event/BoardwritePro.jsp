<%@page import="event.EventDAO"%>
<%@page import="event.EventBean"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="board.BoardDAO"%>
<%@page import="board.BoardBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
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
<h1>center/writePro.jsp</h1>
<%
// 한글처리
// request.setCharacterEncoding("utf-8");
// // name pass subject content 파라미터 가져오기
// String name=request.getParameter("name");
// String pass=request.getParameter("pass");
// String subject=request.getParameter("subject");
// String content=request.getParameter("content");
// // int readcount=0 ,  Timestamp date  = 현시스템날짜
// int readcount=0;
// Timestamp date=new Timestamp(System.currentTimeMillis());

// // 패키지 board  파일이름 BoardBean  만들기  멤버변수 set() get()
// // BoardBean bb 객체생성
// BoardBean bb=new BoardBean();
// // 멤버변수 <= 파라미커 값 저장
// bb.setName(name);
// bb.setPass(pass);
// bb.setSubject(subject);
// bb.setContent(content);
// bb.setReadcount(readcount);
// bb.setDate(date);

// // 패키지 board 파일이름 BoardDAO 만들기
// // 리턴값없음 insertBoard(bb) 메서드 만들기
// // BoardDAO bdao 객체 생성
// BoardDAO bdao=new BoardDAO();
// // insertBoard(bb) 메서드 호출 
// bdao.insertBoard(bb);

// // list.jsp 글목록 이동
// response.sendRedirect("free.jsp");
request.setCharacterEncoding("utf-8");

//콘솔창에 물리적 경로 출력
// 업로드파일크기 10M 
//  한글 "utf-8"
// 동일이름변경 DefaultFileRenamePolicy()

// p310 name pass subject content 파라미터 가져오기
String name=request.getParameter("name");
String subject=request.getParameter("subject");
String content=request.getParameter("content");
// int readcount=0 ,  Timestamp date  = 현시스템날짜
int readcount=0;
Timestamp date=new Timestamp(System.currentTimeMillis());
// file 업로드된 파일 이름 가져오기

// 패키지 board  파일이름 BoardBean  만들기  멤버변수 set() get()
// file set() get() 추가
// BoardBean bb 객체생성  
EventBean bb=new EventBean();
// 멤버변수 <= 파라미커 값 저장
bb.setName(name);
bb.setSubject(subject);
bb.setContent(content);
bb.setReadcount(readcount);
bb.setDate(date);
// file 이름 저장 set메서드호출

// 패키지 board 파일이름 BoardDAO 만들기
// 리턴값없음 insertBoard(bb) 메서드 만들기
// BoardDAO bdao 객체 생성
EventDAO bdao=new EventDAO();
// insertBoard(bb) 메서드 호출 
bdao.insertBoard(bb);

// list.jsp 글목록 이동
response.sendRedirect("event.jsp");



%>

</body>
</html>






