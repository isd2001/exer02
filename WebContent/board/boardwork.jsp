<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="beans.mybatisDAO"%>
<%@page import="java.util.*" %>
<%@page import="java.io.File"%>
<%@ page import="com.oreilly.servlet.multipart.Part"%>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/layout/top.jspf"%>
<%
	String logid = (String)session.getAttribute("logid");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	mybatisDAO dao = new mybatisDAO();
	Map map = new HashMap();
	
	map.put("logid", logid);
	map.put("title", title);
	map.put("content", content);
	
	int r=dao.addboardResult(map);
	
	
	
	
	if(r==1){
		%>
		<p style="font-size: 16px; padding: 5px">
			정상적으로 완료 되었습니다.
		</p>
		<%
	}else{%>
		<p style="font-size: 16px; padding: 5px">
			처리 실패 하였습니다. 다시 한번 해주세요.
		</p>
		<%
	}
	%>	
	<a href="<%= application.getContextPath() %>/board/mainboard.jsp">
	<button type="submit" style="font-size: 16px; padding: 5px; text-align: center;">게시판목록</button>
	</a>
	<a href="<%= application.getContextPath() %>/index.jsp">
	<button type="submit" style="font-size: 16px; padding: 5px; text-align: center;">메인페이지</button>
	</a>
	
<%@ include file="/layout/bottom.jspf"%>
