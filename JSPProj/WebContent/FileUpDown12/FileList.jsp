<%@page import="java.io.IOException"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.multipart.FileRenamePolicy"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%	
	String saveDirectory =  application.getRealPath("/Upload");
	File file = new File(saveDirectory);
	File [] files = file.listFiles();
	//out.println(file.length());
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FileList.jsp</title>
</head>
<body>
	<fieldset>
		<c:set var="files" value="<%=files %>"/>
		<legend>업로드된 파일 목록</legend>
		<ul style="list-style: decimal;">
			<%for(File f : files){ %>
				<li>파일명: <a href="Download.jsp?filename=<%=f.getName() %>"><%=f.getName() %></a>, 파일크기: <%=(int)Math.ceil(f.length()/1024.0) %>KB</li>
				
			<%} %>
			
		
		</ul>
	</fieldset>
</body>
</html>