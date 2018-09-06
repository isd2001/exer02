<%@page import="beans.mybatisDAO"%>
<%@page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/layout/top.jspf"%>
<%
	mybatisDAO dao = new mybatisDAO();
	List<Map> list=dao.getAllboard();
	
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
	<a href="<%=application.getContextPath()%>/board/view.jsp?NO=<%=map.get("NO")%>">
	<%
			
			Number no =(Number)map.get("NO");
			String writer=(String)map.get("WRITER");
			String title=(String)map.get("TITLE");
			Number good=(Number)map.get("GOOD");
				int it=good.intValue();
			Date leftdate=(Date)map.get("LEFTDATE");
			
	%>
		<b style="font-size: 14px; padding: 5px">
		<%=no %> | <%=writer %> | <%=title %> | <small> <%=good %> | <%=leftdate %></small><br/>
		</b>
	</a>
	<%} 
	}
	
	%>
	

<p>
	-------------------------------------------------<br/>
	<a href="<%= application.getContextPath() %>/board/newboard.jsp">
	<button type="submit" style="font-size: 16px; padding: 5px; text-align: right;">글 작성</button>
	</a>
</p>


<%@ include file="/layout/bottom.jspf"%>