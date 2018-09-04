<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setAttribute("key", "mock"); 
	

%>
<%@ include file="/layout/top.jspf"%>
	<form action="<%= application.getContextPath() %>/message/sending.jsp" method="post">
	<p>
		내용(*)<br/>
		<textarea name="content" style="height: 300px; width: 220px; padding: 5px; resize: none; font-family: inherit;"
			placeholder="write a message"></textarea>
	</p>
	<p>
		수신자(*)<br/>
		<input type="text" name="receiver" placeholder="write a receiver" style="width:220px; padding: 5px"/>
	</p>

	<button type="submit">메세지 전송</button>
	</form>

<%@ include file="/layout/bottom.jspf"%>