<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../top.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div align="center">
	<table border="1" width="50%">
		<tr>
			<th bgcolor="yellow" width="20%">글번호</th>
			<td align="center" width="30%">${getBoard.major_board_code}</td>
			<th bgcolor="yellow" width="20%">조회수</th>
			<td align="center" width="30%">${getBoard.readcount}</td>
		</tr>
		<tr>
			<th bgcolor="yellow" width="20%">작성자</th>
			<td align="center" width="30%">${getBoard.writer}</td>
			<th bgcolor="yellow" width="20%">작성일</th>
			<td align="center" width="30%">${getBoard.reg_date}</td>
		</tr>
		<tr>
			<th bgcolor="yellow" width="20%">글제목</th>
			<td align="center" width="80%" colspan="3">${getBoard.subject}</td>
		</tr>
		<tr>
			<th bgcolor="yellow" width="20%">이미지</th>
			<td align="center" width="80%" colspan="3"><img
				src="${path}/${getBoard.image}" width="100" height="100">
				<input type="hidden" name="image" value="${getBoard.image }"></td>
		</tr>
		<tr>
			<th bgcolor="yellow" width="20%">글내용</th>
			<td width="80%" colspan="3">${getBoard.content}</td>
		</tr>
		<c:forEach var="dto" items="${listFile}">
		<tr>
			<th bgcolor="yellow" width="20%">첨부파일</th>
			<td width="80%" colspan="3"><a href="admin_majorBoard_download.do?major_board_code=${getBoard.major_board_code }&name=${dto.save_name}" >${dto.original_name }</a><br>
			size : ${dto.filesize }</td>
		</tr>
		</c:forEach>
		<tr bgcolor="yellow">
			<td align="right" colspan="4">
			<input type="button" value="글수정"
				onclick="window.location='admin_update_major_board.do?major_board_code=${getBoard.major_board_code}'">
				&nbsp&nbsp&nbsp&nbsp <input type="button" value="글삭제"
				onclick="window.location='admin_delete_major_board.do?major_board_code=${getBoard.major_board_code}&image=${getBoard.image }'">
				&nbsp&nbsp&nbsp&nbsp
				<input type="button" value="글목록"
				onclick="window.location='admin_majorBoard.do'"></td>
		</tr>
	</table>	
</div>	
		<!--  댓글 시작 -->

	<div id="reply">
		<ol class="replyList">
			<c:forEach items="${replyList}" var="replyList">
				<li>
					<p>
						작성자 : ${replyList.writer}<br /> 작성 날짜 :
						<fmt:formatDate value="${replyList.reg_date}" pattern="yyyy-MM-dd" />
					</p>

					<p>${replyList.content}</p>
					<div>
						<input type="button" value="수정" onclick="window.location='admin_update_reply_mb.do?rno=${replyList.rno}&major_board_code=${getBoard.major_board_code }'"/>
						<input type="button" value="삭제" onclick="window.location='admin_delete_reply_mb.do?rno=${replyList.rno}&major_board_code=${getBoard.major_board_code }'"/>
					</div>
				</li>
			</c:forEach>
		</ol>
	</div> 
	<form name="f" action="admin_major_board_reWrite.do" method="post">
		<input type="hidden" name="major_board_code" value="${getBoard.major_board_code }"/>
		<div>
			<label for="content">글 내용 : </label>
			<input type="text" id="content" name="content" />
		</div>
		<div>
			<button type="submit">작성</button>
		</div>
	</form> 
	<!--  댓글 끝 -->
<%@ include file="../bottom.jsp"%>