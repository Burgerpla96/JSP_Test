<%@page import="java.util.Vector"%>
<%@page import="java.util.Collection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 이거 해야 JSTL자동완성 쓸 수 있다. -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ELOperator.jsp</title>
</head>
<body>
	${"<h2>HELLO</h2>"}
	<!-- 자바코드로 자동 변환된다. -->
	
	
	<fieldset>
		<legend>EL의 연산자들</legend>
		<h2>EL의 null 연산</h2>
		<!-- null은 연산시 0이다. -->
		<ul style="list-style: upper-roman;">
			<li>\${null+10 } : ${null+10 }</li>
			<!-- '\'처리시 자바코드로 변환하지 않는다. -->
			<li>\${null*10 } : ${null*10 }</li>
			<li>param내장객체 : ${param}</li>
			<li>${param.myparam+10} : ${param.myparam+10}</li>
			<li>${param['myparam']+10} : ${param["myparam"]+10}</li>
			<!-- myparam 으로 쿼리스트링을 넘겨주면 값이 변한다. -->
			<% String varInScriptlet="스크립틀릿 안에서 선언한 변수"; %>
			<!-- 
			EL에서 스크립트요소에서 선언한 변수를 쓸 수 없다.
			EL변수는 JSTL에서 선언하기
			 -->
			<li>\${varInScriptlet } : ${varInScriptlet }</li>
		</ul>
		
		<h2>JSTL로 EL에서 사용할 변수 선언</h2>
		<!-- JSTL도 자바코드로 변환된다. -->
		<c:set var="elVar" value="<%=varInScriptlet %>" scope="page"/>
		<!-- scope속성 default는 page -->
		\${elVar } : ${pageScope.elVar }
		
		
		<h2>EL변수에 값 할당 불가(출력언어 이므로)</h2>
		<!-- 톰켓 8.0부터는 할당가능하나 비권장 -->
		<c:set var="fnum" value="9"/>
		<c:set var="snum" value="5"/>
		\${fnum=100 } : \${fnum=100 }
		
		
		<h2>EL변수에 값 할당 불가(출력언어 이므로)</h2>
		<ul style="list-style: upper-roman;">
			<li>\${fnum+snum } : ${fnum+snum }</li>
			<li>\${fnum-snum } : ${fnum-snum }</li>
			<li>\${fnum*snum } : ${fnum*snum }</li>
			<li>\${fnum/snum } : ${fnum/snum }</li>
			<li>\${fnum%snum } : ${fnum%snum }</li>
			<li>\${fnum div snum } : ${fnum div snum }</li>
			<li>\${fnum mod snum } : ${fnum mod snum }</li>
			<!-- 문자를 수로 자동변환 -->
			<li>\${"100"+100 } : ${"100"+100 }</li>
			<!-- 문자열 더하기 에러발생 -->
			<li>\${'HELL'+'OW' } : \${'HELL'+'OW' }</li>
			
		</ul>
		
		
		<h2>EL비교 연산자</h2>
		<c:set var="fnum" value="100"/>
		<c:set var="snum" value="9"/>
		<ul style="list-style: upper-roman;">
			<!-- 
			JSTL에 저장된 변수는 모두 String으로 읽어 비교시 compareTo로 비교한다.
			값의 첫번째부터 하나씩 비교한다.
			 -->
			<li>\${fnum>snum } : ${fnum>snum }</li>
			<li>\${100>9 } : ${100>9 }</li>
			<!-- 비교연산자에서는 값변환을 해주지 않는다. -->
			<li>\${"100">'9' } : ${"100">'9' }</li>
			<!--EL에서 문자열 비교를 ==로한다. -->
			<li>\${"JSP" == 'JSP' } : ${"JSP"=='JSP' }</li>
			<li>\${"JSP" eq 'JSP' } : ${"JSP"eq'JSP' }</li>
			<li>\${"JSP" != 'JSP' } : ${"JSP"!='JSP' }</li>
			<li>\${"JSP" ne 'JSP' } : ${"JSP"ne'JSP' }</li>
		
		</ul>
		
		
		<h2>EL논리 연산자</h2>
		<ul style="list-style: upper-roman;">
			<li>\${5>2 && 10 != 10 } : ${5>2 && 10 != 10 }</li>
			<li>\${5 gt 2 and 10 ne 10 } : ${5 gt 2 and 10 ne 10 }</li>
			<li>\${5 >= 2 || 10 < 10} : ${5 >= 2 || 10 < 10}</li>
			<li>\${5 ge 2 or 10 lt 10} : ${5 ge 2 or 10 lt 10}</li>
		
		</ul>
		
		
		<h2>EL삼항 연산자</h2>
		\${10 gt 9 ? '10은 9보다 크다.' : "10은 9보다 크지 않다." } : 
		${10 gt 9 ? '10은 9보다 크다.' : "10은 9보다 크지 않다." }	
			
			
		<h2>EL empty 연산자</h2>
		<!-- 
		null이거나 ""(빈문자열)이거나 배열인 경우는 길이가 0이거나
		컬렉션인 경우는 size가 0인경우 true반환
		
		사용법: \${empty el변수} true나 false반환
		 -->	
		<%
		String nullString = null;
		String emptyString = "";
		Integer[] zeroLength = new Integer[0];
		Collection zeroSize = new Vector();
		
		%>
		<!-- JSTL로 EL에서 사용할 변수 선언 -->
		<c:set var="elnullString" value="<%= nullString%>"/>
		<c:set var="elemptyString" value="<%= emptyString%>"/>
		<c:set var="elzeroLength" value="<%= zeroLength%>"/>
		<c:set var="elzeroSize" value="<%= zeroSize%>"/>
		<ul style="list-style: upper-roman;">
			<li>\${empty elnullString } : ${empty elnullString }</li>
			<li>\${not empty elemptyString } : ${not empty elemptyString }</li>
			<li>\${empty elzeroLength ? '크기가 0인 배열이다.' : '크기가 0이 아닌 배열이다.' } : 
			${empty elzeroLength ? '크기가 0인 배열이다.' : '크기가 0이 아닌 배열이다.' }</li>
			<li>\${!empty elzeroSize ? "객체가 저장되어 있다." : "객체가 저장되어 있지 않다." } : 
			${!empty elzeroSize ? "객체가 저장되어 있다." : "객체가 저장되어 있지 않다."} </li>
		
		</ul>
		
	</fieldset>
</body>
</html>