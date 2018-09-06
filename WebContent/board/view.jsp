<%-- 특정 키에 해당하는 데이터 출력 --%>
<%@page import="beans.mybatisDAO"%>
<%@ page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String no= request.getParameter("NO");
	
	mybatisDAO dao = new mybatisDAO();
	Map map=dao.getOneView(no);
	session.setAttribute("no", map.get("NO"));
%>
<%@ include file="/layout/top.jspf"%>
<h2>상세 보기</h2>
	<% if(map==null){ %>
	<p>
		ERROR 가 발생하였습니다.
	</p><%}else {%>
	<p style="text-align: center;">
		<%=map.get("TITLE") %>
	</p>
	<p style="text-align: right;">
		<small><i>#</i> <%=map.get("NO") %> / <i>작성자</i> <%=map.get("WRITER") %> / <i>작성일</i> <%=map.get("LEFTDATE") %>  / <i>추천</i> <%=map.get("GOOD") %></small>
	</p>
	<hr/>
	<p style="text-align: left; min-height: 300px; font-size: smaller; "> 
		<%= ((String)map.get("CONTENT")).replace("\n", "<br/>") %>
	</p>
	<hr/>
	<p style="text-align: right;">
	<a href="<%= application.getContextPath() %>/board/goodwork.jsp">
	<button type="submit">추천</button></a>
	
	<a href="<%= application.getContextPath() %>/board/newboard.jsp">
	<button type="submit">글 쓰 기</button></a>
	</p>
	
	<%} %>
	




<%@ include file="/layout/bottom.jspf"%>