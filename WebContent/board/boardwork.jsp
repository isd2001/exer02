<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="beans.mybatisDAO"%>
<%@page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String writer = request.getParameter("writer");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	System.out.println("writer>"+writer+"/ title >"+title+"/ content >"+content);
	
	

	mybatisDAO dao = new mybatisDAO();
	Map map = new HashMap();
	
	map.put("writer", writer);
	map.put("title", title);
	map.put("content", content);
	
	int r=dao.addboardResult(map);
	
	out.println(r);
	if(r==1){
		out.println("성공");
		
	}else{
		out.println("실패");
	}
	
	
	%>	

