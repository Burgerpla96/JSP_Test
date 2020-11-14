<%@page import="java.util.Set"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%!
	private String codeToValue(String code){
		switch(code.toLowerCase()){
		case "eco": return "경제";
		case "pol": return "정치";
		case "spo": return "스포츠";
		default: return "연예";
		}
	}
	

%>
	
<% 
	//post방식일때 한글 처리용
	//get방식일때, 놔둬도 괜찮다.
	request.setCharacterEncoding("UTF-8");
	
	/*
	-parameter name이 틀린경우, null반환
	-맨 처음에도 null
	*/
	//파라미터 받기
	String name = request.getParameter("name");
	//text박스는 입력 없을시 ""전달   //맨처음에는 null이다.(value 없을 시)
	String gender = request.getParameter("gender");
	//checkbox는 값입력 없을시 null 전달
	String [] inter = request.getParameterValues("inter");
	/*
	out.println(String.format(
			"Name: %s, Gender: %s, Inter: %s",name,gender,inter));
	*/
	
	String values = "";
	if(name != null && name.trim().length() != 0 
			&& gender != null && inter != null){
		values = String.format("이름: %s, 성별: %s, 관심사항: ", name,gender);
		for(String code : inter) values += codeToValue(code)+" ";
	}
	
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RequestForParameter.jsp</title>
</head>
<body>
	<fieldset>
		<legend>사용자가 전송한 파라미터와 관련된 request객체의 메소드</legend>
		<h3>form태그를 이용한 값 전송</h3>
		<form method="get">
		
			<table cellspacing="1" bgcolor="gray">
				<tr bgcolor="white">
					<td>이름</td>
					<td><input type="text" name="name" /></td>
				</tr>
				
				<tr bgcolor="white">
					<td>성별</td>
					<td>
						남<input type="radio" name="gender" value="남자" /> 
						여<input type="radio" name="gender" value="여자" />
					</td>
				</tr>

				<tr bgcolor="white">
					<td>관심사항</td>
					<td>
						경제<input type="checkbox" name="inter" value="eco" /> 
						정치<input type="checkbox" name="inter" value="pol" />
						스포츠<input type="checkbox" name="inter" value="spo" />
						연예<input type="checkbox" name="inter" value="ent" />
					</td>
				</tr>

				<tr bgcolor="white" align="center">
					<td colspan="2"><input type="submit" value="확인" /></td>
				</tr>
			</table>
			
		</form>
		<!--값 출력-->
		<%= values %>
		<h3>A태그를 이용한 값 전송</h3>
		<a href="RequestForParameter.jsp?name=홍길동&gender=남&inter=spo&inter=ent">GET</a>
		<h3>모든 파라미터명 얻기</h3>
		<!--
		-request객체의 getParameterNames()메소드로 얻는다
		-파라미터명 존재 여부판단
		-->
		<ul style="list-style-type: upper-roman;">​
			<%
				Enumeration<String> names = request.getParameterNames();
				while(names.hasMoreElements()){
					//parameter명 얻기
					String paramName = names.nextElement();
					//parameter 값 얻기
					if(paramName.equals("inter")){ //check박스로 값 여러개일떄
						//getParameterValues() use
						String[] inters = request.getParameterValues(paramName);
						String paramValues = "";
						for(String code:inters) paramValues += codeToValue(code)+ " ";
						out.println("<li>"+paramName+" : "+paramValues+"</li>");
					}
					else{//값이 하나일때
						//getParameter() use
						String paramValue = request.getParameter(paramName);
						out.println("<li>"+paramName+" : "+paramValue+"</li>");
					}
				}
			
			%>
			<!-- <li></li>  -->
			
		</ul>​
	</fieldset>
	
	<h2>맵으로 모든 파라미터 받기</h2>
	<ul style="list-style-type: upper-roman;">​ 
		<%
			//키값 -> 모든 파라미터명
			//벨류값 -> 사용자가 입력하거나 선택한 값
			//getParameterMap(): 많은 파라미터가 있을 때, 한꺼번에 받아서  유리
			Map<String, String[]> params = request.getParameterMap();
			//파라미터 명 얻기(키값)
			Set<String> paramNames = params.keySet();
			for(String paramName : paramNames){
				//parameter 값 얻기
				if(paramName.equals("inter")){ //check박스로 값 여러개일떄
					//getParameterValues() use
					String[] inters = request.getParameterValues(paramName);
					String paramValues = "";
					for(String code:inters) paramValues += codeToValue(code)+ " ";
					out.println("<li>"+paramName+" : "+paramValues+"</li>");
				}
				else{//값이 하나일때
					//getParameter() use
					String paramValue = request.getParameter(paramName);
					out.println("<li>"+paramName+" : "+paramValue+"</li>");
				}
			}
		%>
	
	
	​
	</ul>

</body>
</html>