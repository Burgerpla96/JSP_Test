<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>IfTag.jsp</title>
</head>
<body>
	<fieldset>
		<legend>if tag</legend>
		<c:set value="99" var="numvar"/>
		<c:set value="JSTL" var="strvar"/>
		<!-- if tag는 시작태그와 종료 태그를 사용해서 판단해라.     else문이 없다. -->
		<c:if test="${numvar mod 2 eq 0 }" var="result">
		<!-- test조건의 결과가 var에 저장된다. -->
			${numvar }는 짝수<br/>
		</c:if>
		\${result } : ${result }<br/>
				
		<c:if test="${numvar mod 2 ne 0 }">
			${numvar }는 홀수<br/>
		</c:if>
		
		<!-- 아래는 else효과 -->
		<c:if test="${not result }">
			${numvar }는 홀수<br/>
		</c:if>
		
		<h2>위의 if문(JSTL)을 EL의 삼항연산자로 변경</h2>
		${numvar }는 ${numvar%2==0 ? "짝수":"홀수" }<br/>
		
		<h2>문자열 비교</h2>
		<c:if test="${strvar =='제이에스티엘' }">
			${strvar }는 제이에스티엘
		</c:if>
		<c:if test="${strvar =='jstl' }">
			${strvar }는 jstl
		</c:if>
		<c:if test="${strvar =='JSTL' }">
			${strvar }는 JSTL
		</c:if>
		
		<h2>항상 참 혹은 거짓인 조건</h2>
		<c:if test="${   true  }">
			항상 출력되는 HTML
		</c:if>
		<c:if test="${ false }">
			절대 출력 안되는 HTML
		</c:if>
		<!-- 특히 조심하기!!!! 주의!-->
		<!-- 
		주의! 중요!
		test속성에 EL식이 아닌 일반값을 넣으면 무조건 거짓
		단, 일반값이라도 TRUE(true)인 경우는 true로 판단.
		또한 EL식이더라도 \${}양쪽에 빈 공백이 들어가면 무조건 거짓
		 -->
		 
		 <%
		 	boolean t = true; 
		 %>
		<h2>!!!!!!test 속성에 일반 값으로 조건 설정</h2>
		<c:if test="<%=t %>" var="result">
			100은 거짓이다.
		</c:if>		
		\${result } : ${result }<br/>
		<c:if test="tRuE" var="result">
			tRuE은 참이다.<br/>
		</c:if>		
		<!-- 대소문자는 상관 없지만 띄어쓰기가 있으면 거짓이 된다. -->
		\${result } : ${result }<br/>
		<c:if test="100 > 10" var="result">
			"100 > 10" 은 거짓이다.
		</c:if>		
		\${result } : ${result }<br/>
		
		<h2>EL로 조건 설정시 \${}바깥양쪽에 공백이 있으면 조건이 참이더라도 무조건 거짓이다.</h2>
		<c:if test="${100 > 10 }">
			100 > 10 은 참이다.<br/>
		</c:if>
		\${result } : ${result }<br/>
		<h4>양쪽에 빈 공백을 추가한 경우</h4>
		<c:if test=" ${100 > 10 }  ">
			100 > 10 은 참이다.<br/>
		</c:if>
		\${result } : ${result }<br/>
		
		
		<h2>if tag연습</h2>
		<!-- 문제 
		파라미터로 아이디(user)와 비번(pass)을 받고
		아이디가 "KIM"이로 비번이"1234"인 경우 회원이라고 가정
		회원인 경우 "\${}님 즐감" 출력
		비회원인 경우 "뭐멈" 출력
		?user=KIM&pass=1234
		-->
		<!-- 
		<c:set var="user" value="${pageScope.user }"/>
		<c:set var="pass" value="${pageScope.pass }"/>
		<c:if test='${user eq "KIM" && pass == "1234"}' var="dumdum">
			${user }님 즐감하세요.<br/>
		</c:if>
		<c:if test='${user ne "KIM" && pass != "1234" && user}'>
			아디와 비번 틀려용.<br/>
		</c:if>
		 -->
		<c:if test="${! empty param.user and not empty param.pass }">
			<c:if test="${param.user=='KIM' && param.pass=='1234' }" var ='result'>
				${param.user }님 즐감하세요.<br/>
			</c:if>	
			<c:if test="${!result }">
				아디와 비번 틀려용
			</c:if>
		</c:if>
		
		
		
	</fieldset>
</body>
</html>