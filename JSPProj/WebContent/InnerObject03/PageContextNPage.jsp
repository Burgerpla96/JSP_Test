<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PageContextNPage.jsp</title>
</head>
<body>
	<fieldset>
		<legend>pageContext 및 page내장객체</legend>
		<!-- page내장객체는 현재 페이지를 의미 -->
		<h2>pageContext</h2>
		<hr/>
		
		<h4>request내장객체로 전송 방식 얻기</h4>
		<%= request.getMethod()%>
		
		<h4>pageContext내장객체로 전송 방식 얻기</h4>
		<!--  다른 내장객체를  pageContext로 모두 얻을 수 있다.getXXX method이용-->
		<%
		/////pageContext 로 HttpServletRequest을 이용하기!!
		
		//getRequest()는 ServletRequest반환 (HttpServletRequest의 부모..)
		ServletRequest req = pageContext.getRequest(); 
		//getMethod()쓰기 위해 형변환
		String method = ((HttpServletRequest)req).getMethod();
		out.println(method);
		%>
		
		
		<h4>pageContext내장객체로  out내장객체 얻기</h4>
		<%
		//getOut()은 바로 JspWriter (out객체의 타입)를 반환한다.
		pageContext.getOut().println("메서드 체인");
		%>
		
		<h4>application내장객체로  서버의 물리적 경로 얻기</h4>
		<!-- 서버에 뭘 저장할 때 사용 -->
		<%= application.getRealPath("/Images") %>
		
		<h4>pageContext내장객체로  서버의 물리적 경로 얻기</h4>
		<%= pageContext.getServletContext().getRealPath("/Images") %>
		
		
		
		
		
		<h2>page내장 객체</h2>
		<hr/>
		<%
		/*
		page내장객체(Object타입)는 jsp페이지 자체를 의미하고
		this키워드와 같은 의미.
		*/
		out.println("page내장객체의 클래스명: "+page.getClass().getName()+"<br/>");
		out.println("this내장객체의 클래스명: "+this.getClass().getName()+"<br/>");
		out.println(this instanceof HttpServlet ? "page(내장객체)는 서블릿이다."
				: "page(내장객체)는 서블릿이 아니다.");
		
		/*
		*ServletContext(Context 즉 웹사이트 전체 영역에 대한 정보를 
		                       인터페이스로 구현해 놓은 것) 는 웹 어플리케이션 하나당 하나
		 ServletConfig(웹 어플리케이션을 구성하는 서블릿에 대한 정보를
		                     인터페이스로 구현해 놓은 것) 는 Servlet하나당 하나
		 */
		
		
		
		
		%>
		
		
		
		
		
	</fieldset>
</body>
</html>