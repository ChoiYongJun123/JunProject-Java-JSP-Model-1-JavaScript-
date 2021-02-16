<%@page import="gallery.ImageDAO"%>
<%@page import="gallery.ImageBean"%>
<%@page import="down.DownDAO"%>
<%@page import="down.DownBean"%>
<%@page import="board.BoardDAO"%>
<%@page import="board.BoardBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>board/updatePro.jsp</h1>
<%
	//한글처리
request.setCharacterEncoding("utf-8");
//int num, String name pass subject content 파라미터 가져오기
int num=Integer.parseInt(request.getParameter("num"));

// String name=request.getParameter("name");
String pass=request.getParameter("pass");
String subject=request.getParameter("subject");
String content=request.getParameter("content");
String file = request.getParameter("file");

// BoardBean bb 객체생성<= 파라미터값 
ImageBean bb=new ImageBean();
bb.setNum(num);
// bb.setName(name);
// bb.setPass(pass);
bb.setSubject(subject);
bb.setContent(content);
bb.setFile(file);

// BoardDAO bdao
ImageDAO bdao=new ImageDAO();
	// updateBoard(bb)
	bdao.updateBoard(bb);
	// list.jsp 이동
	response.sendRedirect("fnotice.jsp");
%>
</body>
</html>


