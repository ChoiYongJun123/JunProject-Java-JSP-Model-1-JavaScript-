<%@page import="gallery.ImageDAO"%>
<%@page import="gallery.ImageBean"%>
<%@page import="down.DownBean"%>
<%@page import="down.DownDAO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
// center/fwritePro.jsp
// 한글처리
// request.setCharacterEncoding("utf-8");
// cos.jar 파일업로드 프로그램 설치
// MultipartRequest 파일 객체 생성  파일업로드
String realPath=request.getRealPath("/upload");
System.out.println(realPath);
int maxSize=10*1024*1024;
MultipartRequest multi=new MultipartRequest(request,realPath,maxSize,"utf-8",new DefaultFileRenamePolicy());

// name pass subject content 파라미터 가져오기
String name=multi.getParameter("name");
String subject=multi.getParameter("subject");
String content=multi.getParameter("content");
// int readcount=0 ,  Timestamp date  = 현시스템날짜
int readcount=0;
Timestamp date=new Timestamp(System.currentTimeMillis());
// file
String file=multi.getFilesystemName("file");

// 패키지 board  파일이름 BoardBean  만들기  멤버변수 set() get()
// BoardBean bb 객체생성
// 멤버변수 <= 파라미커 값 저장
ImageBean bb=new ImageBean();
bb.setName(name);
bb.setSubject(subject);
bb.setContent(content);
bb.setReadcount(readcount);
bb.setDate(date);
//file
bb.setFile(file);

// 패키지 board 파일이름 BoardDAO 만들기
// 리턴값없음 insertBoard(bb) 메서드 만들기
// BoardDAO bdao 객체 생성
// insertBoard(bb) 메서드 호출 
ImageDAO bdao=new ImageDAO();
bdao.insertBoard(bb);
// notice.jsp 글목록 이동
response.sendRedirect("fnotice.jsp");
%>
</body>
</html>



