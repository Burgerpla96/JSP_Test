<%@page import="model.PagingUtil"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="model.BBSDto"%>
<%@page import="java.util.List"%>
<%@page import="model.BBSDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/Common/IsMember.jsp" %>
<%
	//한글 처리
	request.setCharacterEncoding("UTF-8");
	//검색과 관련된 파라미터 받기
	String searchColumn = request.getParameter("searchColumn");
	String searchWord = request.getParameter("searchWord");
	
	String queryString = "";//검색용 쿼리 스트링
	
	
	//시작 및 끝 행번호와 검색 관련 데이타 저장용
	Map map = new HashMap();
	
	//맵에 검색어 저장
	if(searchColumn != null){
		map.put("columnName",searchColumn); 
		map.put("keyword",searchWord); 
		//검색시 생성된 페이징 번호 클릭시 처리하기 위한 추가 쿼리스트링
		queryString = String.format("searchColumn=%s&searchWord=%s&",searchColumn,searchWord);
	}//////
	

	//전체 글 목록 가져오기
	BBSDao dao = new BBSDao(application,"JSP","jsp");
	
	//페이징을 위한 로직 시작)
	//전체 레코드 수
	int totalRecordCount = dao.getTotalRowCount(map);
	//페이지 사이즈
	int pageSize = Integer.parseInt(application.getInitParameter("PAGE_SIZE"));
	//blockPage
	int blockPage = Integer.valueOf(application.getInitParameter("BLOCK_PAGE"));
	//전체 페이지 수
	int totalPage = (int)Math.ceil((double)totalRecordCount/pageSize); 
	//현재 페이지 번호
	int nowPage = request.getParameter("nowPage")==null ? 1 : Integer.parseInt(request.getParameter("nowPage"));
	//시작 및 끝 ROWNUM 구하기
	int start = (nowPage-1) * pageSize+1;
	int end = nowPage * pageSize;
	
	
	//페이징을 위한 로직 끝)
	map.put("start",start);
	map.put("end",end);
	List<BBSDto> list = dao.selectList(map);
	

	dao.close();

%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>List.jsp</title>
<link href="<%=request.getContextPath()%>/Style/divLayout.css"
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

							<legend>회원제 게시판 목록(<%=nowPage %>/<%=totalPage %>)</legend>
							<!-- 글쓰기 버튼 -->
							<table style="width: 100%">
								<tr>
									<td style="text-align: right"><a href="Write.jsp">글작성</a></td>
								</tr>
							</table>

							<table width="100%" style="border-spacing: 1px; background-color: gray">
								<tr style="background-color: white" align="center">
									<th width="10%">번호</th>
									<th width="45%">제목</th>
									<th width="15%">작성자</th>
									<th width="10%">조회수</th>
									<th>작성일</th>
								</tr>

								<!-- 게시판의 글들 -->
								<% if(list.isEmpty()){//글이 있을 때 %>
								<tr style="background-color: white" align="center">
									<td colspan="5">등록된 글이 없어요</td>
								</tr>
								<%}else{ 
									int countNum = 0;
									//글이 있을때,
									for(BBSDto dto:list){
										
								%>​
								<tr style="background-color: white" align="center">
									<td><%--= dto.getNo() --%><%=totalRecordCount - (((nowPage - 1) * pageSize) + countNum) %></td>
									<td style="text-align: left"><a href="View.jsp?<%=queryString %>no=<%=dto.getNo() %>&nowPage=<%=nowPage%>"><%= dto.getTitle() %></a></td>
									<!--  주소의 쿼리 스트링에 띄어쓰기 있으면 안된다. -->
									<td><%= dto.getName() %></td>
									<td><%= dto.getVisitcount() %></td>
									<td><%= dto.getPostDate() %></td>
								</tr>
								<%	 
										countNum++;
									 }//for
								
								  }//else닫기 %>




							</table>
							<!-- 페이징 -->
							<table width="100%">
								<tr align="center">
									<td><%= PagingUtil.pagingText(totalRecordCount, pageSize, blockPage, nowPage, "List.jsp?"+queryString) %></td>
								</tr>
							</table>
							
							<!-- 검색UI -->
							<form method="post">
								<table width="100%">
									<tr align="center">
										<td>
											<select name="searchColumn">
												<option value="title">제목</option>
												<option value="name">작성자</option>
												<option value="content">내용</option>
											</select> 
											<input type="text" name="searchWord" /> 
											<input type="submit" value="검색" />
										</td>
									</tr>
								</table>
							</form>
							<!-- 검색 -->
							
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