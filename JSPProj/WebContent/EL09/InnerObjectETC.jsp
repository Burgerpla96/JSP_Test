<%@page import="java.util.Set"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Vector"%>
<%@page import="java.util.List"%>
<%@page import="model.MemberDTO"%>
<%@page import="sun.security.krb5.internal.crypto.dk.DkCrypto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>InnerObjectETC.jsp</title>
</head>
<body>
	<fieldset>
		<legend>EL의 기타 내장 객체들</legend>
		<h2>1. EL의 pageContext</h2>
		<!-- 
		JSP의 pageContext내장객체와 같다. 
		단, 자바빈 규칙으로 접근 가능한 메소드(getter)만 제공한다.
		 -->
		<h4>자바코드로 컨텍스트 루트(/JSPProj) 얻기</h4>
		<ul>
			<li>방법1: request 내장객체 - <%=request.getContextPath() %></li>
			<%
			ServletRequest req = pageContext.getRequest();			
			String context = ((HttpServletRequest)req).getContextPath();
			%>
			<li>방법2: pageContext내장객체- <%=context %></li>
		</ul>
		
		<h4>EL로 컨텍스트 루트(/JSPProj) 얻기</h4>
		<!-- 자바빈 규칙으로 접근 -->
		\${pageContext.request.contextPath } : ${pageContext.request.contextPath }
		
		<h4>자바코드로 URL 얻기</h4>
		<%= request.getRequestURL() %>
		
		<h4>EL로 URL 얻기</h4>
		\${pageContext.request.requestURL } : ${pageContext.request.requestURL }
		
		<h4>자바코드로 세션의 유효시간 얻기</h4>
		<%= session.getMaxInactiveInterval() %>초<br/>
		<%= request.getSession().getMaxInactiveInterval() %>초<br/>
		<%= pageContext.getSession().getMaxInactiveInterval() %>초<br/>
		<%= ((HttpServletRequest)pageContext.getRequest()).getSession().getMaxInactiveInterval() %>초<br/>
		
		<h4>EL로 세션의 유효시간 얻기</h4>
		\${pageContext.session.maxInactiveInterval } : ${pageContext.session.maxInactiveInterval }초<br/>
		\${pageContext.request.session.maxInactiveInterval } : ${pageContext.request.session.maxInactiveInterval }초<br/>
		
		
		
		
		<h4>2. EL의 header내장 객체 </h4>
		<!-- 
		JSP 로 요청 헤더 정보를 얻어 오려면 request.getHeader("user-agent")식으로 얻는다.
			키값에 특수문자가 들어 가는 건 []로 얻기!!!!!!!!중요
		 -->
		<h4>자바코드로 요청 헤더값 얻기</h4>
		<%= request.getHeader("user-agent") %>
		<h4>EL로 요청 헤더값 얻기</h4>
		\${header.user-agent } : ${header.user-agent } <br/>
		\${header["user-agent"] } : ${header["user-agent"] } <br/>
		
		
		
		
		<h4>3. EL의 cookie내장 객체 </h4>
		<!-- EL로는 설정이 불가 출력만 가능하다.-> 자바코드로 쿠키설정 -->
		<%
			//쿠키설정
			Cookie cookie = new Cookie("KOSMO","한소인");
			cookie.setPath(request.getContextPath());
			response.addCookie(cookie);
		%>
		<h4>자바코드로 쿠키값 읽기</h4>
		<%
			Cookie[] cookies = request.getCookies();
			if(cookies!=null){
				for(Cookie cook: cookies){
					//쿠키명 얻기
					String name = cook.getName();
					//쿠키값 얻기
					String value = cook.getValue();
					out.println(name+" : "+value+"<br/>");
				}
			}
		%>		
		<h4>EL로 쿠키값 읽기</h4>
		<!-- 
		cookie.쿠키명.value로 쿠키명에 해당하는 쿠키값을 얻을 수 있다.
		-->
		\${cookie.KOSMO.value } : ${cookie.KOSMO.value }<br/>
		\${pageContext.request.cookies } : ${pageContext.request.cookies }
		<h5>JSTL을 이용해서 쿠키배열 출력</h5>
		<c:forEach var="cook" items="${pageContext.request.cookies }">
			${cook.name } : ${cook.value }<br/>
		</c:forEach>
		
		
		
		<h4>4. EL의 initParam내장 객체 </h4>
		<!--
		 [컨텍스트 초기화 파라미터를 얻어 올 수 있다.]
		 
		 context 초기화 파라미터
		 	application.getInitParameter("파라미터명")으로 얻는다.
		 Servlet 초기화 파라미터
		 -->
		<h4>자바코드로 컨텍스트 초기화 파라미터 얻기</h4>
		<ul>
			<li>ORACLE_URL: <%=application.getInitParameter("ORACLE_URL") %></li>
			<li>ORACLE_DRIVER: <%=application.getInitParameter("ORACLE_DRIVER") %></li>
			<li>PAGE_SIZE: <%=application.getInitParameter("PAGE_SIZE") %></li>
			<li>BLOCK_PAGE: <%=application.getInitParameter("BLOCK_PAGE") %></li>
		</ul>
		<h4>EL로 컨텍스트 초기화 파라미터 얻기</h4>
		<ul>
			<li>ORACLE_URL: ${initParam.ORACLE_URL } </li>
			<li>ORACLE_DRIVER: ${initParam.ORACLE_DRIVER }</li>
			<li>PAGE_SIZE: ${initParam["PAGE_SIZE"] }</li>
			<li>BLOCK_PAGE: ${initParam['BLOCK_PAGE'] }</li>
		</ul>
		
		<h2>Collection에 저장된 객체를 EL로 출력</h2>
		<%
			//data 준비
			MemberDTO first = new MemberDTO("KIM","1234","김길동",null,null);
			MemberDTO second = new MemberDTO("PARK","5678","박길동",null,null);
			//List계열에 저장
			List<MemberDTO> list = new Vector<MemberDTO>();
			list.add(first);
			list.add(second);
			
			//Map계열에 저장
			Map<String,MemberDTO> map = new HashMap<String, MemberDTO>();
			map.put("first",first);
			map.put("second",second);
		%>
		<h2>자바코드로 출력</h2>
		<h4>List계열 Collection</h4>		
		<h6>일반 for문</h6>
		<ul>
			<%for(int i=0;i<list.size() ; i++){  %>
				<li><%=list.get(i) %></li>
			<%} %>
		</ul>
		<h6>확장 for문</h6>
		<ul>
			<%for(MemberDTO member : list){  %>
				<li><%=member %></li>
			<%} %>
		</ul>
		
		
		<h4>Map계열 Collection</h4>		
		<ul>
			<%
				Set<String> keys = map.keySet();
				for(String key : keys){
					MemberDTO member = map.get(key);
			%>
				<li> <%=key %> : <%=member %></li>					
			<%	}
			%>
		</ul>
		
		<h2>EL로 출력</h2>
		<!-- EL에서 변수 쓸 수 있도록 JSTL로 선언해주기 -->
		<c:set var="elList" value="<%=list %>"/>
		<c:set var="elMap" value="<%=map %>"/>
		<h4>List계열 Collection</h4>
		<!-- 
		List계열 : el변수[index] 단, el변수.index사용불가
		Map계열: el변수.키값     혹은    el변수["키값"]
		 -->
		<h6>JSTL 미사용</h6>
		\${elList[0] } : ${elList[0] } 
		<ul>
			<li>이름 : ${elList[0].name }, 아이디 : ${elList[0].id }, 비밀번호 : ${elList[0].pwd }</li>
			<li>이름 : ${elList[1].name }, 아이디 : ${elList[1].id }, 비밀번호 : ${elList[1].pwd }</li>
		</ul>
		<h6>JSTL 사용</h6>
		<ul>
			<c:forEach var="item" items="${elList }">
				<li>이름 : ${item.name }, 아이디 : ${item.id }, 비밀번호 : ${item.pwd }</li> 	
			</c:forEach>		
		</ul>
		 
		<h4>Map계열 Collection</h4>		
		<h6>JSTL 미사용</h6>
		<!-- 앞에 pageScope가 변수 앞에 있는것! pageScope.elMap -->
		\${elMap.first } : ${elMap.first }
		<ul>
			<li>이름 : ${elMap.first.name }, 아이디 : ${elMap.first.id }, 비밀번호 : ${elMap.first.pwd }</li>
			<li>이름 : ${elMap.second.name }, 아이디 : ${elMap.second.id }, 비밀번호 : ${elMap['second']["pwd"] }</li>
		</ul>
		<h6>JSTL 사용</h6>
		<ul>
		<!-- 
		JSTL의 forEach 사용시
		var에 지정한 변수명.value는 벨류값
				   변수명.key는 키값
		 -->
			<c:forEach var="item" items="${elMap }">
				<li>${item.key } : 이름-${item.value.name }, 아이디-${item.value.id }, 비번-${item.value.pwd }</li> 			
			</c:forEach>
		</ul>
		
		<h5>Collection에 저장된 객체 수: el변수.size()</h5>
		<!-- 지금까지와 다르게 size()로 소괄호를 하였다!! -->
		<ul>
			<li>\${elList.size() } : ${elList.size() }</li>
			<li>\${elMap.size() } : ${elMap.size() }</li>
		</ul>
		
		
	</fieldset>
</body>
</html>