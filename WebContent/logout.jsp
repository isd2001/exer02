<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%
	// 쿠키로 인증유지 시켜둔 기능을 구현했을때 유지해제를 사용자에게 제공하고 싶으면
	// 해당 쿠키를 삭제해야된다. 이걸 명령을 통해서 브라우저 쿠키함을 비우게 하는건 없고
	
	Cookie c = new Cookie("freepass","bomb");
	c.setPath(application.getContextPath());
	c.setMaxAge(0);			// maxAge 0초로 설정해서 같은 이름으로 설정해서 보낸다.
	response.addCookie(c);	// 기존 쿠키를 시간이 다되게 해서 없앤다.
	
	session.invalidate();
	Thread.sleep(2000);
	response.sendRedirect(application.getContextPath()+"/login.jsp");

%>