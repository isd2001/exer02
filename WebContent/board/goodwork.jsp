<%@page import="beans.mybatisDAO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/layout/top.jspf"%>
<%
	String logid=(String)session.getAttribute("logid");
	Number no=(Number)session.getAttribute("no");
	
	Map m = new HashMap();
	m.put("logid",logid);
	m.put("no",no);
	
	mybatisDAO dao = new mybatisDAO();
	int a=dao.addGoodlog(m);
	
	if(a==1){
		int u=dao.upGoodByNo(String.valueOf(no));
		if(u==1){
			response.sendRedirect(application.getContextPath()+"/board/view.jsp?NO="+String.valueOf(no));
		}
	}else{%>
	<p style="font-size: 16px; padding: 5px">	
			중복 추천은 허용되지 않습니다.<br/>
			<button type="button"><a href="<%=application.getContextPath()%>/board/mainboard.jsp">게시판</a></button>
		</p>
		<%
	}
%>




<%@ include file="/layout/bottom.jspf"%>