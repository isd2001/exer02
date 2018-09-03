<%@page import="beans.MessageDAO"%>
<%@ page import="java.text.*" %>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String logid =(String)session.getAttribute("logid");
	String receiverid = request.getParameter("receiverid");
	String sendmessage = request.getParameter("sendmessage");
	Date senddate= new Date(System.currentTimeMillis());
	//SimpleDateFormat sdf = new SimpleDateFormat("HH:mm MM.dd.YYYY");

	MessageDAO dao = new MessageDAO();
	int r=dao.messageroom(logid, receiverid, sendmessage, senddate);


	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>