<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<h2>삽입된 페이지</h2>
<hr/>

<ul style="list-style: upper-roman;">
	<li>Integer type: <%= pageContext.getAttribute("pageInteger") %></li>
	<li>String type: <%= pageContext.getAttribute("pageString") %></li>
	<li>Date type: <%= pageContext.getAttribute("pageDate") %></li>
	<li>MemberDTO type1: <%= firstMemberString %></li>
	<li>MemberDTO type2: <%= second %></li>
</ul>