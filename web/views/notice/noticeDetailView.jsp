<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "notice.model.vo.Notice, member.model.vo.Member" %>
<% 
	Notice notice = (Notice)request.getAttribute("notice");
	Member loginUser = (Member)session.getAttribute("loginUser");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>noticeDetailView</title>
<script type="text/javascript">
	function movePage() {
		location.href = "/first/nupview?no=" + <%= notice.getNoticeNo() %>;
		
		return false;
	}
	
	function deleteNotice() {
		location.href = "/first/ndel?no=" + <%= notice.getNoticeNo() %>;
		
		return false;
	}
</script>
</head>
<body>
<%@ include file="../../header.jsp" %>
<hr style="clear:both;">
<br>
<h2 align="center"><%= notice.getNoticeNo() %>번 공지글 상세보기</h2>
<br>
	<table align="center" width="600">
		<tr>
			<th>제목</th>			
			<td><%= notice.getNoticeTitle() %></td>			
		</tr>
		<tr>
			<th>작성자</th>			
			<td><%= notice.getNoticeWriter() %></td>			
		</tr>
		<tr>
			<th>첨부 파일</th>
			<td>
				<% if(notice.getOriginalFilePath() != null) { %>
					<a href = "/first/fdown?ofile=<%= notice.getOriginalFilePath() %>&rfile=<%= notice.getRenameFilePath() %>">
					<%= notice.getOriginalFilePath() %>
					</a>
				<% } else { %>
					첨부 파일 없음
				<% } %>
			</td>
		</tr>
		<tr>
			<th>내 용</th>			
			<td><%= notice.getNoticeContent() %></td>			
		</tr>
		<tr>
			<th colspan = "2">
			<% if(loginUser.getUserId().equals(notice.getNoticeWriter())) { %>
				<button onclick = "movePage();">수정페이지로 이동</button> &nbsp;		
				<button onclick = "deleteNotice();">글 삭제</button> &nbsp;
			<% } %>
				<button onclick = "history.go(-1); return false;">이전 페이지로 이동</button>				
			</th>
		</tr>
	</table>

<hr>
<%@ include file="../../footer.html" %>
</body>
</html>