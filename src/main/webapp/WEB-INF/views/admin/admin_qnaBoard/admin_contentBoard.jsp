<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../admin_top.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div align="center">
	<table border="1" width="50%">
		<tr>
			<th bgcolor="yellow" width="20%">글번호</th>
			<td align="center" width="30%" >${getBoard.major_qna_board_code}</td>
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
			<td width="80%" colspan="3"><a href="admin_majorQnaBoard_download.do?major_qna_board_code=${getBoard.major_qna_board_code }&name=${dto.save_name}" >${dto.original_name }</a><br>
			size : ${dto.filesize }</td>
		</tr>
		</c:forEach>
		<tr bgcolor="yellow">
			<td align="right" colspan="4">
		<c:if test ="${getBoard.re_level eq 0 }">
			<input type="button" value="답글작성" onclick="window.location='admin_write_qna_board.do?major_qna_board_code=${getBoard.major_qna_board_code}'">
				&nbsp&nbsp&nbsp&nbsp 
		</c:if>
			<input type="button" value="글수정" onclick="window.location='admin_update_qna_board.do?major_qna_board_code=${getBoard.major_qna_board_code}'">
				&nbsp&nbsp&nbsp&nbsp 
			<input type="button" value="글삭제" onclick="javascript:deleteBoard('${getBoard.major_qna_board_code}', '${getBoard.image }')">
				&nbsp&nbsp&nbsp&nbsp 
			<input type="button" value="글목록" onclick="window.location='admin_qnaBoard.do'"></td>
		</tr>
	</table>	
<form name="f" action="admin_delete_qna_board.do" method= "post">
	<input type="hidden" name="major_qna_board_code"/>
	<input type="hidden" name="image" />
</form>
</div>
<script type="text/javascript">
	function deleteBoard(major_qna_board_code, image){
		document.f.major_qna_board_code.value = major_qna_board_code
		document.f.image.value = image
		document.f.submit()
	}
</script>	
<%@ include file="../admin_bottom.jsp"%>