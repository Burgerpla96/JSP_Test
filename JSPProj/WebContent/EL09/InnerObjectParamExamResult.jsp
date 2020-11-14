<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 이거 해야 JSTL자동완성 쓸 수 있다. -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
request.setCharacterEncoding("UTF-8");

String[] inters = request.getParameterValues("inter");


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>InnerObjectParamExamResult.jsp</title>
</head>
<body>
<!-- 문제) 값받아서 출력해보기.. -->
	<fieldset>
		<legend>javacode(scripting element)로 파라미터 받기</legend>
		<ul style="list-style: upper-roman;">
			<li>이름: <%= request.getParameter("name") %></li>
			<li>성별: <%= request.getParameter("gender") %></li>
			<li>관심사항: <% for(String inter : inters){ out.print(inter+" "); }%></li>
			<li>학력: <%= request.getParameter("grade") %></li>
		</ul>
	
	</fieldset>
	
	<fieldset>
		<legend>EL로 파라미터 받기</legend>
		<!-- 
			하나로 받을때 : param.파라미터명   혹은  param["파라미터명"]
			여러개 받을때 : paramValues.파라미터명   혹은  paramValues["파라미터명"]
		 -->
		<ul style="list-style: upper-roman;">
			<li>이름: ${param.name } </li>
			<li>성별: ${param.gender } </li>
			<!--<li>관심사항: <c:forEach var="i" items='${paramValues.inter }'>${i }&nbsp;</c:forEach> </li>-->
			<li>관심사항:
				<c:forEach items='${paramValues.inter }' var="item" varStatus="loop">
					<c:if test="&{not loop.last}">
						${item },&nbsp;			
					</c:if>
					<c:if test="&{loop.last}">
						${item }			
					</c:if>
				</c:forEach>
			
			</li>
			<li>학력: ${param['grade'] } </li>
			<!-- JSTL tag가 안 써질때 지시어 기억하기!!!!! 
				띄어쓰기 &nbsp; 기억!!-->
		</ul>
	
	</fieldset>
</body>
</html>