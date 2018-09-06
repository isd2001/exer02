<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page errorPage="/join.jsp" %>
<%@ page import="java.text.*" %>
<%@ page import="java.sql.*" %>
<%
	if(session.getAttribute("auth")==null){
		throw new RuntimeException();
	}
	SimpleDateFormat sdf = new SimpleDateFormat("HH:mm MM.dd.YYYY");
	String logid =(String)session.getAttribute("logid");
	Date latest =(Date)session.getAttribute("latest");
%>
<%@ include file="/layout/top.jspf"%>
<p style="text-align: right;">
	〔<b><%=logid %></b>, <small>마지막로그인 : <%=latest==null ? "-": sdf.format(latest) %></small>〕	
</p>
<p style="text-align: center;">
	<a href="<%=application.getContextPath()%>/board/mainboard.jsp"><button type="button">게시판</button></a>
	<a href="<%=application.getContextPath()%>/message/mailbox.jsp"><button type="button">메일함</button></a>
	<a href="<%=application.getContextPath()%>/message/send.jsp"><button type="button">메서지보내기</button></a>
	<a href="<%=application.getContextPath()%>/account/change.jsp"><button type="button">비밀번호변경</button></a>	
	<a href="<%=application.getContextPath()%>/logout.jsp"><button type="button">로그아웃</button></a>	
</p>
<p>
	<img src="<%=application.getContextPath()%>/image/1.PNG" style="width: 20%; border-radius: 30px"/>
	<img src="<%=application.getContextPath()%>/image/2.png" style="width: 20%; border-radius: 30px"/>
	<img src="<%=application.getContextPath()%>/image/3.PNG" style="width: 20%; border-radius: 30px"/>
	<img src="<%=application.getContextPath()%>/image/4.PNG" style="width: 20%; border-radius: 30px"/>
</p>
<%@ include file="/layout/bottom.jspf"%>