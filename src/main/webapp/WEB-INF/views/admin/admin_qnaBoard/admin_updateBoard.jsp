<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../admin_top.jsp" %>
<div align="center">
	<form name="f" action="admin_update_qna_board.do" method="post" enctype="multipart/form-data" onsubmit="return check()">
		<input type="hidden" name="major_qna_board_code" value="${getBoard.major_qna_board_code }" />
		<table border="1" width="40%">
			<tr bgcolor="yellow">
				<td align="center" colspan="2">글 수 정</td>
			</tr>
			<tr>
				<th bgcolor="yellow" width="20%">이 름</th>
				<td><input type="text" name="writer" value="${getBoard.writer }" readOnly></td>
				
			</tr>
			<tr>
				<th bgcolor="yellow" width="20%">제 목</th>
				<td><input type="text" name="subject" value="${getBoard.subject }" onkeyup="fn_checkByte(this, 50)"></td>
			</tr>
			<tr>
				<th bgcolor="yellow" width="20%">내 용</th>
				<td><textarea name="content" rows="11" cols="50" onkeyup="fn_checkByte(this, 4000)">${getBoard.content }</textarea></td>
			</tr>
			<tr>
				<th bgcolor="yellow" width="20%">이미지</th>
				<td><input type="file" name="image"><br><img
				src="${path}/${getBoard.image}" width="100" height="100">
				<input type="hidden" name="image2" value="${getBoard.image}"/></td>
			</tr>
			<tr>
				<th bgcolor="yellow" width="20%">파일</th>
				<td><input type="file" name="original_name" multiple="multiple"></td>
			</tr>
			<tr bgcolor="yellow">
				<td align="center" colspan="2">
					<input type="submit" value="글수정">
					<input type="reset" value="다시작성">
					<input type="button" value="목록보기" onclick="window.location='admin_qnaBoard.do'">
				</td>
			</tr>
		</table>
	</form>
</div>
<%@ include file="../admin_bottom.jsp" %>