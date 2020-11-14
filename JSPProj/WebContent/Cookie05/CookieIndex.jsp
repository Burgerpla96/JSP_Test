<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CookieIndex.jsp</title>
</head>
<body>
	<fieldset>
		<legend>Cookie</legend>
		<h2>쿠키 설정하기</h2>
		<%
		//1) 쿠키객체 생성 : new Cookie("쿠키명","쿠키값");
		//쿠키명을 설정하는 setName()이 없다. 반드시 생성자로 쿠키명 설정
		Cookie cookie = new Cookie("UserID","KOSMO");
		//2) 쿠키가 적용되는 PATH 설정 //ContextPath넣기
		/*
		setPath(String path):쿠키가 적용되는 경로지정
				 지정한 경로또는  하위 경로에만 대해서만 쿠키가 적용된다.
				예]
				setPath("/notice");notice디렉토리와 그 하위 
				             디렉토리에서만 쿠키를 사용할 수 있다
				setPath("/"):웹 어플리케이션 전체 경로에서 사용하고자 할때
		
		*/
		cookie.setPath(request.getContextPath());
		//3) 쿠키 유효기간 설정- 초 단위
		/*				
		setMaxAge(int exp):쿠키의 유효시간을 초 단위로 설정. 
		                  유효시간을 설정하지 않으면 쿠키정보는 
			   웹브라우저 메모리에 저장되고 
			   웹브라우저를 닫으면  자동으로 삭제된다.
			   유효시간을 설정하는 경우 쿠키정보는 사용자의 pc에 저장된다.
		*/
		cookie.setMaxAge(60);
		
		//4) 생성된 쿠키를 응답헤더에 설정: addCookie()
		response.addCookie(cookie);
		
		%>
		<h2>Cookie를 생성하는 현재 페이지에서 쿠키값 읽기</h2>
		<%
			Cookie[] cookies = request.getCookies();
			out.println("cookies: "+cookies);
			if(cookies != null){
				for(Cookie cook:cookies){
					//쿠키명 얻기
					String name = cook.getName();
					//쿠키값 얻기
					String value = cook.getValue();
					out.println(String.format("%s : %s", name, value));
					
				}
			}
		%>
		<h2>페이지 이동 후 쿠키값 확인</h2>	
		<a href="CookieResult.jsp">쿠키값 확인</a>
	</fieldset>
	
</body>
</html>