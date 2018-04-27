<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage = "./noticeError.jsp"%>
<%@ page import = "notice.model.vo.Notice, java.util.*, member.model.vo.Member" %>

<% 
	List<Notice> list = (List<Notice>)request.getAttribute("noticeList");
	Member loginUser = (Member)session.getAttribute("loginUser");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>noticeListView</title>
	<style type="text/css"></style>
	<script type="text/javascript">
		function moveWritePage() {
			//글쓰기 버튼을 클릭하면 notiveWriteForm.jsp 파일로 페이지 이동함
			location.href = "/first/views/notice/noticeWriteForm.jsp";			
		}
	</script>
</head>
<body>
<%@ include file="../../header.jsp" %>
<hr style="clear:both;">
<br>
<h2 align="center">공지글 전체 목록</h2>

<% if(loginUser != null) { %>
	<button id = "writeBtn" onclick="moveWritePage();">글쓰기</button>
<% } else { %>
	<button disabled>글쓰기</button>
<% } %>
<table align="center" width="650" cellspacing="0" border="1">
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>날짜</th>
		<th>첨부파일</th>
	</tr>
	<% for( Notice n : list ) { %>
		<tr>
			<td align = "center"><%= n.getNoticeNo() %></td>
			<td align = "center">
			
			<a href = "/first/ndetail?no=<%= n.getNoticeNo() %>" style = "text-decoration : hand"
			><%= n.getNoticeTitle() %></a>			
			
			</td>
			<td align = "center"><%= n.getNoticeWriter() %></td>
			<td align = "center"><%= n.getNoticeDate() %></td>
			<td align = "center">
			<% if(n.getOriginalFilePath() != null) { %>
				◎
			<% } else { %>
				&nbsp;
			<% } %>
			</td>
		</tr>
	<% } %>
</table>
<%@ include file="../../footer.html" %>
</body>
</html>