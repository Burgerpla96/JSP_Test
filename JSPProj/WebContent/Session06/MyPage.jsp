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
					<img src="<%= request.getContextPath() %>/Images/Logo.jpg"
						alt="회사 로고 이미지">
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
							<legend>마이 페이지</legend>
							<table style="width: 300px; border-spacing: 1px; background-color: green">
								<tr style="background-color: white">
									<td style="width: 25%">아이디</td>
									<td style="padding-left: 5px"><%= session.getAttribute("USER_ID") %></td>
								</tr>
								<tr style="background-color: white; text-align: center">
									<td colspan="2"><a href="Logout.jsp">로그아웃</a></td>
								</tr>
							
							</table>
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