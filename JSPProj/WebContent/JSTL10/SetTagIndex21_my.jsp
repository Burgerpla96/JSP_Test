<%@page import="java.util.Vector"%>
<%@page import="java.util.List"%>
<%@page import="model.MemberDTO"%>
<%@ page import="java.util.Date"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 
JSTL 사용)
1) WEB-INF/lib 폴더에 필요한 jar파일 추가
2) taglib지시어를 JSP에 추가
 -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SetTagIndex.jsp</title>
</head>
<body>
	<fieldset>
		<legend>set태그</legend>
		<!-- 
		var="값을 지정할 EL 변수명"  문자열만 가능!중요!
		value="지정한 변수의 값"	,값,표현식,EL식 모두 가능
		[scope = "변수를 저장할 영역"] jsp네가지 영역, page가 기본값
		 -->		
		<h2>set tag로 EL에서 사용할 변수 설정</h2>
		<ul style="list-style: upper-roman;">
			<li>value속성에 직접 값 설정: <c:set var="directvar" value="100"/> </li>
			<!-- 위 JSTL코드는 아래의 자바코드와 같다. -->
			<% pageContext.setAttribute("directvar", "100"); %>
			
			<li>value속성에 EL로 값 설정: <c:set var="elvar" value="${directvar }"/></li>
			<li>value속성에 표현식으로 값 설정: <c:set var="expvar" value="<%=new java.sql.Date(new Date().getTime()) %>"/></li>
			<li>시작 테그와 종료 테그 사이에 값 설정:<c:set var="betweenvar"><h3>시작태그와 종료태그</h3>사이에 값 설정</c:set></li>
			<!-- <c:set>사이의 내용이 사라져 <h3>태그의 내용이 보이지 않게 된다. -->
			
		</ul>
		
	</fieldset>
	
	<fieldset>
		<legend>set 태그로 설정한 값 출력하기</legend>
		<h2>스크립팅 요소(자바코드)로 출력</h2>
		<ul style="list-style: upper-roman;">
			<li>directvar: <%=pageContext.getAttribute("directvar") %></li>
			<li>elvar: <%=pageContext.getAttribute("elvar") %></li>
			<li>expvar: <%=pageContext.getAttribute("expvar") %></li>
			<li>betweenvar: <%=pageContext.getAttribute("betweenvar") %></li>
		</ul>
		
		<h2>EL로 출력</h2>
		<ul style="list-style: upper-roman;">
			<li>directvar: ${pageScope.directvar }</li>
			<li>elvar: ${pageScope.elvar }</li>
			<li>expvar: ${expvar }</li>
			<li>betweenvar: ${betweenvar }</li>
		</ul>
	
	</fieldset>
	
	<fieldset>
		<legend>set태그로 각 영역에 객체 저장</legend>
		<c:set var="pagevar" value="페이지 영역"/>
		<c:set var="requestvar" value="request 영역" scope="request"/>
		<c:set var="sessionvar" value="session 영역" scope="session"/>
		<c:set var="applicationvar" value="application 영역" scope="application"/>
		
		<h2>스크립팅 요소(자바코드)로 출력</h2>
		<ul style="list-style: upper-roman;">
			<li>pagevar: <%=pageContext.getAttribute("pagevar") %></li>
			<li>requestvar: <%=request.getAttribute("requestvar") %></li>
			<li>sessionvar: <%=session.getAttribute("sessionvar") %></li>
			<li>applicationvar: <%=application.getAttribute("applicationvar") %></li>
		</ul>
	
		<h2>EL로 출력</h2>
		<ul style="list-style: upper-roman;">
			<li>pagevar: ${pagevar }</li>
			<li>requestvar: ${requestvar }</li>
			<li>sessionvar: ${sessionvar }</li>
			<li>applicationvar: ${applicationvar }</li>
		</ul>
	
	</fieldset>
	
	<fieldset>
		<legend>set 태그로 자바빈 객체 설정</legend>
		<h2>기본 생성자로 생성</h2>
		<c:set scope="request" var="defaultmember" value="<%=new MemberDTO() %>"/>
		
		<h2>스크립팅 요소(자바코드)로 출력</h2>
		<ul style="list-style: upper-roman;">
			<li>아이디: <%=((MemberDTO)request.getAttribute("defaultmember")).getId() %></li>
			<li>비밀번호: <%=((MemberDTO)request.getAttribute("defaultmember")).getPwd() %></li>
			<li>이름: <%=((MemberDTO)request.getAttribute("defaultmember")).getName() %></li>
		</ul>
		
		<h2>EL로 출력</h2>
		<ul style="list-style: upper-roman;">
			<li>아이디: ${defaultmember.id }</li>
			<li>비밀번호: ${defaultmember.pwd }</li>
			<li>이름: ${defaultmember.name }</li>
		</ul>
		
		<h2>인자 생성자로 생성</h2>
		<c:set scope="request" var="argsmember" value='<%=new MemberDTO("KIM","1234","김길동",null,null) %>'/>
			
		<h2>스크립팅 요소(자바코드)로 출력</h2>
		<ul style="list-style: upper-roman;">
			<li>아이디: <%=((MemberDTO)request.getAttribute("argsmember")).getId() %></li>
			<li>비밀번호: <%=((MemberDTO)request.getAttribute("argsmember")).getPwd() %></li>
			<li>이름: <%=((MemberDTO)request.getAttribute("argsmember")).getName() %></li>
		</ul>
		
		<h2>EL로 출력</h2>
		<ul style="list-style: upper-roman;">
			<li>아이디: ${argsmember.id }</li>
			<li>비밀번호: ${argsmember.pwd }</li>
			<li>이름: ${argsmember.name }</li>
		</ul>
		
		<!-- 
		*target에는 표현식과 EL만으로 개체를 지정 한다.
		*target에 표현식을 사용하는 경우는 개체가 자바코드로 생성 된 경우에만
		
		-scope속성은 var속성을 지정한 객체에서만 사용가능 기억!
		-target과 property를 사용해서 자바빈이나 컬렉션에 값을 설정할때
			var속성을 지정하면 안된다.
		
		
		 -->
		<!-- -target과 property를 사용해 자바빈 객체의 속성값 설정 -->
		<c:set target="${defaultmember }" property="id" value="PARK"/>
		<c:set target="${defaultmember }" property="pwd" value="1234"/>
		<c:set target="${defaultmember }" property="name" value="박길동"/>
		<h4>target속성과 property속성으로 값 설정후 EL로 출력</h4>
		<ul style="list-style: upper-roman;">
			<li>아이디: ${defaultmember.id }</li>
			<li>비밀번호: ${defaultmember.pwd }</li>
			<li>이름: ${defaultmember.name }</li>
		</ul>
		
		<%
		//List계열 Collection
		List list = new Vector();
		list.add(request.getAttribute("defaultmember"));
		list.add(request.getAttribute("argsmember"));
		%>
		<h2>set 태그로 리스트 계열 컬렉션 저장</h2>
		<c:set var="list" value="<%= list %>" scope="request"/>
		<h4>속성 값 변경 전 출력</h4>
		<ul style="list-style: upper-roman;">
			<li>아이디: ${requestScope.list[0].id }</li>
			<li>비밀번호: ${lsit[0].pwd }</li>
			<li>이름: ${list[0].name }</li>
		</ul>
		 
		<h4>target 및 property 속성으로 값 변경</h4>
		<c:set />
		
	</fieldset>
	
	
	
</body>
</html>