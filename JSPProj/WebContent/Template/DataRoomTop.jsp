<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- DataRoomTop.jsp -->



<style>
	body {
		//min-height: 2000px;
		/*
   		<body> 의 상단에 padding 을 주지 않으면, 네비게이션 바는 다른 콘텐츠를 덮어버립니다.
   		 당신만의 값을 시도해 보거나 하단의 값을 이용하세요. 팁: 기본적으로, 네비게이션 바는 50px 보다 큽니다.
   		*/
		padding-top: 70px;
		padding-bottom: 70px;
	}
</style>

<!-- 상단메뉴 시작 -->
 	<nav class="navbar navbar-default navbar-fixed-top navbar-inverse">
 		<div class="container-fluid">
 		
 			<!-- 모바일의 경우 화면 -->
		<div class="navbar-header">
			<button class="navbar-toggle collapsed" data-toggle="collapse" 
				data-target="#collapse-menu">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span> 
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href='<c:url value="/DataRoom/Index.kosmo"/>'>
				<span class="glyphicon glyphicon-education"></span> KOSMO
			</a>
		</div>
		
		<!-- desktop 용 -->
		<div class="collapse navbar-collapse" id="collapse-menu">
			<!-- navigation bar에 form 추가 -->
			<form class="navbar-form navbar-right">
				<div class="form-group">
					<input type="text" class="form-control" placeholder="Search">
				</div>
				<button type="submit" class="btn btn-info">Submit</button>
			</form>

			<ul class="nav navbar-nav navbar-right">
				<li><a href="<c:url value="/DataRoom/Index.kosmo"/>">Home</a></li>
				<li><a href="#">로그인</a></li>
				<li><a href="<c:url value="/DataRoom/List.kosmo"/>">자료실</a></li>
				<li><a href="#">공지사항</a></li>
			</ul>


		</div>
	</div>
 	</nav><!-- 상단 메뉴 -->