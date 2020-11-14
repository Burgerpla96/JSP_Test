<%@page import="java.util.Currency"%>
<%@page import="java.text.NumberFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FormatNumberTag.jsp</title>
</head>
<body>
	<fieldset>
		<legend>국제화 tag: formatNumber tag</legend>
		<!--   
		*formatNumber
		- 숫자를 양식에 맞춰 문자열로 변환해주는 태그
		
		필수 속성: value
		type속성의 기본값: number
		groupingUsed속성의 기본값: true(1000단위로 ,가 찍힌다.) 
		-->
		<c:set var="money" value="10000"/>
		<h2>필수 속성만 사용</h2>
		<h4>EL로 출력</h4>
		${money }
		
		<h4>JSTL 국제화 태그로 출력</h4>
		<fmt:formatNumber value="${money }"/>
		
		<h4>JSTL국제화 태그로 출력: 천단위 콤마(,) 찍기 생략</h4>
		<fmt:formatNumber value="${money }" groupingUsed="false"/>
		
		<h4>type="currency"일때: 현지 통화 단위로 출력</h4>
		<fmt:formatNumber value="${money }" type="currency"/>
		
		<h4>type="currency"일때: 통화 단위 $로 출력</h4>
		<fmt:formatNumber value="${money }" type="currency" currencySymbol="$"/>
		
		<h4>type="percent"</h4>
		<fmt:formatNumber value="${money }" type="percent"/><br/>
		<!-- value의 값에 100을 곱해서 %로 보여준다. -->
		<c:set var="per" value="${5/100 }"/>
		<fmt:formatNumber value="${per }" type="percent"/>
		
		<h4>원하는 위치에 출력하고자 할때</h4>
		<fmt:formatNumber value="${money }" type="currency" var="price"/>
		<h4>위 가격을 아래에 출력</h4>
		<span style="border: 5px red solid; background-color: yellow;" >사장님이 미쳤어요!!!</span><br/>
		가격이 <span style="color: red;font-size: 2em">${price }</span> 내렸어요~
		
		<h2>자바코드로 천단위로 콤마찍기</h2>
		<%
			//NumberFormat class이용, singletone으로 디자인 됨
			int money = Integer.parseInt((String)pageContext.getAttribute("money"));
			NumberFormat nf = NumberFormat.getInstance();
			//천 단위로 콤마,찍기: format() method
			String commaMoney = nf.format(money);
			
			//현지 통화 기호 얻기
			Currency currency = nf.getCurrency();
			String symbol = currency.getSymbol();
			out.println(symbol+commaMoney);
		%>
		
	</fieldset>
</body>
</html>