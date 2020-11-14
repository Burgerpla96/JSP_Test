<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	//connection pool이해하기 pool에서 connection가져오기
	//1) InitialContext객체 생성(Context > InitialContext)
	Context ctx = new InitialContext();
	//2) InitialContext 객체로 JNDI서비스 구조의 초기 --ROOT디렉토리 얻기
	//lookup으로 각 WAS서버의 서비스 루트 디렉토리를 얻는다. 톰켓은 java:comp/env
	//ctx = (Context)ctx.lookup("java:comp/env");
	//3) context.xml에 등록한 네임으로 lookup, DataSource얻기 
	//DataSource source = (DataSource)ctx.lookup("jsp");
	
	//풀경로로 접근
	DataSource source = (DataSource)ctx.lookup("java:comp/env/jsp");
	
	//4) 커넥션 풀에서 톰켓이 생성해 놓은 connectino객체 갖다 쓰기
	//DataSource의 getConnection method이용
	Connection conn = source.getConnection();
	
	String connString;
	if(conn != null) connString="<h3>데이타 베이스 연결성공</h3>";
	else connString="<h3>데이타 베이스 연결실패</h3>";
	//5) connection pool에 사용한 객체 반납 (메모리 해제가 아니다.)
	conn.close();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ConnectionPool.jsp</title>
</head>
<body>
	<fieldset>
		<legend>커넥션 풀</legend>
		<%=connString %>
	</fieldset>
</body>
</html>