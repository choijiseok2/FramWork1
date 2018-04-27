<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="./boardError.jsp" %>
<%@ page import="member.model.vo.Member, board.model.vo.Board, java.util.ArrayList, java.sql.Date" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardListView</title>
<script type="text/javascript">
	function showWriteForm(){
		location.href = "views/board/boardWriteForm.jsp";
	}
</script>
</head>
<body>
<%@ include file="../../header.jsp" %>
<hr style="clear:both;">
<h2 align="center">게시글 목록</h2>
<h4 align="center">총 게시글 갯수 : ${listCount}</h4>
<c:if test="${!empty sessionScope.loginUser }">
<div style="align:center; text-align:center;">
	<button onclick="showWriteForm();">글쓰기</button>
	</div>
</c:if>
${SessionScope.loginUser }
<br>
<table align="center" border="1" cellspacing="0" width="700">
<tr><th>번호</th><th>제목</th><th>작성자</th><th>날짜</th>
<th>조회수</th><th>첨부파일</th></tr>


<c:forEach items="${list}" var="li"> 
<tr>
<td align="center">	${li.boardNum} </td>
<td>
<!-- 댓글일때는 제목을 들여쓰기함 -->


<c:if test="${li.boardLevel == 1}">
&nbsp; &nbsp; ▶
</c:if>
<c:if test="${li.boardLevel == 2}">
&nbsp; &nbsp; &nbsp; &nbsp; ▶▶
</c:if>

<!-- 로그인한 상태일 때만 상세보기 링크 처리함 -->

<c:if test="${!empty loginUser}">
	<a href="/first/bdetail?bnum=${li.boardNum}&page=${currentPage}" >
	${li.boardTitle}
	</a>
</c:if>

<c:if test="${empty loginUser}">
	${li.boardTitle}
</c:if>

</td>
<td align="center">${li.boardWriter }</td>
<td align="center">${li.boardDate }</td>
<td align="center">${li.boardReadCount }</td>
<td align="center">
<c:if test="${!empty li.boardOriginalFileName }">
	◎
</c:if>
<c:if test="${empty li.boardOriginalFileName }">
&nbsp;없음
</c:if>

</td>
</tr>

</c:forEach>
</table>
<br>
  
<!-- 페이징 처리 -->

<div style="text-align:center;">


<%if((int)request.getAttribute("currentPage")<=1){ %>
[맨처음]&nbsp;
<%}else{ %>
<a href="/first/blist?page=1">[맨처음]</a>
<%} %>

<c:if test="${(currentPage - 10) < startPage and (currentPage - 10) > 1 }" >
<a href="/first/blist?page=${startPage - 10}">[prev]</a>	
</c:if>

<c:if test="${not((currentPage - 10) < startPage and (currentPage - 10) > 1)}" >
[prev]&nbsp;
</c:if>

<!-- 현재 페이지가 포함된 그룹의 페이지 숫자 출력 -->



<c:forEach begin="${startPage}"  end="${endPage}" var="p"> 
<c:if test="${p==currentPage}" >
	<font color="red" size="4"><b>[ ${p} ]</b></font>
</c:if>
<c:if test="${not(p==currentPage) }" >
	<a href="/first/blist?page=${p}">${p}</a>
</c:if>

</c:forEach>


<c:if test="${(currentPage + 10) > endPage 
		and (currentPage + 10) < maxPage }">
<a href="/first/blist?page=${endPage + 10 }">[next]</a>	
</c:if>
<c:if test="${not((currentPage + 10) > endPage and (currentPage + 10) < maxPage) }">
[next]&nbsp;
</c:if>


<c:if test="${currentPage >= maxPage} ">
[맨끝]&nbsp;
</c:if>

<c:if test="${not(currentPage >= maxPage)}">
<a href="/first/blist?page=${maxPage}">[맨끝]</a>
</c:if>




</div>
<hr>
<c:import url="../../footer.html"></c:import>
</body>
</html>








