<%@page import="java.util.function.Function"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ForEachTagGeneral.jsp</title>
</head>
<body>
	<fieldset>
		<legend>일반 for문 형태의 forEach tag</legend>
		<!-- 
		필수 속성: begin 및 end 그리고 var속성
		step속성은 생략가능(생략시 1씩증가)
		step은 0보다 큰 정수만
		-->
		<h2>자바코드로 Hn tag 출력</h2>
		<% for(int i=1; i<=6; i++){ %>
		<h<%=i %>>제목 <%=i %></h<%=i %>>
		<%} %>
		
		<h2>EL과 JSTL로 Hn tag 출력</h2>
		<c:forEach begin="1" end="6" step="1" var="i">
			<h${i }>제목${i }</h${i }>
		</c:forEach>
		
		<h2>varStatus속성</h2>
		<!-- 
		varStatus속성에 지정한 변수에는 반복과 관련된 정보를
		추상화한 클래스인 LoopTagStatus객체가 저장된다.
		
		
		loop쓰려면 varStatus="loop"해야한다.
		loop의 count  index  first   last  current
		loop.index는 begin에 지정한 시작값부터 시작
		-->
		<c:forEach begin="3" end="5" var="i" varStatus="loop">
			<h4>${loop.count }번째 반복</h4>
			<ul style="list-style: decimal;">
				<li>\${loop.index } : ${loop.index }</li>
				<li>\${loop.first } : ${loop.first }</li>
				<li>\${loop.last } : ${loop.last }</li>
				<li>\${loop.current } : ${loop.current }</li>
			</ul>
		</c:forEach>
		<h2>varStatus속성을 이용한 스타일 변경</h2>
		<!-- 
		문제 
		반복이 짝수번째일때는  글자색을 red로
		홀수번째일때는 green으로
		첫반복이면 blue
		마지막이면 cyan
		-->
		<c:set var="color" value="red"/>
		<c:forEach begin="1" end="6" step="1" var="i" varStatus="loop">
		
			<c:choose>
				<c:when test="${loop.first }">
					<c:set var="color" value="blue"/>
				</c:when>
				<c:when test="${loop.last }">
					<c:set var="color" value="cyan"/>
				</c:when>
				<c:when test="${loop.count%2==0 }">
					<c:set var="color" value="red"/>
				</c:when>
				<c:otherwise>
					<c:set var="color" value="green"/>
				</c:otherwise>
			</c:choose>
			<h${i }><span style="color: ${color}">JSTL ${i }</span></h${i }>
		
		
		<!-- 
			<c:if test="${loop.index % 2 ==0}" var="colorchange">
				<h${i }><span style="color: red">JSTL ${i }</span></h${i }>
			</c:if>
			<c:if test="${!colorchange }">
				<c:if test="${loop.first }" var="odd">
					<h${i }><span style="color: blue">JSTL ${i }</span></h${i }>
				</c:if>
				<c:if test="${!odd }">
					<h${i }><span style="color: green">JSTL ${i }</span></h${i }>
				</c:if>
			</c:if>
			
			<c:if test="${loop.last }">
				<h${i }><span style="color: cyan">JSTL ${i }</span></h${i }>
			</c:if>
		-->
		</c:forEach>
		
		
		<h2>1부터 100까지 홀수의 합(EL 및 JSTL사용)</h2>
		<c:forEach begin="1" end="100" var="i" >
			<c:if test="${i % 2 != 0 }">
				<c:set var="sum" value="${sum+i }"/>
			</c:if>
		</c:forEach>
		${sum }
		
		<h2>for문 안의 for문(중첩 for문)</h2>
		<!-- 
		1 0 0 0 0
		0 1 0 0 0
		0 0 1 0 0
		0 0 0 1 0
		0 0 0 0 1   출력
		 -->
		<c:forEach begin="1" end="5" var="k">
			<c:forEach begin="1" end="5" var="j">
				<c:if test="${k==j }" var="result">
					1&nbsp;&nbsp;
				</c:if>
				<c:if test="${!result }">
					0&nbsp;&nbsp;
				</c:if>
			</c:forEach>
			<br/>
		</c:forEach>	
		
		
		<h2>구구단 출력</h2>
		<!-- 
		문제 
		짝수행에 마우스 오버시 빨강
		홀수행에 마우스 오버시 노랑
		마우스 아웃시애는 흰색 그리고 table태그를 사용해서 출력하기
		-->
		
		<table style="background: black;border-spacing: 1px;">
			<c:forEach begin="1" end="9" var="k" varStatus="loop">
				<c:if test="${loop.count%2 ==0 }" var="re">
					<c:set var="color" value="red"/>
				</c:if>
				<c:if test="${!re }">
					<c:set var="color" value="yellow"/>
				</c:if>
			
				<tr style="background: white;" onmouseover="this.style.backgroundColor= '${color }';" onmouseout="this.style.backgroundColor= 'white';">
				<c:forEach begin="2" end="9" var="j" >
					
					<td><span color="${color }">${j } * ${k } = ${k*j }</span></td>
				
				</c:forEach>
				</tr>	
			</c:forEach>
		</table>
		
		
					
	</fieldset>
</body>
</html>