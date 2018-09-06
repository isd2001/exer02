<%@page import="java.util.logging.SimpleFormatter"%>
<%@page import="beans.mybatisDAO"%>
<%@page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/layout/top.jspf"%>
<%
	mybatisDAO dao = new mybatisDAO();
	List<Map> list=dao.getAllboard();
	SimpleDateFormat sdf = new SimpleDateFormat("MM.dd HH:mm");
%>
<h2>게 시 판</h2>
	<p>
	<%if(list==null || list.size()==0){ 
	%>
	<b style="font-size: 16px; padding: 5px">현재 게시된 내용이 없습니다.</b>
	</p>
	<%}else{ %>
	<p>
	<% 
		for(int i=0;i<list.size();i++){
			Map map=list.get(i);%>
	
	<%	
			Number no =(Number)map.get("NO");
			String writer=(String)map.get("WRITER");
			String title=(String)map.get("TITLE");
			Number good=(Number)map.get("GOOD");
				int it=good.intValue();
			Date c=(Date)map.get("LEFTDATE");
			
	%>
		<h4 style="text-align: left;">
		# <%=no %>  |  아이디 : <%=writer %> 
		<a href="<%=application.getContextPath()%>/board/view.jsp?NO=<%=map.get("NO")%>"> | &nbsp; <%=title %></a> 	
		<p style="text-align: right;"><small> 추천:<%=good %> | <%=sdf.format(c) %></small>
		<hr/>
		</h4>
		</p>
	<%} 
	}	
	%>

<p style="text-align: right;">
	<a href="<%= application.getContextPath() %>/board/newboard.jsp">
	<button type="submit" style="font-size: 16px; padding: 5px;">글 작성</button>
	</a>
</p>


<%@ include file="/layout/bottom.jspf"%>