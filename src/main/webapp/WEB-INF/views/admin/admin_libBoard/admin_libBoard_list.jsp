<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!-- admin_libBoard_list.jsp -->

<%@ include file="../admin_top.jsp" %>

<h1>도서 공지</h1>

<div align="right">
	<button onclick="location.href='admin_libboard_insert.do'">새 공지 작성</button>
	<br>
</div>

<table border="1">
	<tr>
		<th>제목</th>
		<th>작성자</th>
		<th>작성일</th>
		<th>조회수</th>
		<th>수정|삭제</th>
	</tr>
	
	<c:if test="${list != null || list.size() != 0}">
		<c:forEach var="ldto" items="${list}">
			<tr align="center">
				<td>${ldto.subject}</td>
				<td>${ldto.writer}</td>
				<td>${ldto.regdate}</td>
				<td>${ldto.readcount}</td>
				<td>
					<a href="admin_libboard_edit.do?lib_board_code=${ldto.lib_board_code}">수정</a>
					|
					<a href="admin_libboard_del.do?lib_board_code=${ldto.lib_board_code}">삭제</a>
				</td>
			</tr>
		</c:forEach>
	</c:if>
	
	<c:if test="${list == null || list.size() == 0}">
		<tr>
			<td colspan="5"><h1 align="center">등록된 강의가 없습니다</h1></td>
		</tr>
	</c:if>
	
	<tr align="center">
		<td colspan="5">
			<c:forEach begin="1" end="${pageCount}" var="i">
				<a href="admin_libboard_list.do?page=${i}"><font size="3">[${i}]</font></a>	
			</c:forEach>
		</td>
	</tr>
	
</table>

<div align="right">
	<form name="searchLibBoard" action="admin_libboard_list.do" method="post">
		<select name="search">
			<option value="all">전체보기</option>
			<option value="subject">제목</option>
			<option value="writer">작성자</option>
		</select>
		<input type="submit" value="검색"/>
	</form>
</div>
					
<%@ include file="../admin_bottom.jsp" %>