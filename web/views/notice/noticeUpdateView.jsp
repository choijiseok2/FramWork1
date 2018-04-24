<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
 <%@ page import = "notice.model.vo.Notice" %>  
<% 
	Notice notice = (Notice)request.getAttribute("notice");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>noticeUpdateView</title>
</head>
<body>
<%@ include file="../../header.jsp" %>
<hr style="clear:both;">
<br>
<h2 align="center"><%= notice.getNoticeNo() %>번 공지글 수정 페이지</h2>
<br>
	<form action="/first/nupdate" method="post" enctype="multipart/form-data">
	<input type = "hidden" name="no" value="<%= notice.getNoticeNo() %>">
	<input type = "hidden" name="ofile" value="<%= notice.getOriginalFilePath() %>">
	<input type = "hidden" name="rfile" value="<%= notice.getRenameFilePath() %>">
	<table align="center" width="600">
		<tr>
			<th>제목</th>			
			<td><input type="text" name="title" size="60" value="<%= notice.getNoticeTitle() %>"></td>			
		</tr>
		<tr>
			<th>작성자</th>				
			<td><input type="text" name="writer" size="60" value="<%= notice.getNoticeWriter() %>" readonly></td>			
		</tr>
		<tr>
			<th>첨부 파일</th>
			<td id="fileTD"><%= notice.getOriginalFilePath() %> &nbsp;
			<input type="button" onclick = "return addFile();" value="첨부 파일 변경">
			<script type="text/javascript">
				function addFile() {
				var fileTD = document.getElementById("fileTD");
				var addHtml = "<input type='file' name = 'upfile'>";
				fileTD.innerHTML = fileTD.innerHTML +"<BR>"+ addHtml;
		
				return false;			
			}
		</script>
			</td>
		</tr>
		<tr>
			<th>내 용</th>
			<td><textarea rows="5" cols="50" name="content"><%= notice.getNoticeContent() %></textarea></td>					
						
		</tr>
		<tr>
			<th colspan = "2">
				<input type="submit" value="수정하기"> &nbsp;				
				<button onclick = "history.go(-1); return false;">이전 페이지로 이동</button>				
			</th>
		</tr>
	</table>
	</form>
<hr>
<%@ include file="../../footer.html" %>
</body>
</html>