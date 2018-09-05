<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/layout/top.jspf"%>
	<h2>새 글</h2>

	<form action="<%=application.getContextPath() %>/board/boardwork.jsp" method="post" enctype="multipart/form-data">
	<p>
		<b>작성자</b> 
		<input type="text" style="font-size: 16px; padding: 5px" name="writer" />
	</p>
	<p>
		<b>글제목</b> 
		<input type="text" style="font-size: 16px; padding: 5px" name="title" />
	</p>
	<p>
		<b>내용</b> 
		<textarea name="content" style="height: 300px; width: 220px; padding: 5px; resize: none; font-family: inherit;"
			placeholder="write a message"></textarea>
	</p>
	<p>
		<b> 파일올리기  </b><input type="file" name="attach"/><br/>
	</p>
	<p>
	<button type="submit">글 올리기</button>
	</p>






	</form>

<%@ include file="/layout/bottom.jspf"%>