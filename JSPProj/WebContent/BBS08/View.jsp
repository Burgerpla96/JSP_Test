<%@page import="java.net.URLDecoder"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.Map"%>
<%@page import="model.BBSDto"%>
<%@page import="model.BBSDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/Common/IsMember.jsp"%>
<%
	//1) 파라미터 (키값)받기
	String no = request.getParameter("no");
	
	
	//검색과 관련된 파라미터 받기
	String searchColumn = request.getParameter("searchColumn");
	String searchWord = request.getParameter("searchWord");
	
	String queryString = "";//검색용 쿼리 스트링
	if(searchColumn != null){
		searchWord = URLDecoder.decode(request.getParameter("searchWord"),"UTF-8");
	}
	
	//맵에 검색어 저장
	if(searchColumn != null){
		//검색시 생성된 페이징 번호 클릭시 처리하기 위한 추가 쿼리스트링
		queryString = String.format("searchColumn=%s&searchWord=%s&",searchColumn,searchWord);
	}//////
	
	
	
	
	//현재 페이지 받기
	String nowPage = request.getParameter("nowPage");
	
	//2) CRUD작업용 BBSDao생성
	BBSDao dao = new BBSDao(application, "JSP","jsp");
	//이전 패이지명 얻기 : List.jsp에서 View로 올때만 조회수 증가하기 위함
	String referer = request.getHeader("REFERER");
	int beginIndex = referer.lastIndexOf("/")+1;
	String prevPage = referer.substring(beginIndex);
	
	
	//조회수 업데이트 및 상세보기
	BBSDto dto = dao.selectOne(no,prevPage);	
	
	//이전글 다음글 가져오기
	Map<String, BBSDto> map = dao.prevNext(no);
	
	dao.close();

%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>View.jsp</title>
<link href="<%=request.getContextPath()%>/Style/divLayout.css"
	rel='stylesheet' />
	
<script>
	function isDelete() {
		if(confirm("정말로 삭제 하시겠습니까?")){
			location.replace("Delete.jsp?<%=queryString%>no=<%= no%>&nowPage=<%= nowPage%>");
		}
	}
</script>

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
							<legend>글 상세보기 페이지</legend>
							
							<form action="WriteOk.jsp" method="post">
								<table width="75%" bgcolor="gray" cellspacing="1">
									<tr bgcolor="white">
										<td width="30%" align="center">작성자</td>
										<td style="padding: 5px">
										<%= dto.getName() %>
										</td>
									</tr>
									<tr bgcolor="white">
										<td width="30%" align="center">작성일</td>
										<td style="padding: 5px">
										<%= dto.getPostDate() %>
										</td>
									</tr>
									<tr bgcolor="white">
										<td width="30%" align="center">조회수</td>
										<td style="padding: 5px">
										<%= dto.getVisitcount() %>
										</td>
									</tr>
									<tr bgcolor="white">
										<td width="30%" align="center">제목</td>
										<td style="padding: 5px">
										<%= dto.getTitle() %>
										</td>
									</tr>
									<tr bgcolor="white">
										<td align="center">내용</td>
										<td style="padding: 5px">
										<%= dto.getContent().replace("\r\n", "<br/>") %>
										</td> 
												​
									</tr>
									<tr bgcolor="white" align="center">
										<td colspan="2">
										<% if(dto.getId().equals(session.getAttribute("USER_ID"))){ %>	
										<a href="Edit.jsp?<%=queryString %>no=<%=no%>&nowPage=<%=nowPage%>">수정</a> | <a href="javascript:isDelete()">삭제</a> | 
										<%} %>
										<a href="List.jsp?<%=queryString %>nowPage=<%=nowPage%>">목록</a>
										
										
										</td>
									</tr>
								</table>
								<!--  이전글 / 다음글 -->
								<table style="width: 75%;">
									<tr>
										<td style="width: 15%">이전글</td>
										<td><%= map.get("PREV")==null?"이전글이 없습니다.":String.format("<a href='View.jsp?no=%s'>%s</a>",map.get("PREV").getNo(),map.get("PREV").getTitle()) %></td>
									</tr>
									<tr>
										<td style="width: 15%">다음글</td>
										<td><%= map.get("NEXT")==null?"다음글이 없습니다.":String.format("<a href='View.jsp?no=%s'>%s</a>",map.get("NEXT").getNo(),map.get("NEXT").getTitle()) %></td>
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