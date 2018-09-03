<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/layout/top.jspf"%>
	<form method="post">
	<p>
		받을사람(*)<br/>
		<input type="text" name="receiverid" placeholder="write a receiver" style="width:220px; padding: 5px"/>
	</p>
	<p>
		보낼내용(*)<br/>
		<textarea name="sendmessage" style="height: 300px; width: 220px; padding: 5px; resize: none; font-family: inherit;"
			placeholder="write a message"></textarea>
	</p>

	<button type="submit">메세지 전송</button>
	</form>

<%@ include file="/layout/bottom.jspf"%>