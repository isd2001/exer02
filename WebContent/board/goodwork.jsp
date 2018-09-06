<%@page import="beans.mybatisDAO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/layout/top.jspf"%>
<%
	String logid=(String)session.getAttribute("logid");
	Number no=(Number)session.getAttribute("no");
	
	
	
	System.out.println("logid > "+logid+" / no > "+no+" / sno >"+String.valueOf(no));
	
	Map m = new HashMap();
	m.put("logid",logid);
	m.put("no",no);
	
	mybatisDAO dao = new mybatisDAO();
	int a=dao.addGoodlog(m);
	System.out.println("ok");
	int u=dao.upGoodByNo(String.valueOf(no));
	System.out.println("okk");
	System.out.println("a >"+a+" / u > "+u);
	if(a==1){
		System.out.println("okkk");
		if(u==1){
			System.out.println("okkkk");
			response.sendRedirect(application.getContextPath()+"/board/view.jsp?NO="+String.valueOf(no));
		}%>
		
		
		<%
	}else{%>
	<p style="font-size: 16px; padding: 5px">	
			중복 추천은 허용되지 않습니다.
			<button type="button"><a href="<%=application.getContextPath()%>/board/mainboard.jsp">게시판</a></button>
		</p>
		<%
	}
%>




<%@ include file="/layout/bottom.jspf"%>