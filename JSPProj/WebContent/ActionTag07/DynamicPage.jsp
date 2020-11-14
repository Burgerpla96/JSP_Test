<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DynamicPage.jsp</title>
</head>
<body>
	<fieldset>
		<legend>page 를 선택해서 동적으로 페이지 포함하기</legend>
		<form >
			<select name="pageName">
				<option value="">페이지를 선택하세요.</option> 
				<option value="DirectivePage.jsp">DirectivePage.jsp</option>
				<option value="ActionTagPage.jsp">ActionTagPage.jsp</option>
				
			</select>
			<input type="submit" value="페이지 선택"/> 
		
		</form>
		<%
			String pageName = request.getParameter("pageName");
			if(pageName != null && pageName.length() != 0){
		%>
		<jsp:include page="<%= pageName %>"></jsp:include>
		<% } %>
	</fieldset>
	
	<fieldset>
		<legend>계절에 따른 페이지 변환</legend>
		<%
			String season = "";
			Calendar cal = Calendar.getInstance();
			//cal.get(Calendar.MONTH)
			
			SimpleDateFormat sdf = new SimpleDateFormat("M");
			int month = Integer.parseInt(  sdf.format(new Date()));
			
			switch(month-1){
			case 10: case 11: case 0: case 1:
				season = "Winter.jsp";
				break;
			case 2: case 3: case 4:  
				season = "Spring.jsp";
				break;
			case 5: case 6: case 7: case 8:
				season = "Summer.jsp";
				break;
			default: 
				season = "Autumn.jsp";
			}
		
		
		%>
		<jsp:include page="<%= season %>"></jsp:include>
		<!-- 
		문제) 계절에 따른 분기 만들기
		 -->
	</fieldset>

</body>
</html>