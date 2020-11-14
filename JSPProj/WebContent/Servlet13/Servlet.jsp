<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	//response.setCharacterEncoding("UTF-8");
	//여기서가 아니라 서블릿 파일(.java)에서 한글로 인코딩 설정을 해야한다.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Servlet.jsp</title>
</head>
<body>
	<fieldset>
		<legend>서블릿 사용하기</legend>
		<h2>servlet으로 요청 보내기</h2>
		<ul>
			
			<!-- 1) URL pattern 작성 (web.xml에 url-pattern으로 줄 URL은 디렉토리 구조와 상관없다.) -->		
			<!-- 2) web.xml에 서블릿 등록 및 상기 URL패턴을 서블릿과 맵핑-->
			<!-- 3) HttpServlet 을 상속박은 클래스(서블릿) 작성  요청방식-->
			<!-- 4) servlet class에서 모델 호출후 결과값을 request 영역이나, session영역에 저장 -->
			<!-- 5) view 선택(.jsp 파일)후 forwarding -->
			<li><a href='<c:url value="/Basic/get.kosmo"/>'>get 방식</a></li>
			<!-- 링크는 get방식 -->
			<li>post 방식
				<form action="<c:url value="/Basic/post.kosmo"/>" method="post">
					ID: <input type="text" name="username"/>
					password: <input type="password" name="password"/>
					<input type="submit" value="로그인"/>
				</form>
			</li>
			
			<li>
				<h4>get/post에 상관없이 요청받기</h4>
				<a href='<c:url value="/Basic/both.kosmo"/>'>get으로 보내기</a>
				<form action="<c:url value="/Basic/both.kosmo"/>" method="post">
					<input type="submit" value="post로 보내기"/>
				</form>
			</li>
			
			<li>
				<h4>하나의 controller로(하나의 서블릿) 여러 요청 처리하기(파라미터로 구분)</h4>
				<a href='<c:url value="/Basic/multi.kosmo?crud=create"/>'>입력 요청</a>
				<a href='<c:url value="/Basic/multi.kosmo?crud=read"/>'>검색 요청</a>
				<a href='<c:url value="/Basic/multi.kosmo?crud=update"/>'>수정 요청</a>
				<a href='<c:url value="/Basic/multi.kosmo?crud=delete"/>'>삭제 요청</a>
				<!-- 쿼리스트링은 url 패턴이 아니다!!! -->
			</li>
			
			<li>
				<h4>
				링크 메뉴클릭 -> GET요청 -> FirstController(입력폼으로 포워드) ->
				입력폼(버튼클릭) -> POST요청 -> SecondController(A컨트롤러로 포워드) ->
				FirstController로 포워드(405 error)	
				</h4>
				<a href='<c:url value="/Basic/first.kosmo"/>'>Menu</a>
			
			</li>
			
		</ul>
	</fieldset>
	
	<fieldset>
		<legend>request영역에 저장된 데이터</legend>
		<ul>
			<li>get.kosmo요청시: ${method_get }</li>
			<li>post.kosmo요청시: ${method_post }</li>
			<li>both.kosmo요청시: ${method_both }</li>
			<li>multi.kosmo요청시: ${crudMessage }</li>
			
			<li>first.kosmo후 second.kosmo를 거쳐 돌아오기: ${test }</li>
			
		</ul>
		
	</fieldset>
	
	
	
</body>
</html>