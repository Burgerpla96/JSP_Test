<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Vector"%>
<%@page import="java.util.List"%>
<%@page import="model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//application영역은 어떤 페이지로 이동하든 공유한다.
	//저장할 객체 생성
	MemberDTO first = new MemberDTO("GA","1234","가길동",null,"20");
	MemberDTO second = new MemberDTO("NA","5678","나길동",null,"30");
	MemberDTO third = new MemberDTO("DA","9999","다길동",null,"40");
	//list Collection에 담기
	List<MemberDTO> list = new Vector<MemberDTO>();
	list.add(first);
	list.add(second);
	list.add(third);
	//map Collection에 담기
	Map<String, MemberDTO> map = new HashMap<String, MemberDTO>();
	map.put("first",first);
	map.put("second",second);
	map.put("third",third);
	//application영역에 컬렉션들 저장
	application.setAttribute("list", list);
	application.setAttribute("map", map);
	
%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ApplicationScopeIndex.jsp</title>
</head>
<body>
	<fieldset>
		<legend>application 영역</legend>
		<h2>사용자 클릭으로 페이지 이동</h2>
		<a href="ApplicationScopeResult.jsp">클릭하세요.</a>
		<h2>forward로 페이지 이동</h2>
		<%
		///JSPProj/WebContent/InnerObjectScope04/ApplicationScopeResult.jsp
		//request.getRequestDispatcher("/InnerObjectScope04/ApplicationScopeResult.jsp").forward(request, response);
		%>
		
		<h2>redirect로 페이지 이동</h2>
		<%
		//redirect방식은 contextpath가 붙어야 한다.
		response.sendRedirect(request.getContextPath()+"/InnerObjectScope04/ApplicationScopeResult.jsp");
		%>		
		
	</fieldset>
</body>
</html>