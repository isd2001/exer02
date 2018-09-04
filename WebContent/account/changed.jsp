<%@page import="beans.AccountDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%	
	String pass=request.getParameter("pass");
	String cpass1=request.getParameter("cpass1");
	String cpass2=request.getParameter("cpass2");
	String logid = (String) session.getAttribute("logid");
	String logpass = (String)session.getAttribute("logpass");
	String mode = request.getParameter("mode");
	
	AccountDao dao = new AccountDao();
	if(cpass1 ==cpass2 || cpass1.length() < 4 || cpass2.length() < 4 ){
		response.sendRedirect(application.getContextPath() + "/account/change.jsp?mode=fail");
	}else{
		int r=dao.setOnesPass(logid, cpass1);
		if(r==1){
		session.invalidate();
		Thread.sleep(2000);
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
		<p>비밀번호 변경에 성공을 하셨습니다.</p>
		<p>
			<button type="submit" style="font-size: 16px; padding: 5px">다 시 로 그 인</button>
		</p>
</body>
</html>
<%
	}
%>
<%
	}
%>
