<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Application_2.jsp</title>
</head>
<body>
	<fieldset>
		<legend>application객체의 getResourceAsStream()</legend>
		<hr style="background-color: red; height: 2px"/>
		<h2>자바 IO를 사용해서 파일 내용을 웹브라우저로 출력</h2>
		<hr style="background-color: red; height: 2px"/>
		<%
		/*
		data source: file- 노드스트림: FileWriter
					            브릿지 스트림: InputStreamReader
		data 목적지: web브라우저-out내장 객체
		*/
		//1) 물리적 경로 얻기
		String path = application.getRealPath("/InnerObject03/Out.jsp");
		//2) 입력 스트림 미 생성-서버의 파일에 빨대 꽂기
		BufferedReader br = new BufferedReader(new FileReader(path));
		//3) br로 일고 out내장객체로 출력
		String data;
		while((data = br.readLine())!=null){
			out.println(data+"<br/>");
		}
		//스트림 닫기
		br.close();
		%>

		<hr style="background-color: red; height: 2px"/>
		<h2>getResourceAsStream()을 사용해서 파일 내용을 브라우저에 출력</h2>
		<hr style="background-color: red; height: 2px"/>
		<%
		//getResourceAsStream() method   InputStream 반환
		// 물리적 경로가 필요 없이 웹 상 경로만 있으면 된다.
		InputStream is= application.getResourceAsStream("/InnerObject03/Out.jsp");
		br = new BufferedReader(new InputStreamReader(is));
		while((data = br.readLine())!=null){
			out.println(data+"<br/>");
		}
		br.close();
		%>
		
		
		%>


	
	</fieldset>
</body>
</html>