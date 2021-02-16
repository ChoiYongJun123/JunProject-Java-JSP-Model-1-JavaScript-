<%@page import="center.CenterBean"%>
<%@page import="center.CenterDAO"%>
<%@page import="member.MemberDAO"%>
<%@page import="member.MemberBean"%>
<%@page import="board.BoardDAO"%>
<%@page import="board.BoardBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>board/deletePro.jsp</h1>
<%
	//한글처리
request.setCharacterEncoding("utf-8");
//int num, String pass  파라미터 가져오기
int num = Integer.parseInt(request.getParameter("num"));
String id=request.getParameter("id");
String pass=request.getParameter("pass");
//BoardBean bb 객체생성<= 파라미터값
CenterBean bb=new CenterBean();
bb.setNum(num);
MemberBean mb = new MemberBean();
mb.setId(id);
mb.setPass(pass);
// BoardDAO bdao
CenterDAO bdao=new CenterDAO();

MemberDAO mdao = new MemberDAO();
// int check  = numCheck(bb)
int check=mdao.userCheck(id, pass);

// check==1  deleteBoard(bb)  list.jsp 이동
// check==0  "비밀번호틀림" 뒤로이동
// check==-1  "num없음" 뒤로이동
	// deleteBoard(bb)
bdao.deleteBoard(bb);
	// list.jsp 이동
response.sendRedirect("notice.jsp");
%>
</body>
</html>