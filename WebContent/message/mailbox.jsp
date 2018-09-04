<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Date"%>
<%@page import="beans.MessageDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/layout/top.jspf"%>
<%	
	String logid=(String)session.getAttribute("logid");
		
	MessageDAO dao= new MessageDAO();
	List<Map<String, String>> mail =dao.sendmessage(logid);
	System.out.println("mail>>" + mail);
	String sender ;
	String content ;
	String senddate ;%>
	<p>
	<%
	for(int i=0;i<mail.size();i++){
		Map<String,String> map = mail.get(i);
		sender= map.get("sender");%>
		<%=sender %>
		<%
		content = map.get("content");%>
		<%=content %>
		<%
		senddate = map.get("senddate"); %>
		<%=senddate%><br/>
		<%
	}
	
%>
======================================
</p>


<%@ include file="/layout/bottom.jspf"%>