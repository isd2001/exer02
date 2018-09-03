<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	response.setStatus(200);
	String mode = request.getParameter("mode");
%>
<%@ include file="/layout/top.jspf"%>
<h1>비밀번호 변경</h1>  
<p style="font-size: small;">
	해당 사용자 계정의 비밀번호를 변경합니다.<br/>
	현재 사용중인 비밀번호와 변경하실 비밀번호를 입력후<br/>
	변경 적용 을 눌러주십시오. 
</p>
<form action="<%=application.getContextPath() %>/account/changed.jsp" method="post" autocomplete="off">
	<p>
		<b>기존 비밀번호(*)</b> <br/>
		<input type="password" style="font-size: 16px; padding: 5px" name="pass" placeholder="old password"/>
	</p>
	<p>
		<b>새로운 비밀번호(*)</b> <br/>
		<input type="password" style="font-size: 16px; padding: 5px" name="cpass1" placeholder="new password"/>
	</p>
	<p>
		<b>비밀번호 재확인(*)</b><br/>
		<input type="password" style="font-size: 16px; padding: 5px" name="cpass2" placeholder="password confirm"/>
	</p>
	<% if(mode!=null && mode.equals("fail")){ %>
	<p style="color: red; font-size: small;">
		비밀번호 확인을 다시하세요.
	</p>
	<%} %>
	<p>
		<button type="submit" style="font-size: 16px; padding: 5px">변 경 적 용</button>
	</p>
</form>
<%@ include file="/layout/bottom.jspf"%>