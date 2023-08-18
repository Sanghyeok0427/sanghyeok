<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../top.jsp" %>
<div align="center">
		<b>글 목 록</b>
		<table border="0" width="70%">
			<tr bgcolor="yellow">
				<td align="right"><a href="admin_write_qna_board.do">글쓰기</a></td>
			</tr>
		</table>
		<table border="1" width="70%">
			<tr bgcolor="green">
				<th>번호</th>
				<th width="40%">제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>이미지</th>
				<th>조회</th>
				<th>IP</th>
			</tr>
			<c:if test="${mode =='find'}">
				<tr>
					<c:if test="${empty find}">
					<c:if test="${empty listQnaBoard}">
						<td colspan="7">등록된 글이 없습니다.</td>
					</c:if>
					</c:if>
				</tr>
			</c:if>
			
			<c:forEach var="dto" items="${listQnaBoard}">
				<tr>
					<td>${dto.major_qna_board_code}</td>
					
				<td>
				<c:if test="${dto.re_level > 0}">
					<img src="resources/img/level.gif" width="${dto.re_level*10}">
					<img src="resources/img/re.gif">
				</c:if>
				<c:if test="${dto.secret eq true }">
							<a href="admin_content_qna_board.do?major_qna_board_code=${dto.major_qna_board_code}">🔒${dto.subject }</a> 
					<c:if test="${dto.readcount > 10}">
						<img src="resources/img/hot.gif">
					</c:if>
				</c:if>
				<c:if test="${dto.secret != true }">
					<a href="admin_content_qna_board.do?major_qna_board_code=${dto.major_qna_board_code}">${dto.subject }</a>
				</c:if>
			</td>
					<td>${dto.writer}</td>
					<td>${dto.reg_date}</td>
				<c:if test="${dto.secret != true }">
					<td><img src="${path}/${dto.image}" width="30" height="30"></td>
				</c:if>
				<c:if test="${dto.secret eq true }">
					<td><img src="resources/img/level.gif" width="30" height="30"></td>
				</c:if>
					<td>${dto.readcount}</td>
					<td>${dto.ip}</td>
				</tr>
			</c:forEach>
			<c:forEach var="dto" items="${find }">
				<tr>
					<td>${dto.major_qna_board_code}</td>
					<td><a
						href="admin_content_qna_board.do?major_qna_board_code=${dto.major_qna_board_code}">${dto.subject}</a>
						<c:if test="${dto.readcount > 10}">
							<img src="resources/img/hot.gif">
						</c:if></td>
					<td>${dto.writer}</td>
					<td>${dto.reg_date}</td>
					<td><img src="${path}/${dto.image}" width="30" height="30"></td>
					<td>${dto.readcount}</td>
					<td>${dto.ip}</td>
				</tr>
			</c:forEach>
		</table>
		<form name="f" action="admin_find_major_qna_board.do" method="post">
			<select name="search">
				<option value="subject">제목</opiton>
				<option value="writer">작성자</option>
			</select> <input type="text" name="searchString"> <input type="submit"	value="찾기">
		</form>
		<c:if test="${count>0}">
			<c:if test="${startPage > pageBlock}">
			[<a href="admin_qnaBoard.do?pageNum=${startPage-pageBlock}">이전</a>]
		</c:if>
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
			[<a href="admin_qnaBoard.do?pageNum=${i}">${i}</a>]
		</c:forEach>
			<c:if test="${endPage < pageCount}">
			[<a href="admin_qnaBoard.do?pageNum=${startPage+pageBlock}">다음</a>]
		</c:if>
		</c:if>
	</div>
<%@ include file="../bottom.jsp" %>