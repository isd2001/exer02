<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/layout/top.jspf"%>
<h2>게 시 판</h2>




<p>
	<a href="<%= application.getContextPath() %>/board/newboard.jsp">
	<button type="submit" style="font-size: 16px; padding: 5px; text-align: right;">글 작성</button>
	</a>
</p>


<%@ include file="/layout/bottom.jspf"%>