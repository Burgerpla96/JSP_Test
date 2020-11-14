<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%! 
	//선언부에서 물리적 경로 얻는 방법들
	//1) this 키워드 사용
	private String getRealPath(){
		return this.getServletContext().getRealPath("/Images");
		
	}
	//2) 매개변수로 내장객체 전달받기
	private String getRealPath(ServletContext app){
		return app.getRealPath("/Images");
	}
	//3) 맴버변수 사용
	private ServletContext application;
	private String getRealPath2(){
		return application.getRealPath("/Images");
	}


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Application_1.jsp</title>
</head>
<body>
	<fieldset>
		<legend>application 내장객체의 주요 메서드</legend>
		<!--  
		Context 초기화 파라미터
		목적: 웹 어플리케이션(컨텍스트)을 구성하는 모든 jsp(서블릿)
			에서 스트링형 상수를 공유하기 위함.
		
		1) web.xml에 컨텍스트 초기화 파라미터 등록 
		2) ServletContext의 getInitParameter("파라미터명") method로 얻기
		
		하나의 Web Appliction은 여러개의 Servlet으로 이루어짐
		각 객체타입  ServletContext 		ServletConfig
		각 객체는  	application			config
		 -->
		<ul style="list-style: upper-roman;">
			<li>오라클 드라이버: <%=application.getInitParameter("ORACLE_DRIVER") %></li>
			<li>오라클 주소: <%= application.getInitParameter("ORACLE_URL") %></li>
			<!-- Context와 다른 Servlet초기화  -->
			<!-- Servlet 초기화 파라미터 -->
			<li>this.getInitParameter(서블릿 초기화 파라미터): <%= this.getInitParameter("ORACLE_DRIVER") %></li>
			<li>서블릿 초기화 파라미터(this): <%= this.getInitParameter("SERVLET_INIT") %></li>
			<li>서블릿 초기화 파라미터(config): <%= config.getInitParameter("SERVLET_INIT") %></li>
			
		</ul>
		<h2>Context초기화 파라미터 목록</h2>
		<ul style="list-style:upper-roman;">
			<%
				Enumeration<String> names = application.getInitParameterNames();
				while(names.hasMoreElements()){
					//콘테스트 초기화 파라미터 명 얻기
					String paramName = names.nextElement();
					//콘테스트 초기화 파라미터 값 얻기
					String paramValue = application.getInitParameter(paramName);
			%>
				<li><%= paramName %> : <%= paramValue %></li>
			<%
				}//while
			%>
		</ul>
		
		<h2>서버의 물리적 경로 얻기</h2>
		<!--
		ServletContext의 메소드인
		getRealPath(/로 시작하는 웹상의 경로)로 얻는다.  
		 웹상의 경로는  Context 루트를 제외한 /로 시작
		-->		
		<ul style="list-style: upper-roman;">
			<li>application 내장객체: <%= application.getRealPath("/Style") %></li>
			<li>request 내장객체(Servlet에서 주로 사용): 
			<%= request.getServletContext().getRealPath("/Style") %></li>
			<li>session내장객체: <%= session.getServletContext().getRealPath("/Style") %></li>
			<li>this 키워드(선언부에서 사용): <%= this.getServletContext().getRealPath("/Style") %></li>
		</ul>
		
		<h2>선언부에서 물리적 경로 얻기</h2>
		<ul style="list-style: upper-roman ;">
			<li>this 키워드 사용: <%= getRealPath() %></li>
			<li>매개변수로 전달: <%= getRealPath(application) %></li>
			<% this.application = application; %>
			<li>맴버변수사용: <%= getRealPath2() %></li>
		
		</ul>
	</fieldset>
</body>
</html>