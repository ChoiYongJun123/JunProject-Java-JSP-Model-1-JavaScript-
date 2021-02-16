<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
function one() {
	var two = document.getElemantById('two1');
	
	if(two.src.match("two_o")){
		two.src = "../images/company/check/seomyeon.jpg" 
	}else{
			
		two.src = "../images/company/check/dongrea.jpg"
		
	}
	
}


</script>
</head>
<body>
<div id="wrap">
<!-- 헤더가 들어가는 곳 -->
<jsp:include page="../inc/top.jsp"/>

<!-- 헤더가 들어가는 곳 -->

<!-- 본문 들어가는 곳 -->
<!-- 서브페이지 메인이미지 -->
<div id="sub_img"></div>
<!-- 서브페이지 메인이미지 -->
<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
<li><a href="welcome.jsp">대표 인사말</a></li>
<li><a href="check.jsp">지점 현황</a></li>
<li><a href="map.jsp">서면점 오시는 길</a></li>
<li><a href="map2.jsp">동래점 오시는 길</a></li>
<li><a href="map3.jsp">경대점 오시는 길</a></li>
<li><a href="map4.jsp">팝업 오시는 길</a></li>

</ul>
</nav>
<!-- 왼쪽메뉴 -->
<!-- 내용 -->

<article>

<h1>지점현황</h1>
<h3>서면점</h3> 
<a href= "map.jsp">
<div id="social">
<img id ="two1" onclick="one()" src="../images/company/check/seomyeon.jpg" width="500" height="400" alt="서면 본점" >
<a href="https://www.instagram.com/bros_macaron/" target="_blank"><img src="../images/facebook.gif" width="33" 
height="33" alt="instagram"/>
</a><br>

<h3>동래점</h3>
<a href= "map2.jsp">
<div id="social1">
<img src="../images/company/check/dongrea.jpg" width="500" height="400" alt="동래점" >
<a href="https://www.instagram.com/brosmacaron/" target="_blank"><img src="../images/facebook.gif" width="33" 
height="33" alt="instagram"/>

<br>


<h3>경성대점점</h3>
<a href= "map3.jsp">
<div id="social2">

<img src="../images/company/check/gyengsung.jpg" width="500" height="400" alt="경성대점"/>
<br>

<h3>부산 롯데백화점 광복점 팝업 스토어</h3>
<a href= "map4.jsp">
<div id="social3">
<img src="../images/company/check/popup.jpg" width="500" height="400" alt="부산 롯데백화점 광복점 팝업 스토어"/>
<!-- <figcaption>현재 팝업스토어</figcaption> -->

</article>

<!-- 내용 -->
<!-- 본문 들어가는 곳 -->
<div class="clear"></div>
<!-- 푸터 들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"/>
<!-- 푸터 들어가는 곳 -->
</div>
</body>
</html>