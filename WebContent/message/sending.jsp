<%@page import="java.util.UUID"%>
<%@page import="beans.MessageDAO"%>
<%@ page import="java.text.*" %>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String serial = UUID.randomUUID().toString().split("-")[0];
	String logid =request.getParameter("logid");
	String receiverid = request.getParameter("receiverid");
	String sendmessage = request.getParameter("sendmessage");
	Date senddate= new Date(System.currentTimeMillis());
	//SimpleDateFormat sdf = new SimpleDateFormat("HH:mm MM.dd.YYYY");
	MessageDAO dao = new MessageDAO();
	int r=dao.messageroom(serial,logid, receiverid, sendmessage, senddate);
	System.out.println(r);
%>
<%@ include file="/layout/top.jspf"%>
	<% if(r==1){ %>
	<p>
		메세지를 정상적으로 보냈습니다.
	</p>
	<%}else{ %>
	<p>
		메세지가 정상적으로 발신이 안됬습니다.
	</p>
	<%} %>

<%@ include file="/layout/bottom.jspf"%>