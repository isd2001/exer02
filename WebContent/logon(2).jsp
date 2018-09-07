<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page errorPage="/error/default.jsp"%>
<%@ page import="beans.*"%>
<%@ page import="java.util.*"%>
<%
	String logid = request.getParameter("logid");
	String logpass = request.getParameter("logpass");

	AccountDao dao = new AccountDao();

	Map acc = dao.getAccountById(logid);
	if (acc == null || !acc.get("pass").equals(logpass)) {
		response.sendRedirect(application.getContextPath() + "/login.jsp?mode=fail");
	} else {
		Set set = (Set) application.getAttribute("user");
		if (set.contains(logid)) {
			throw new RuntimeException(logid+" is alreay logon");
		} else {
			set.add(logid);
			session.setAttribute("auth", true);
			session.setAttribute("logid", logid);
			session.setAttribute("logpass", logpass);

			LoginLogDao ldao = new LoginLogDao();
			Map log = ldao.getLatesetLogById(logid);
			if (log != null) {
				session.setAttribute("latest", log.get("time"));
			}
			ldao.addLog(logid);
			
			String target=(String)session.getAttribute("target");
			System.out.println(target);
			if(target==null){
				response.sendRedirect(application.getContextPath()+"/");			
			}else{
				response.sendRedirect(target);
			}
			
			
			
			
		}
	}
	%>
