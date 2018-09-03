<%@page import="beans.AccountDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String cpass1=request.getParameter("cpass1");
	String cpass2=request.getParameter("cpass2");
	String logid = (String) session.getAttribute("logid");
	System.out.println(cpass1+".."+cpass2+".."+logid);
	
	AccountDao dao = new AccountDao();
	
	int r= dao.setOnesPass(logid, cpass1);
	
	if(!cpass1.equals(cpass2)||r==-1){
		response.sendRedirect(application.getContextPath()+"/change.jsp?mode=fail");
	}else{
		%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body style="text-align: center;">
	<h1>비밀번호변경 성공</h1>
	<form action="<%=application.getContextPath() %>/login.jsp" m
	ethod="post" autocomplete="off">
	<p>
		비밀번호 변경에 성공을 하셨습니다.
	</p>
	<p>
		<button type="submit" style="font-size: 16px; padding: 5px">다 시 로 그 인</button>
	</p>
</body>
</html>		
		<%
	}
%>
