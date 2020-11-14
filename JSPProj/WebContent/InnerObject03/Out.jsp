<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    
    %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Out.jsp</title>
</head>
<body>
	<fieldset>
	<!-- 지시어에 들어간 정보를 알 수 있다. -->
		<legend>out내장객체</legend>
		<h2>버퍼와 관련된 메서드</h2>
		<%
		out.println("버퍼에 저장될 문자열<br/>");
		//버퍼에 저장된 내용이 웹브라우저로 바로 전송됨.
		out.flush();
		out.println("웹브라우저에 출력이 안될 문자열");
		//버퍼를 비웠다. "웹브라우저에 출력이 안될 문자열"는 출력이 안된다.
		out.clearBuffer();
		
		
		out.println("마지막으로 저장될 문자열");
		
		%>
		<h2>기타 메서드</h2>
		<ul style="list-style:upper-roman">
			<li>자동 플러쉬 여부: <%=out.isAutoFlush() %></li>
			<!-- 지시어에 있는  AutoFlush여부를 보여준다.-->
			<li>버퍼크기: <%=out.getBufferSize() %>byte</li>
			<li>남은 버퍼크기: <%= out.getRemaining() %>byte</li>
		</ul>
		<h2>print와 println의 차이</h2>
		<h4>print method</h4>
		<%
			out.print("<table style='border-spacing: 2px;background-color:red;'>");
				out.print("<tr style ='background-color:white'>");
					out.print("<td>가</td><td>나</td>");
				out.print("</tr>");
			out.print("</table>");
		
		%>
		<!--  
		웹에서 보는것은 차이가 없지만
		페이지 소스보기에서 println이 가독성이 높다.(줄바꿈이 되어있다.) 
		 -->
		<h4>println method</h4>
		<%
			out.println("<table style='border-spacing: 2px;background-color:red;'>");
				out.println("<tr style ='background-color:white'>");
					out.println("<td>가</td><td>나</td>");
				out.println("</tr>");
			out.println("</table>");
		
		%>
		
		
		
		
	</fieldset>
</body>
</html>