<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">


<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAPQIxLy_uIAKtQ6gCQIFrTx5-aUun_Vwc&sensor=false&language="></script> 

<script> 

  function initialize() { 

var myLatlng = new google.maps.LatLng(35.0982, 129.0361); // 좌표값

  var mapOptions = { 

        zoom: 18, // 지도 확대레벨 조정

        center: myLatlng, 

        mapTypeId: google.maps.MapTypeId.ROADMAP 

  } 

  var map = new google.maps.Map(document.getElementById('map_canvas'), mapOptions); 

  var marker = new google.maps.Marker({ 

position: myLatlng, 

map: map, 

title: "팝업" // 마커에 마우스를 올렸을때 간략하게 표기될 설명글

}); 

  } 
window.onload = initialize;


//------------------------------------

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

<h1>오시는길</h1>
<!-- <hr id ="map"> -->
<div id="map_canvas" style="width: 100%; height: 400px; margin:0px;">
<figure ><img src="" width="196" height="226" alt="팝업 스토어">
</figure>
</div>
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