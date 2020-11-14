<%@page import="model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 
	//자바 코드로 받기
	// 1)Post방식의 한글처리
	request.setCharacterEncoding("UTF-8");
	//2) 폼의 하위 요소값 받기
	String id = request.getParameter("id") == null?request.getParameter("user"):request.getParameter("id");
	String pwd = request.getParameter("pwd") == null?request.getParameter("pass"):request.getParameter("pwd");
	String name = request.getParameter("name");
	//3) 받은 걸 MemberDTO에 세팅
	MemberDTO member = new MemberDTO();
	member.setId(id);
	member.setPwd(pwd);
	member.setName(name);
	



%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UseBeanFormResult.jsp</title>
</head>
<body>
	<fieldset>
		<legend>useBean Action tag로 폼의 하위요소값 받기</legend>
		<h2>스트립팅 요소 즉 자바코드로 받기</h2>
		<%= member %>
		<h2>Action tag로 받기</h2>
		
		<!-- 1) 액션태그로 자바빈 객체 생성 -->
		<jsp:useBean id="action" class="model.MemberDTO"/>
		<h3>파라미터 명과 자바빈의 속성명(맴버변수) 일치시</h3>
		<!--  2) setProperty액션 태그로 폼요소값 설정  value속성 미 지정-->
		<jsp:setProperty property="*" name="action"/>
		<!-- 벨류는 사용자값으로 정해진다. -->
		
		<h3>파라미터 명과 자바빈의 속성명(맴버변수) 불일치시</h3>
		<!-- 
			property 에는 자바빈의 속성명(맴버변수명)
			param 속성에는 form의 하위요소명(name속성에 지정한 값)
		 -->
		<jsp:setProperty property="id" name="action" param="user"/>
		<jsp:setProperty property="pwd" name="action" param="pass"/>
		
		
		<%= action %>
	</fieldset>
</body>
</html>