<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="my" uri="/WEB-INF/tlds/mytag.tld" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ChooseWhenOtherwiseTag.jsp</title>
</head>
<body>
	<fieldset>
		<legend>choose ~ when ~ otherwise tag</legend>
		<!-- EL에서 사용할 변수 설정 -->
		<c:set var="numvar" value="99"/>
		<c:set var="strvar" value="JAVA"/>
		<h2>if tag로 짝/홀수 판단</h2>
		<c:if test="${numvar mod 2 == 0 }" var="result">
			${numvar }는 짝수
		</c:if>
		<c:if test="${!result }">
			${numvar }는 홀수
		</c:if>
		<h2>choose ~ when ~ otherwise 태그로 짝/홀수 판단</h2>
		<!-- HTML주석이 choose태그 안에 들어갈 수 없다!!! -->
		<c:choose>
			<c:when test="${numvar % 2 == 0 }">
				<!-- when과 otherwise에는 주석 가능 -->
				${numvar }는 짝수
			</c:when>
			<c:otherwise>
				${numvar }는 홀수
			</c:otherwise>
		</c:choose>
		
		<h2>choose ~ when ~ otherwise 태그로 문자열 비교</h2>
		<c:choose>
			<c:when test="${strvar =='자바' }">
				${strvar } 는 자바
			</c:when>
			<c:when test="${strvar =='java' }">
				${strvar } 는 java
			</c:when>
			<c:otherwise>
				${strvar } 는 JAVA
			</c:otherwise>
		</c:choose>
		
	</fieldset>
	
	<fieldset>
		<legend>점수 확인</legend>
		<form>
			국어 <input type="text" name="kor"/>
			영어 <input type="text" name="eng"/>
			수학 <input type="text" name="math"/>
			<input type="submit" value="확인"/>
		</form>
		<!-- 
		문제
		국영수 점수를 받아서 평균따라서 학점 출력
		 -->
		 <c:set var="kor" value="${param.kor }"/>
		 <c:set var="eng" value="${param.eng }"/>
		 <c:set var="math" value="${param.math }"/>
		 
		<c:if test="${! empty param.kor && ! empty param.eng &&! empty param.math }">
			<!-- 값을 넣었는지 확인 -->
			<c:if test="${my:isNumber(kor) && my:isNumber(eng) && my:isNumber(math) }" var="result">
				<!-- 숫자인지 체크 --> 
			 	<c:set var="sum" value="${param.kor+param.eng+param.math }"/>
			 	<c:choose>
			 		<c:when test="${sum/3 >=90 }">
			 			A학점
			 		</c:when>	
			 		<c:when test="${sum/3 >=80 }">
			 			B학점
			 		</c:when>
			 		<c:when test="${sum/3 >=70 }">
			 			C학점
			 		</c:when>
			 		<c:when test="${sum/3 >=60 }">
			 			D학점
			 		</c:when>
			 		<c:otherwise>
			 			F학점
			 		</c:otherwise>
				</c:choose>
			</c:if>
			<c:if test="${not result }">
				<span style="color: red;font-size: 2em">점수는 숫자만..</span>
			</c:if>
			
		 </c:if>
		 
	</fieldset>
	
	
	
	<fieldset>
		<legend>로그인</legend>
		<form>
			아이디 <input type="text" name="user"/>
			비밀번호 <input type="text" name="pass"/>
			<input type="submit" value="로그인"/>
		</form>
		<!--
		문제
		회원인 경우와 아닌 경우 확인하는 태그라이브러리를 만들고
		DB에 연동하기 
		-->
		<c:set var="user" value="${param.user }"/>
		<c:set var="pass" value="${param.pass }"/>
		<c:if test="${!empty user && !empty pass }">
			<c:if test="${my:isMember(pageContext.servletContext, param.user,param.pass) }" var="re">
				${param.user }님 접속
			</c:if>
			<c:if test="${!re }">
				실패ㅜㅜ
			</c:if>
		</c:if>
		
	</fieldset>
	
	
	
	
</body>
</html>