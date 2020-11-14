<%@page import="com.sun.corba.se.spi.orbutil.fsm.Action"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- ResponseForRedirectProcess.jsp -->
<%
	//Post방식으로 만 받기
	if(!"POST".equals(request.getMethod())){
		out.println("<script>");
		out.println("alert('잘못된 접근입니다.');");
		out.println("hisotry.back();");
		out.println("</script>");
		return;
	}///////////////////
	/*
	사용자가 입력한 아이디와 비번으로 회원판단 후
	마이 페이지 이동, 로그인 페이지 이동으로 설정
	-아이디 : KIM 비번 : 1234
	*/
	//1) 사용자 값 얻기
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	//2) 회원여부 판단(데이터 베이스의 테이블 조회)
	//3) 회원인 경우 로그인처리(session객체로 )후  마이페이지로 이동
	//회원이 아니면 다시 로그인 페이지로 이동
	if("KIM".equals(id) && "1234".equals(pwd)){//회원인 경우
		//방법1) sendRedirect("자동으로 이동항 페이지 주소")
		//response.sendRedirect(request.getContextPath()+"/InnerObject03/ResponseForMyPage.jsp?id="+id+"&pwd="+pwd);//안에 주소
		//방법2) 자스로 메세지 띄운 후 이동
		/*
		out.println("<script>");
		out.println("alert('"+ id +"님 반갑습니다.');");
		//상대 경로로 location.replace()
		out.println("location.replace('ResponseForMyPage.jsp?id="+ id +"&pwd="+ pwd +"')");
		out.println("</script>");
		*/
		
		//response.sendRedirect(request.getContextPath()+"/InnerObject03/ResponseForMyPage.jsp?id="+id+"&pwd="+pwd);//안에 주소
		//sendRedirect를 만나면 기존 버퍼 내용에 있던게 응답이 안된다. 
		//위에서는 out.println에 있는 것들이 사라지고, 
		//location.href = "MyPage.jsp";로 응답. (Redirect로 일단 응답을한다.)
		//그리고 client에서 다시 MyPage으로 요청하고 서버가 MyPage응답.. 
%>		
	
	<!-- 이런 방식을 많이 쓰니까 기억하기!!!!!!!!!!!!!!!!!!!!!!!!!! -->
	<form action="ResponseForMyPage.jsp" method="post">
		<input type="hidden" name="id" value=<%= id %>/>
		<input type="hidden" name="pwd" value=<%= pwd %>/>
	</form>

	<script>
		alert("<%=id%>님 반갑습니다.");
		document.form[0].submit();
	</script>


<%		
	}
	else{//비회원인 경우
		//response.sendRedirect("ResponseForRedirectIndex.jsp"); 
		out.println("<script>");
		out.println("alert('아이디와 비번이 불일치');");
		//history.back()
		//기존값이 그래도 유지: type="password"는 예외
		//out.println("history.back();");
		//location.replace()
		//기존 값이 사라진다. 새로고침과 같다.
		out.println("location.replace('ResponseForRedirectIndex.jsp')");
		out.println("</script>");
	}
	
%>