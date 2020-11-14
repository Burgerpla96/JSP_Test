<%@page import="java.io.File"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.io.IOException"%>
<%@page import="com.oreilly.servlet.multipart.FileRenamePolicy"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	//1) 한글 처리
	request.setCharacterEncoding("UTF-8");
	// 파일 업로드를 위한 MultipartRequest 객체 생성
	//MultipartRequest생성만으로 파일 업로드가 이루어진다.
	/*
	MultipartRequest(javax.servlet.http.HttpServletRequest request, 
			java.lang.String saveDirectory,
			int maxPostSize, java.lang.String encoding,
			FileRenamePolicy policy)
	
	MultipartRequest 객체 생성 오류는 최대 업로드 초과시 발생
	*/
	//3) MultipartRequest 생성자의 인자 설정
	//3-1) 업로드할 서버의 물리적 디렉토리 설정
	String saveDirectory = application.getRealPath("/Upload");
	out.println(saveDirectory);
	//out.println("saveDirectory: "+saveDirectory);
	
	//3-2) upload 최대 파일 용량 설정(바이트 단위)
	//file 여러개면 모두 합친것이 최대 용량
	int maxPostSize = 1024*500; // 500KB
	
	//3-3) encoding 타입 설정
	String encoding = "UTF-8";
	
	//3-4) 파일명 중복시 파일명 재정의하도록 FileRenamePolicy객체얻기(인덱스가 자동 부여됨)
	FileRenamePolicy policy = new DefaultFileRenamePolicy();
	
	//4) MultipartRequest 객체 생성
	MultipartRequest mr = null;
	String name = null;
	String title = null;
	String inter = null;
	File file1 = null, file2 = null;
	
	try{
		mr = new MultipartRequest(request,saveDirectory,maxPostSize,encoding,policy);
		//이제부터 MultipartRequest가 request parameter를 모두 가져가 아래에서 쓸 수 없다. 
		//out.println("request: "+request.getParameter("name"));
		//out.println("mr: "+mr.getParameter("name"));

		
		//5) 기타 폼의 하위 요소(파라미터) 받기 MultipartRequest객체로 받는다.
		name = mr.getParameter("name");
		title = mr.getParameter("title");
		inter = Arrays.toString(mr.getParameterValues("inter"));
		file1 = mr.getFile("attachedFile1");
		file2 = mr.getFile("attachedFile2");

	} catch(IOException e){//파일 업로드 용량 초과시
		//에러내용을 리퀘스트 영역에 저장
		request.setAttribute("error", "최대 파일 용량(500KB)을 초과 했어요.");
		//UploadForm.jsp로 포워드
		request.getRequestDispatcher("UploadForm.jsp").forward(request, response);
	}
	
	
	
%>




<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UploadComplete.jsp</title>
</head>
<body>
	<fieldset>
		<legend>file upload result</legend>
		<h2>type="file"인 요소 를 제외한 form 요소</h2>
		<ul style="list-style: upper-roman;">
			<li>이름: <%=name %></li>
			<li>제목: <%=title %></li>
			<li>관심사항: <%=inter %></li>
		</ul>
		
		<h2>업로드된 파일 관련 정보</h2>
		<h3>첫 번째 파일</h3>
		<ul style="list-style: upper-roman;">
			<li>원본파일명: <%=mr.getOriginalFileName("attachedFile1") %></li>
			<li>실제 서버에 저장된 파일명: <%=mr.getFilesystemName("attachedFile1") %></li>
			<li>컨텐츠 타입: <%=mr.getContentType("attachedFile1") %></li>
			<li>파일 크기: <%=(int)Math.ceil(file1.length()/1024.0) %>KB</li>
			<%
				String filename = file1.getName();
				String ext = filename.substring(filename.lastIndexOf(".")+1);
				if(ext.equalsIgnoreCase("JPG") || ext.equalsIgnoreCase("PNG")){
			%>
			<li>
				<img alt="이미지" src="<c:url value='/Upload'/>/<%=filename %>" style="width: 200px;height: 200px"/>
			</li>
			<%} %>
		</ul>
		
		<h3>두 번째 파일</h3>
		<ul style="list-style: upper-roman;">
			<li>원본파일명: <%=mr.getOriginalFileName("attachedFile2") %></li>
			<li>실제 서버에 저장된 파일명: <%=mr.getFilesystemName("attachedFile2") %></li>
			<li>컨텐츠 타입: <%=mr.getContentType("attachedFile2") %></li>
			<li>파일 크기: <%=(int)Math.ceil(file2.length()/1024.0) %>KB</li>
			<%
				filename = file2.getName();
				ext = filename.substring(filename.lastIndexOf(".")+1);
				if(ext.equalsIgnoreCase("JPG") || ext.equalsIgnoreCase("PNG")){
			%>
			
			<li>
				
				<img alt="이미지" src="/JSPProj/Upload/<%=filename %>" style="width: 200px;height: 200px"/>
			</li>
			
			<%} %>
			<c:url value='/Upload'/>
		</ul>
		
		
		
		
	</fieldset>
</body>
</html>