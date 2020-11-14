<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    %>
    
<%@ include file="IncludePage.jsp" %>
    
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Index.html</title>
    <link href="../Style/divLayout.css" rel='stylesheet'/>
</head>

<body>
    <div class='allWrap'>
        <!-- 가운데 정렬용 div -->
        <div class='partWrap'>

            <!-- 탑메뉴 및 로고를 감싸는 div -->
            <div class="header">
                <div class="logo"><img src="../Images/Logo.jpg" alt="회사 로고 이미지"></div>
                <div class="topMenu">
                    <%@ include file="/Template/Top.jsp" %>
                </div>
            </div>
            <!-- 탑메뉴 및 로고를 감싸는 div -->

            <!-- left메뉴 및 실제 내용 감싸는 div -->
            <div class="section">
                <div class="leftMenu">
                    <%@ include file="/Template/Left.jsp" %>
                </div>
                <div class="body">
                    <div class="content">
                        <h2>메인페이지</h2>
                        <h4>현재 페이지명: <%= currentPage %> </h4>
                       
                    </div>
                </div>
            </div>
            <!-- left메뉴 및 실제 내용 감싸는 div -->

            <!--footer를 감싸는 div-->
            <div class="footer">
            	<%@ include file="/Template/Footer.jsp" %>
            </div>
            <!--footer를 감싸는 div-->

        </div>
    </div>
</body>

</html>