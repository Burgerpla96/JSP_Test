<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    

<!--  여러 JSP에서 공통으로 사용할 변수나 상수, 메서드 정의 -->

<%! 
	//declaration
	SimpleDateFormat dateFormat = new SimpleDateFormat();
	//공통메서드 정의
	String getDate(String pattern){
		dateFormat.applyPattern(pattern);
		return dateFormat.format(new Date());
	}///////
	
%> 

<% 
	//공통 변수
	String tempPage = request.getRequestURL().toString();
	int beginIndex = tempPage.lastIndexOf("/")+1;
	String currentPage = tempPage.substring(beginIndex);

%>