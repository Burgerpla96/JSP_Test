<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Vector"%>
<%@page import="java.util.List"%>
<%@page import="model.MemberDTO"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SetTagIndex.jsp</title>
</head>
<body>
	<fieldset>
		<legend>set태그</legend>
		<h2>set태그로 EL에서 사용할 변수 설정</h2>
		<ul style="list-style: decimal-leading-zero;">
			<li>value속성에 직접 값 설정:<c:set var="directvar" value="100"/></li>
			<!-- 위 JSTL코드는 아래의 자바코드와 동일 -->
			<%-- pageContext.setAttribute("directvar", "100"); --%>
			<li>value속성에 EL로 값 설정:<c:set var="elvar" value="${directvar}"/> </li>
			<li>value속성에 표현식으로 값 설정:<c:set var="expvar" value="<%=new Date(new java.util.Date().getTime() ) %>"/> </li>
			<li>시작태그와 종료태그 사이에 값 설정: <c:set var="betweenvar"><h3>시작태그와 종료태그</h3>사이에 값 설정</c:set> </li>
		</ul>
	</fieldset>
	
	<fieldset>
		<legend>set태그로 설정한 값 출력하기</legend>
		<h2>스크립팅 요소(자바코드)로 출력</h2>
		<ul style="list-style: decimal-leading-zero;">
			<li>directvar:<%=pageContext.getAttribute("directvar") %></li>
			<li>elvar:<%=pageContext.getAttribute("elvar")%></li>
			<li>expvar:<%=pageContext.getAttribute("expvar")%></li>
			<li>betweenvar:<%=pageContext.getAttribute("betweenvar")%></li>
		</ul>
		<h2>EL로 출력</h2>
		<ul style="list-style: decimal-leading-zero;">
			<li>directvar:${pageScope.directvar }</li>
			<li>elvar:${elvar }</li>
			<li>expvar:${expvar }</li>
			<li>betweenvar:${betweenvar }</li>
		</ul>
	</fieldset>
	
	<fieldset>
		<legend>set태그로 각 영역에 객체 저장</legend>
		<c:set var="pagevar" value="페이지 영역"/>
		<c:set var="requestvar" value="리퀘스트 영역" scope="request"/>
		<c:set var="sessionvar" value="세션 영역" scope = "session"/>
		<c:set var="applicatevar" value="어플리케이션 영역" scope="application"/>
		<h2>스크립팅 요소(자바코드)로 출력</h2>
		<ul style="list-style: decimal-leading-zero;">
			<li>pagevar:<%=pageContext.getAttribute("pagevar") %></li>
			<li>requestvar:<%=request.getAttribute("requestvar")%></li>
			<li>sessionvar:<%=session.getAttribute("sessionvar")%></li>
			<li>applicatevar:<%=application.getAttribute("applicatevar")%></li>
		</ul>
		<h2>EL로 출력</h2>
		<ul style="list-style: decimal-leading-zero;">
			<li>pagevar:${pagevar }</li>
			<li>requestvar:${requestvar }</li>
			<li>sessionvar:${sessionvar}</li>
			<li>applicatevar:${applicatevar }</li>
		</ul>
	</fieldset>
	<fieldset>
		<legend>set태그로 자바빈 객체 설정</legend>
		<h2>기본 생성자로 생성</h2>
		<c:set scope="request" var="defaultmember" value="<%=new MemberDTO() %>"/>
		<h2>스크립팅 요소(자바코드)로 출력</h2>
		<ul style="list-style: decimal-leading-zero;">
			<li>아이디:<%=((MemberDTO)request.getAttribute("defaultmember")).getId() %></li>
			<li>비번:<%=((MemberDTO)request.getAttribute("defaultmember")).getPwd()%></li>
			<li>이름:<%=((MemberDTO)request.getAttribute("defaultmember")).getName()%></li>
		</ul>
		<h2>EL로 출력</h2>
		<ul style="list-style: decimal-leading-zero;">
			<li>아이디:${defaultmember.id }</li>
			<li>비번:${defaultmember.pwd }</li>
			<li>이름:${defaultmember.name }</li>
		</ul>
		<h2>인자 생성자로 생성</h2>
		<c:set scope="request" var="argsmember" value='<%=new MemberDTO("KIM","1234","김길동",null,null) %>'/>
		<ul style="list-style: decimal-leading-zero;">
			<li>아이디:<%=((MemberDTO)request.getAttribute("argsmember")).getId() %></li>
			<li>비번:<%=((MemberDTO)request.getAttribute("argsmember")).getPwd()%></li>
			<li>이름:<%=((MemberDTO)request.getAttribute("argsmember")).getName()%></li>
		</ul>
		<h2>EL로 출력</h2>
		<ul style="list-style: decimal-leading-zero;">
			<li>아이디:${argsmember.id }</li>
			<li>비번:${argsmember.pwd }</li>
			<li>이름:${argsmember.name }</li>
		</ul>
		<!--  -->
		<c:set target="${defaultmember }" property="id" value="PARK"/>
		<c:set target="${defaultmember }" property="pwd" value="1234"/>
		<c:set target="${defaultmember }" property="name" value="박길동"/>
		<h4>target속성과 property속성으로 값 설정후 EL로 출력</h4>
		<ul style="list-style: decimal-leading-zero;">
			<li>아이디:${defaultmember.id }</li>
			<li>비번:${defaultmember.pwd }</li>
			<li>이름:${defaultmember.name }</li>
		</ul>
		<%
			//리스트 계열 컬렉션
			List list = new Vector();
			list.add(request.getAttribute("defaultmember"));
			list.add(request.getAttribute("argsmember"));
		%>
		<h2>set태그로 리스트 계열 컬렉션 저장</h2>
		<c:set var="list" value="<%=list %>" scope="request"/>
		<h4>속성 값 변경 전 출력</h4>
		<ul style="list-style: decimal-leading-zero;">
			<li>아이디:${list[0].id }</li>
			<li>비번:${list[0].pwd  }</li>
			<li>이름:${list[0].name  }</li>
		</ul>
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		<h4>list-target 및 property 속성으로 값 변경</h4>
		<c:set target="${list[0] }" property="id" value="KOSMO"/>
		<c:set target="${list[0] }" property="pwd" value="1234"/>
		<c:set target="${list[0] }" property="name" value="한소인"/>
		<ul style="list-style: decimal-leading-zero;">
			<li>아이디:${list[0].id }</li>
			<li>비번:${list[0].pwd  }</li>
			<li>이름:${list[0].name  }</li>
		</ul>
		<%
		//map 계열 컬렉션
		Map map = new HashMap();
		map.put("default", request.getAttribute("defaultmember"));
		map.put("args", request.getAttribute("argsmember"));
		%>
		<c:set scope="request" var="map" value="<%=map %>"/>
		<h4>map-속성 값 변경 전 출력</h4>
		<ul style="list-style: decimal-leading-zero;">
			<li>아이디:${requestScope.map["default"].id }</li>
			<li>비번:${map["default"].pwd  }</li>
			<li>이름:${map["default"]["name"]  }</li>
			<!-- default는 EL의 예약어라서 대괄호로 감싸서 써야한다. -->
		</ul>
		
		<!-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!다시 -->
		<h4>map-target속성과 property속성으로 값 변경</h4>
		<ul style="list-style: decimal-leading-zero;">
			<c:set target="${map['default'] }" property="id" value="KOSMO2"/>
			<c:set target="${map['default'] }" property="pwd" value="0000"/>
			<c:set target="${map['default'] }" property="name" value="한소인2"/>
		</ul>
		<ul style="list-style: decimal-leading-zero;">
			<li>아이디:${requestScope.map["default"].id }</li>
			<li>비번:${map["default"].pwd  }</li>
			<li>이름:${map["default"]["name"]  }</li>
			<!-- default는 EL의 예약어라서 대괄호로 감싸서 써야한다. -->
		</ul>
	</fieldset>
	
	<%-- 
	<jsp:forward page="SetTagResult.jsp">
		<jsp:param value="android" name="subject"/>
	</jsp:forward>
	--%>
	
</body>
</html>