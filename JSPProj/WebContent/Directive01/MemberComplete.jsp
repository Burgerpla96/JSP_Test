<%@page import="java.util.Arrays"%>
<%@page import="java.io.IOException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%!
	private boolean isValidate(JspWriter out, String param){
	//JspWriter 내장객체인 out을 안 받고 함수내부에 선언해 쓰려고 하였으나,
	//JspWriter 는 추상 클래스이고 더 구현해야할게 많아서 쓰지 못하는 것으로 판단됨
		if(param == null || param.trim().length() == 0){
			try{
				out.println("<script>");
				out.println("alert(\"값을 입력하거나, 선택해야 합니다.\");");
				out.println("history.back();");
				out.println("</script>");
			} catch(IOException e) {
				e.printStackTrace();
			}
			return false;
		}
		return true;
	}

	private boolean isValidate(JspWriter out, String[] param){
		if(param == null){
			try{
				out.println("<script>");
				out.println("alert(\"관심사항을 선택해야 합니다.\");");
				out.println("history.back();");
				out.println("</script>");
			} catch(IOException e) {
				e.printStackTrace();
			}
			return false;
		}
		else{
			if(param.length<3){
				try{
					out.println("<script>");
					out.println("alert(\"관심사항은 3개 이상 선택하세요.\");");
					out.println("history.back();");
					out.println("</script>");
				} catch(IOException e) {
					e.printStackTrace();
				}
				return false;
			}
		}
		return true;
	}




%>	
	
	
<%
	//한글처리@@@
	request.setCharacterEncoding("UTF-8");
	//URL치고 오지 못하게 하기
	
	if(!"POST".equals(request.getMethod())){
		out.println("<script>");
		out.println("alert('잘못된 접근입니다.')");
		out.println("self.close");
		out.println("</script>");
		return;//void _jspService() method빠져나가기
	}
	
	//parameter 받기
	String id = request.getParameter("id");
	if(!isValidate(out, id)) return; //아디,비번 미입력시
	String pwd = request.getParameter("pwd");
	if(!isValidate(out, pwd)) return;
	String gender = request.getParameter("gender");
	if(!isValidate(out, gender)) return;
	String[] inter = request.getParameterValues("inter");
	if(!isValidate(out, inter)) return;
	String grade = request.getParameter("grade");
	if(!isValidate(out, grade)) return;
	String file = request.getParameter("file");
	if(!isValidate(out, file)) return;
	String self = request.getParameter("self");
	if(!isValidate(out, self)) return;
	
	
%>
	
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>MemberComplete.jsp</title>
<link href="../Style/divLayout.css" rel="stylesheet" />
</head>
<body>
	<div class="allWrap">
		<div class="partWrap">
			<!-- 탑메뉴 및 로고 감싸는 div 시작 -->
			<div class="header">
				<div class="logo">
					<img src="../Images/Logo.jpg" alt="회사 로고 이미지" />
				</div>
				<div class="topMenu">
					<%@ include file="/Template/Top.jsp" %>  
				</div>
			</div>
			<!-- 탑메뉴 및 로고 감싸는 div 끝 -->
			<!--Left메뉴 및 실제 내용 감싸는 div시작-->
			<div class="section">
				<div class="leftMenu">
					<%@ include file="/Template/Left.jsp" %>
				</div>
				<div class="body">
					<div class="content">
						<h2>회원가입 완료페이지</h2>
						<!-- 문제) 사용자가 입력한 값에 따라 바꾸기 -->
						<table style="width: 75%; border-spacing: 1px; background-color: green">
						
							<tr style="background-color: white">
								<td>아이디</td>
								<td><input type="text" name="id" size="20" value=<%= id %>"/> <span
									style="color: red; font-size: 0.8em" id="idError"></span></td>
							</tr>
							<tr style="background-color: white">
								<td>비밀번호</td>
								<td><input type="password" name="pwd" size="20" value=<%= pwd %>/></td>
							</tr>			
											
							<tr style="background-color: white">
								<td>성별</td>
								<td>
									<input type="radio" name="gender" value="man" 
										<%if("MAN".equals(gender.toUpperCase())){ %>checked<% } %>/>남 
									<input type="radio" name="gender" value="woman"
										 <%if("WOMAN".equals(gender.toUpperCase())){ %>checked<% } %>/>녀 
									<input type="radio" name="gender" value="trans" 
										<%if("TRANS".equals(gender.toUpperCase())){ %>checked<% } %>/>트랜스젠더
								</td>
							</tr>
							
							<tr style="background-color: white">
								<td>관심사항</td>
								<td>
									<!-- 배열에서 해당 값 있는지 확인 -->
									<input type="checkbox" name="inter" value="pol" 
									<%if(Arrays.toString(inter).indexOf("pol")!=-1){ out.println(" checked"); } %>/>정치
									<input type="checkbox" name="inter" value="eco" 
									<%if(Arrays.toString(inter).indexOf("eco")!=-1){ %>checked<% } %>/>경제 
									<input type="checkbox" name="inter" value="spo" 
									<%if(Arrays.toString(inter).indexOf("spo")!=-1){ %>checked<% } %>/>스포츠 
									<input type="checkbox" name="inter" value="ent" 
									<%if(Arrays.toString(inter).indexOf("ent")!=-1){ %>checked<% } %>/>연예
								</td>
							</tr>
							
							<tr style="background-color: white">
								<td>학력사항</td>
								<td><select name="grade">
										<option value="">==학력을 선택하세요==</option>
										<option value="ele" 
										<%if("ELE".equals(grade.toUpperCase())){  %>selected="selected"<%  } %>>초등학교</option>
										<option value="mid" 
										<%if("MID".equals(grade.toUpperCase())){ %>selected="selected"<% } %>>중학교</option>
										<option value="hig" 
										<%if("HIG".equals(grade.toUpperCase())){ %>selected="selected"<% } %>>고등학교</option>
										<option value="uni" 
										<%if("UNI".equals(grade.toUpperCase())){ %>selected="selected"<% } %>>대학교</option>
								</select></td>
							</tr>
							
							<tr style="background-color: white">
								<td>첨부파일</td>
								<td><input type="file" name="file" size="40"  /><%= file %></td>
							</tr>
							<tr style="background-color: white">
								<td>자기소개</td>
								<td><textarea cols="60" rows="5" name="self"><%= self %></textarea></td>
							</tr>
							
						</table>
					</div>
				</div>
			</div>
			<!--Left메뉴 및 실제 내용 감싸는 div끝-->
			<!--footer를 감싸는 div 시작-->
			<div class="footer">
				<%@ include file="/Template/Footer.jsp" %>
			</div>
			<!--footer를 감싸는 div 끝-->
		</div>
	</div>
</body>
</html>