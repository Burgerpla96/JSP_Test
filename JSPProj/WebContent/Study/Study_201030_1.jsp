<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Study_201030_1.jsp</title>
</head>
<body>
	<%@page import="java.util.ArrayList"%>
	<%@page import="java.util.Arrays"%>
	<%@page import="java.util.List"%>
	<fieldset>
		<legend style="font-size: 1.5em;">어떤 출력이 나올까요?</legend>
		<%
		String url = "https://blog.naver.com/dongq2ben"; 
		request.setAttribute("url", url);
		List<String> halloween = 
				new ArrayList<String>(Arrays.asList("Jack-O'-Lantern","Candy","Pumpkin"));
		/* Arrays.asList()를 사용하면 원본 배열을 수정할 수 없으나, 위와 같이
		List 계열에 바로 담아주면 변경이 가능하다.(add를 쓰지 않고 간편히 ArrayList 만들기!) */
		pageContext.setAttribute("halloween", halloween);
		%>
		<p>
			1번<br/>
			\${"Null" + ' 좋아해~' } => \${"Null" + ' 좋아해~' }<br/>
			2번<br/>
			url에서 추출한 누군가의 아이디 => <%=url.substring(url.lastIndexOf("/")+1) %><br/>
			3번<br/>
			\${halloween.0 } => \${halloween.0 }<br/>
			4번<br/>
			\${halloween[1] } => ${halloween[1] }<br/>
			5번<br/>
			\${halloween[2] += halloween[1]} => ${halloween[2] += halloween[1] }
		</p>
	</fieldset>
</body>
</html>