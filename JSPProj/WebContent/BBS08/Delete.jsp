<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="model.BBSDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Delete.jsp -->

<%--

	//파라미터 받기
	String no = request.getParameter("no");
	String nowPage = request.getParameter("nowPage");
	int pageSize = Integer.parseInt(application.getInitParameter("PAGE_SIZE"));
	
	
	
	
	
	
	//CRUD작업용
	BBSDao dao = new BBSDao(application, "JSP","jsp");
	Map map = new HashMap();
	int totalRecordCountNoChange = dao.getTotalRowCount(map);
	int affected = dao.delete(no);
	int totalRecordCountChange = dao.getTotalRowCount(map);
	//13/3 ->4.3->5  12 -> 4
	dao.close();
	
	int totalPage = (int)(Math.ceil(((double)totalRecordCountNoChange/pageSize)));
	int totalPageChange = (int)(Math.ceil(((double)totalRecordCountChange/pageSize)));
	
	if(affected == 1){//있는 지 없는 지 비교
		if(totalPage != totalPageChange && Integer.parseInt(nowPage) == totalPage){
			//총 페이지의 수가 변화가 있을때 //마지막 페이지를 보는 중에 삭제 할때
			response.sendRedirect("List.jsp?no"+no+"&nowPage="+(Integer.parseInt(nowPage)-1));
		}
		//중간에서 삭제할때와, 총페이지 수의 변화가 없을 때.
		else{ 
			response.sendRedirect("List.jsp?no"+no+"&nowPage="+nowPage);
		}
	}
	else {
		out.println("<script>");
		out.println("alert('삭제 실패했어요.');");
		out.println("history.back();");
		out.println("</script>");
	}
	

--%>
<%
//delete2
//선생님방식

	//파라미터 받기
	String no = request.getParameter("no");
	int nowPage = Integer.parseInt(request.getParameter("nowPage"));
	
	//CRUD작업용
	BBSDao dao = new BBSDao(application, "JSP","jsp");
	Map map = new HashMap();
	int affected = dao.delete(no);
	//13/3 ->4.3->5  12 -> 4
	
	
	String searchColumn = request.getParameter("searchColumn");
	//submit incoding변경 방법1)
	String searchWord =request.getParameter("searchWord");
	
	String queryString = "";//검색용 쿼리 스트링
	
	//맵에 검색어 저장
	if(searchColumn != null){
		//검색시 생성된 페이징 번호 클릭시 처리하기 위한 추가 쿼리스트링
		queryString = String.format("searchColumn=%s&searchWord=%s&",searchColumn,searchWord);
		map.put("searchColumn",searchColumn);
		map.put("searchWord",searchWord);
		
	}//////
	
	
	int totalRecordCount = dao.getTotalRowCount(map);
	int pageSize = Integer.parseInt(application.getInitParameter("PAGE_SIZE"));
	int totalPage = (int)(Math.ceil(((double)totalRecordCount/pageSize)));
	if(nowPage > totalPage) nowPage = totalPage;
	
	dao.close();
	if(affected == 1){//있는 지 없는 지 비교
		response.sendRedirect("List.jsp?no"+no+"&nowPage="+nowPage+"&"+queryString);
	}
	else {
		out.println("<script>");
		out.println("alert('삭제 실패했어요.');");
		out.println("history.back();");
		out.println("</script>");
	}

%>





