<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="model.BBSDto"%>
<%@page import="model.BBSDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- EditOk.jsp -->

<%	
	//1) 한글처리
	request.setCharacterEncoding("UTF-8");
	//2) 파라미터 받기
	String no = request.getParameter("no");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	/*
	검색 후 수정시 주의사항
	sendRedirect() 로 쿼리스트링 연결시 한글 깨짐 
	해결책:
	1. 검색어를 URLEncoder.encode(request.getParameter("searchWord"),"UTF-8"); 한다.
		단, 검색후 총 레코드 구할때는 인코딩하지 않은 검색어 전달
	2. 수정 완료후 Veiw로 이동시 뷰에서는 URLDecoder.decode(request.getParameter("searchWord"),"UTF-8"); 하기
	
	
	다른 방법
	form tag 이용 input="hidden"으로 파라미터 넘기기
	
	
	
	*/
	
	//검색과 관련된 파라미터 받기
	String searchColumn = request.getParameter("searchColumn");
	//submit incoding변경 방법1)
	String searchWord = URLEncoder.encode(request.getParameter("searchWord"),"UTF-8");
	
	Map map = new HashMap();//검색으로 올때
	String queryString = "";//검색용 쿼리 스트링
	
	//맵에 검색어 저장
	if(searchColumn != null){
		//검색시 생성된 페이징 번호 클릭시 처리하기 위한 추가 쿼리스트링
		queryString = String.format("searchColumn=%s&searchWord=%s&",searchColumn,searchWord);
		map.put("searchColumn",searchColumn);
		map.put("searchWord",request.getParameter("searchWord"));
		
	}//////
		
	
	
	//현재 페이지 받기
	String nowPage = request.getParameter("nowPage");
	// 작성자의 아이디 얻기: 세션영역에서
	String id = session.getAttribute("USER_ID").toString();
	//3) 데이터를 전달할 DTO 객체 생성 및 데이타 설정
	BBSDto dto = new BBSDto(no,null,title,content,null,null);
	//4) CRUD 작업용 DAO계열 객체 생성
	BBSDao dao = new BBSDao(application,"JSP","jsp");
	int affected = dao.update(dto); 
			
	dao.close();
	if(affected == 1){
		response.sendRedirect("View.jsp?"+queryString+"no="+no+"&nowPage="+nowPage);
		%>
		<!--  response.sendRedirect("View.jsp?"+queryString+"no="+no+"&nowPage="+nowPage);-->
		<!-- 넘길떄 한글 깨져서 바꿈 -->
		<!-- 
		//submit incoding변경  방법2)
		<form action="View.jsp">
			<input type="hidden" name="no" value= "<%=no %>" />
			<input type="hidden" name="nowPage" value= "<%=nowPage %>" />
			<input type="hidden" name="searchColumn" value= "<%=searchColumn %>" />
			<input type="hidden" name="searchWord" value= "<%=searchWord %>" />
		</form>
		<script>
			document.forms[0].submit();
		</script>
		 -->
		<%
	}
	else {%>
	<script type="text/javascript">
		alert("수정 실패했어요.");
		history.back();
		
	</script>
	<%	
	}//else

%>