<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Index.html</title>
<link href="<%= request.getContextPath() %>/Style/divLayout.css"
	rel='stylesheet' />
</head>

<body>
	<div class='allWrap'>
		<!-- 가운데 정렬용 div -->
		<div class='partWrap'>

			<!-- 탑메뉴 및 로고를 감싸는 div -->
			<div class="header">
				<div class="logo">
					<img src="<%= request.getContextPath() %>/Images/Logo.jpg" alt="회사 로고 이미지">
				</div>
				<div class="topMenu">
					<%@ include file="/Template/Top.jsp"%>
				</div>
			</div>
			<!-- 탑메뉴 및 로고를 감싸는 div -->


			<!-- left메뉴 및 실제 내용 감싸는 div -->
			<div class="section">
				<div class="leftMenu">
					<%@ include file="/Template/Left.jsp"%>
				</div>
				<div class="body">
					<div class="content">
					
						<fieldset style="padding: 10px">
						
							<legend>로그인 페이지</legend>
							<span style="color: red; font-weight: bold">
								<%= request.getAttribute("NOT_LOGIN")==null ? "" : request.getAttribute("NOT_LOGIN") %>
							</span>
							
							<form method="post" action="LoginProcess.jsp">
								<table
									style="width: 300px; border-spacing: 1px; background-color: green">
									<tr style="background-color: white">
										<td style="width: 25%">아이디</td>
										<td style="padding-left: 5px">
											<input type="text" name="user" 
											value='<%= request.getParameter("user")==null?"":request.getParameter("user") %>' />
										</td>
									</tr>

									<tr style="background-color: white">
										<td>비밀번호</td>
										<td style="padding-left: 5px">
											<input type="password" name="pass"
											value='<%= request.getParameter("user")==null?"":request.getParameter("user") %>'>
										</td>
									</tr>
									<tr style="background-color: white; text-align: center">
										<td colspan="2"><input type="submit" value="로그인" /></td>
									</tr>
								</table>
							</form>
							
						</fieldset>

					</div>
				</div>
			</div>
			<!-- left메뉴 및 실제 내용 감싸는 div -->

			<!--footer를 감싸는 div-->
			<div class="footer">
				<%@ include file="/Template/Footer.jsp"%>
			</div>
			<!--footer를 감싸는 div-->

		</div>





	</div>
</body>

</html>