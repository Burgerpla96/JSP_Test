<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.io.IOException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	//field
	private Connection conn;
	private PreparedStatement psmt;
	private ResultSet rs;
	private JspWriter out;
	
	//method
	private void connect(ServletContext app){
		try{
			//드라이버 로딩
			Class.forName(app.getInitParameter("ORACLE_DRIVER"));
			//데이터 베이스 연결
			conn = DriverManager.getConnection(
					app.getInitParameter("ORACLE_URL"),
					"scott","scott");
			out.println("<h2>드라이버 연결 성공</h2>");
		} catch(ClassNotFoundException e){
			try{
				out.println("<h2>드라이버 로딩 실패</h2>");
			} catch(IOException e1){
				e1.printStackTrace();
			}
			
		} catch(SQLException | IOException e){
			try{
				out.println("<h2>DB 로딩 실패</h2>");
			} catch(IOException e1){
				e1.printStackTrace();
			}
		}
		
		
	}////////connext()

    private void close(){
		try{
			if(rs != null) rs.close();
			if(psmt != null) psmt.close();
			if(conn != null) conn.close();
			
		} catch(SQLException e){
			e.printStackTrace();
		}
		
	}////////close
    
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ScriptingPractice.jsp</title>
</head>
<body>
	<fieldset>
		<legend>Scripting 요소 연습하기</legend>
		<h2>표현식으로 출력</h2>
		<table style="border-spacing: 2px; background-color: green; ">
			<tr style="background-color: white">
				<th>사번</th>
				<th>이름</th>
				<th>직책</th>
				<th>입사일</th>
				<th>연봉</th>
				<th>보너스</th>
				<th>부서코드</th>
			</tr>
			<!-- 아래 tr을 반복 -->
			<%
				this.out = out;
				//데이터 베이스 연결
				connect(application);
				//쿼리문 준비
				String sql = "SELECT * FROM emp ORDER BY empno";
				//쿼리 실행용 객체 얻기
				psmt = conn.prepareStatement(sql,
						ResultSet.TYPE_SCROLL_INSENSITIVE,
						ResultSet.CONCUR_READ_ONLY);
				rs = psmt.executeQuery();
				while(rs.next()){
				
			%>
			
			<tr style="background-color: white">
				<td><%= rs.getString(1) %></td>
				<td><%= rs.getString(2) %></td>
				<td><%= rs.getString(3) %></td>
				<td><%= rs.getDate(5) %></td>
				<td><%= rs.getString(6) %></td>
				<td><%= rs.getString(7) == null ? "":rs.getString(7) %></td>
				<td><%= rs.getString(8) %></td>
			</tr>
		
			<% }//while  %>
		
		</table>
		
		<h2>out내장 객체로 출력</h2>
			<table style="border-spacing: 2px; background-color: green; ">
				<tr style="background-color: white">
					<th>사번</th>
					<th>이름</th>
					<th>직책</th>
					<th>입사일</th>
					<th>연봉</th>
					<th>보너스</th>
					<th>부서코드</th>
				</tr>
				<%
					while(rs.previous()){
						out.println("<tr style='background-color: white'>");
						out.println("<td>"+rs.getString(1)+"</td>");						
						out.println("<td>"+rs.getString(2)+"</td>");						
						out.println("<td>"+rs.getString(3)+"</td>");						
						out.println("<td>"+rs.getDate(5)+"</td>");						
						out.println("<td>"+rs.getString(6)+"</td>");						
						out.println("<td>"+(rs.getString(7)==null 
								? "" : rs.getString(7))+"</td>");						
						out.println("<td>"+rs.getString(8)+"</td>");						
						out.println("</tr>");
					}
					
					
				%>
			</table>
		
		<%
			//자원반납
			close();
		%>
	
	</fieldset>
</body>
</html>