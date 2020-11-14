<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/Common/IsMember.jsp"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Write.jsp</title>
<link href="<%=request.getContextPath()%>/Style/divLayout.css"
	rel='stylesheet' />
</head>
<!--문제)!!!  제목 입력과 글내용 유효성 체크 만들기 -->
<body>
	<div class='allWrap'>
		<!-- 가운데 정렬용 div -->
		<div class='partWrap'>

			<!-- 탑메뉴 및 로고를 감싸는 div -->
			<div class="header">
				<div class="logo">
					<img src="<%=request.getContextPath()%>/Images/Logo.jpg"
						alt="회사 로고 이미지">
				</div>
				<div class="topMenu">
					<jsp:include page="/Template/Top.jsp"/>
				</div>
			</div>
			<!-- 탑메뉴 및 로고를 감싸는 div -->


			<!-- left메뉴 및 실제 내용 감싸는 div -->
			<div class="section">
				<div class="leftMenu">
					<jsp:include page="/Template/Left.jsp"/>
				</div>
				<div class="body">
					<div class="content">
						<fieldset style="padding: 10px">
							<legend>글작성 페이지</legend>
							
							<form action="WriteOk.jsp" method="post">
								<table width="75%" bgcolor="gray" cellspacing="1">
									<tr bgcolor="white">
										<td width="30%" align="center">제목</td>
										<td style="padding: 5px">
											<input type="text" name="title" style="width: 98%" />
										</td>
									</tr>
									<tr bgcolor="white">
										<td align="center">내용</td>
										<td style="padding: 5px">
											<textarea rows="10" style="width: 98%" name="content"></textarea>
										</td> ​
									</tr>
									<tr bgcolor="white" align="center">
										<td colspan="2">
											<input type="submit" value="등록" />
										</td>
									</tr>
								</table>
							</form>
							
							<form action=""></form>
							
						</fieldset>
					</div>
				</div>
			</div>
			<!-- left메뉴 및 실제 내용 감싸는 div -->

			<!--footer를 감싸는 div-->
			<div class="footer">
				<jsp:include page="/Template/Footer.jsp"/>
			</div>
			<!--footer를 감싸는 div-->

		</div>



	</div>
</body>

</html>