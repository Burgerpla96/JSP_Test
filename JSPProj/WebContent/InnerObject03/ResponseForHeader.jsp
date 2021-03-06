<%@page import="java.util.Collection"%>
<%@page import="java.util.Collections"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/*
	페이지 갱신이 자주 될때 사용..
	웹 브라우저의 캐쉬를 이용하지 않음
	즉, 현재 페이지를 매번 서버에 요청하게 만드는 것
	*/
	//HTTP/1.0에 적용시킬때  --header명은 꼭 pragma으로 해야한다. 
	response.setHeader("pragma", "no-cache");
	//HTTP/1.1에 적용시킬때
	response.setHeader("cache-control", "no-cache");
	
	
	
	//response.setContentType("text/plain; charset=UTF-8");
	/*
	웹 브라우저가 인식하지 못 하는 
	Content-Type(MIME타입)인 경우,
	웹 브라우저는 파일 다운로드 창을 보여준다.
	다운도르 구현시 적용
	
	IE에서는 아무값이나 FX에서는 
	application/unknown이나
	binary/octect-stream등
	*/
	//response.setContentType("binary/octect-stream");
	/*
		add계열: 기존 헤더명이 존재시 계속 추가, 없을시 생성
		set계열: 기존 헤더명이 존재시  덮어쓰기, 없을시 생성
	*/
	
	//오늘 날짜를 SET계열로 currentDate 란 응답헤더명으로 생성
	Date date = new Date();
	long currentTime = date.getTime();
	response.setDateHeader("currentDate", currentTime);
	//특정 날짜를 ADD계열로 currentDate 란 응답헤더명으로 생성
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	long startTime = sdf.parse("2020-8-10").getTime();
	response.addDateHeader("currentDate", startTime);//set이면 덮어쓴다.
	//ADD계열로 NumberOfStudent라는 헤더명 생성
	response.addIntHeader("NumberOfStudents", 32);
	//SET계열로 NumberOfStudent라는 헤더명 변경
	response.setIntHeader("NumberOfStudents", -1);
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ResponseForHeader.jsp</title>
</head>
<body>
	<fieldset>
		<legend>응답 헤더</legend>
		<ul style="list-style:upper-roman;">
			<%
				//1) 응답 헤더명 얻기 : getHeaderNames()
				Collection<String> names = response.getHeaderNames();
				// 꺼내서 출력
				for(String name : names){
					//2) 응답 헤더값 얻기 : Strign getHeader("헤더명")
					String headerValue = response.getHeader(name);
					out.println(String.format("<li>%s : %s</li>", name,headerValue));
				}
			%>
			<h2>응답헤더명 존재 여부 판단: boolean containsHeader("헤더명")</h2>
			<h4>Content-Type 존재 여부 판단 </h4>
			<%= response.containsHeader("content-type")
				?"Content-Type 존재":"Content-Type 미존재"
			%>
			<h4>currentDate 존재 여부 판단 </h4>
			<%= response.containsHeader("currentDate")
				?"currentDate 존재":"currentDate 미존재"
			%>
			
		</ul>
	
	</fieldset>
</body>
</html>