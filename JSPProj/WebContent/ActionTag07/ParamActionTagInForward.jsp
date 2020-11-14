<%@page import="model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--  ParamActionTagInForward.jsp -->


<!--  
파라미터 전달시 파라미터의 값을 표현식으로 처리하고자 할때는 
param액션 태그를 이용한다.


액션태그중 
include에선 쿼리스트링 붙이기 가 안되지만

-->
<%
	//한글처리 forward하는 페이지 혹은 include하는  쪽에서 해준다.!!!!!!
	request.setCharacterEncoding("UTF-8");

	String pageUrl = "ForwardedPage.jsp?query=쿼리스트링";
	String paramValue = "KOSMO";

	//리퀘스트영역에 객체 저장
	request.setAttribute("member", new MemberDTO("KIM","1234","김길동",null,"20"));

%>
<!--  page에 순수표현식만 넣어야 한다. -->
<!-- name은 변수 처리가 안된다. value는 가능-->
<jsp:forward page="<%= pageUrl %>" >
	<jsp:param value="코스모" name="name"/>
	<jsp:param value="<%= paramValue %>" name="id"/>
</jsp:forward>

