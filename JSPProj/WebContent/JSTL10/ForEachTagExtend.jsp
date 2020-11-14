<%@page import="java.util.TreeMap"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="model.MemberDTO"%>
<%@page import="java.util.Vector"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" uri="/WEB-INF/tlds/mytag.tld" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ForEachTagExtend.jsp</title>
</head>
<body>
	<fieldset>
		<legend>확장 for문 형태의 forEach태그</legend>
		<!-- 
		필수 속성: items 및 var
		-배열이나 컬렉션에서 값을 꺼내올 때 사용
		-varStatus에 지정한 LoopStatusTag객체의 index속성은 항상 0부터 시작
		-->
		<%
			String[] colors = { "red", "green", "yellow", "orange", "#9944a5" };
		%>
		<h2>자바코드로 배열 출력</h2>
		<%
			for (String color : colors) {
		%>
		<h4 style="color: <%=color%>">JSP</h4>
		<%
			}
		%>

		
		<h2>EL 및 JSTL로 배열 출력</h2>
		<c:set var="colors" value="<%=colors%>" />
		<c:forEach var="color" items="${colors }">
			<h4 style="color: ${color }">JSP</h4>
		</c:forEach>

		<h2>varStatus속성</h2>
		<c:forEach var="color" items="${colors }" varStatus="loop">
			<h4>${loop.count }번째반복</h4>
			<ul style="list-style: decimal;">
				<li>\${loop.index } : ${loop.index }</li>
				<li>\${loop.first } : ${loop.first }</li>
				<li>\${loop.last } : ${loop.last }</li>
				<li>\${loop.current } : ${loop.current }</li>
			</ul>

		</c:forEach>

		<h2>리스트 계열 컬렉션</h2>
		<%
			//데이터 준비
		List list = new Vector();
		list.add(new MemberDTO("KIM", "1234", "김길동", null, null));
		list.add(new MemberDTO("LEE", "5678", "이길동", null, null));
		list.add(new MemberDTO("PARK", "9999", "박길동", null, null));
		%>
		<c:set var="list" value="<%=list%>" />
		<h4>일반 for문 형태의 forEach 태그로 출력</h4>
		<c:forEach var="i" begin="0" end="${list.size()-1 }">
			아이디: ${list[i].id }, 비밀번호: ${list[i].pwd }, 이름: ${list[i].name }<br />
		</c:forEach>

		<h4>확장 for문 형태의 forEach 태그로 출력</h4>
		<c:forEach var="item" items="${list }">
			아이디: ${item.id }, 비밀번호: ${item.pwd }, 이름: ${item.name }<br />
		</c:forEach>


		<h2>Map 계열 컬렉션</h2>
		<%
			//데이터 준비
		Map map = new TreeMap();
		map.put("first", list.get(0));
		map.put("second", list.get(1));
		map.put("third", list.get(2));
		%>
		<c:set var="map" value="<%=map%>" />
		<h4>키값을 알 때: el변수.키값 혹은 el변수["키값"]</h4>
		<ul>
			<li>아이디: ${map.first.id }, 비번: ${map.first.pwd }, 이름:
				${map.first.name }</li>
			<li>아이디: ${map.second.id }, 비번: ${map.second.pwd }, 이름:
				${map.second.name }</li>
			<li>아이디: ${map.third.id }, 비번: ${map.third.pwd }, 이름:
				${map.third.name }</li>
		</ul>

		<h4>키값을 모를 때</h4>
		<!-- 
		Key값 얻기: var속성에 지정한 \${EL변수명.key}
		value값 얻기: var속성에 지정한 \${EL변수명.value}
		-->
		<ul>
			<c:forEach var="item" items="${map }">
				<li>키: ${item.key }, 아이디:${item.value.id }, 비번:
					${item.value.pwd }, 이름: ${item.value.name }</li>
			</c:forEach>

		</ul>

	</fieldset>


	<!-- 
	문제
	회원제 게시판에 저장된 글을 읽어와서
	목록으로 출력하여라(위에서 10개만 : start=1, emd=10)
	태그 라이브러리에 목록을 반환하는 메서드를 정의하여 그 메서드를  EL에서 사용하기
	 -->
	
	
	<fieldset>
		<legend>게시판 글 읽어오기</legend>
		<table style="width: 70%; background-color: green; border-spacing: 1px">
				<tr style="background-color: white;">
					<th style="width: 10%">글번호</th>
					<th>제목</th>
					<th style="width: 15%">작성자</th>
					<th style="width: 15%">작성일</th>
				</tr>
			<c:forEach var="view" items="${my:veiwSome(pageContext.servletContext,1,30)}">
				<tr style="background-color: white; text-align: center">
					<td>${view.no }</td>
					<td style="text-align: left">${view.title }</td>
					<td>${view.name }</td>
					<td>${view.postDate }</td>
				</tr>
			</c:forEach>
		</table>
	</fieldset>

</body>
</html>