<%@page import="member.MemberDAO"%>
<%@page import="member.MemberBean"%>
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
//member/joinPro.jsp

// 한글처리
request.setCharacterEncoding("utf-8");
//  id pass name 파라미터 가져오기
String id=request.getParameter("id");
String pass=request.getParameter("pass");
String name=request.getParameter("name");
Timestamp reg_date=new Timestamp(System.currentTimeMillis());
String email = request.getParameter("email");
String address = request.getParameter("address");
String roadAddress = request.getParameter("roadAddress");
String detailAddress = request.getParameter("detailAddress");
String jibunAddress = request.getParameter("jibunAddress");
String extraAddress = request.getParameter("extraAddress");
String phone = request.getParameter("phone");
String mobile = request.getParameter("mobile");

// 패키지 member   자바빈파일  MemberBean 
// 자바빈 파일 만들어서 객체생성 mb  파라미터값 멤버변수 저장
MemberBean mb=new MemberBean();
mb.setId(id);
mb.setPass(pass);
mb.setName(name);
mb.setReg_date(reg_date);
mb.setEmail(email);
mb.setAddress(address);
mb.setPhone(phone);
mb.setMobile(mobile);
mb.setRoadAddress(roadAddress);
mb.setDetailAddress(detailAddress);
mb.setJibunAddress(jibunAddress);
mb.setExtraAddress(extraAddress);

// 패키지 member  디비작업파일 MemberDAO  
// 디비작업 파일 만들어서 객체생성 mdao  insertMember(자바빈주소)만들어서 호출
MemberDAO mdao=new MemberDAO();
mdao.insertMember(mb);
// loginForm.jsp 이동
response.sendRedirect("login.jsp");

%>




</body>
</html>