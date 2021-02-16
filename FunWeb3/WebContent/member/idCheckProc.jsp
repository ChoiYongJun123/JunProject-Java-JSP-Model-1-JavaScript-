<%@page import="java.io.PrintWriter"%>
<%@page import="member.MemberBean"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function apply(id) {
	opener.document.fr.id.value=id;
	window.close();
}

</script>
</head>
<body>
	<div style="text-align: center;">
		<h3>아이디 중복확인 결과</h3>
	<%
		
		String id=request.getParameter("id");
		
		MemberDAO mdao= MemberDAO.getInstance();
		
		boolean result = mdao.idCheck(id);
		
		out.println("입력 ID : <strong>" + id + "</strong>");
		if (result){
			out.println("<p style='color:red'> 해당 아이디는 사용할 수 없습니다.</p>");
			
		}else{
			out.println("<p> 사용가능한 아이디 입니다!! </p>");
			out.println("<a href='javascript:apply(\"" +id+ "\")'>[적용] </a>");
		}
	
	%>
		<hr>
		<a href="javascript:history.back()">[다시검색]</a>
		&nbsp;&nbsp;
		<a href="javascript:window.close()">[창닫기]</a>
	</div>
</body>
</html>