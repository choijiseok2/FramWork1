<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.model.vo.Board" %>
<%
	Board board = (Board)request.getAttribute("board");
	int currentPage = ((Integer)request.getAttribute("page")).intValue();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardUpdateView</title>
</head>
<body>
<%@ include file="../../header.jsp" %>
<hr style="clear:both;">
<h2 align="center">
<%= board.getBoardNum() %>번 게시글 수정페이지</h2>
<br>
<% if(board.getBoardLevel() == 0){ //원글 수정 %>
<form action="/first/boriginup" method="post" 
	enctype="multipart/form-data">
<input type="hidden" name="bnum" value="<%= board.getBoardNum() %>">
<input type="hidden" name="page" value="<%= currentPage %>">
<input type="hidden" name="ofile" 
	value="<%= board.getBoardOriginalFileName() %>">	
<input type="hidden" name="rfile" 
	value="<%= board.getBoardRenameFileName() %>">
<table align="center">
<tr><th>제 목</th>
<td><input type="text" name="btitle" 
	value="<%= board.getBoardTitle() %>"></td></tr>
<tr><th>작성자</th>
<td><input type="text" name="bwriter" readonly 
	value="<%= board.getBoardWriter() %>"></td></tr>
<tr><th>첨부파일</th>
<td>
	<% if(board.getBoardOriginalFileName() != null){ %>
		<%= board.getBoardOriginalFileName() %> <br>
	<% } %>
	<input type="file" name="upfile">
</td></tr>
<tr><th>내용</th>
<td><textarea rows="7" cols="50" name="bcontent"><%= board.getBoardContent() %></textarea></td></tr>
<tr><th colspan="2">
	<input type="submit" value="수정하기">
</th></tr>
</table>
</form>
<% }else{ //댓글 수정 %>
<form action="/first/breplyup" method="post">
<input type="hidden" name="bnum" value="<%= board.getBoardNum() %>">
<input type="hidden" name="page" value="<%= currentPage %>">
<table align="center">
<tr><th>제 목</th>
<td><input type="text" name="btitle" 
	value="<%= board.getBoardTitle() %>"></td></tr>
<tr><th>작성자</th>
<td><input type="text" name="bwriter" readonly 
	value="<%= board.getBoardWriter() %>"></td></tr>
<tr><th>내 용</th>
<td><textarea rows="7" cols="50" name="bcontent"><%= board.getBoardContent() %></textarea></td></tr>
<tr><th colspan="2">
<input type="submit" value="수정하기">
</th></tr>
</table>
</form>
<% } %>
<br>
<h4 align="center"><a href="/first/blist?page=<%= currentPage %>">목록</a></h4>
<hr>
<%@ include file="../../footer.html" %>
</body>
</html>












