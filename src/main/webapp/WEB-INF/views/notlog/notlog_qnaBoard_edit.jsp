<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- notlog_qnaBoard_edit.jsp -->
<%@ include file="notlog_top2.jsp" %>

<form name="freeBedit" action="notlog_qnaBoard_edit_pro.do" method="post" enctype="multipart/form-data">
	<table width="100%" height="1280" border="1" style="font-size:20px;">
		
		<tr style="height:10px;">
			<th colspan="4">글 수정<input type="hidden" name="qna_code" value="${dto.qna_code}"/></th>
		</tr>
		
		<tr style="height:20px;">
			<th width="20%">글 제목</th>
			<td width="30%"><input type="text" name="qna_title" value="${dto.qna_title}" style="height:20px; width:240px; font-size:20px;"/></td>
			<th width="20%">작성자</th>
			<td width="30%">
				<input type="text" name="writer" value="${dto.writer}" style="height:20px; width:240px; font-size:20px;" readOnly/>
				<input type="hidden" name="writer_id" value="${sessionScope.id}"/>
			</td>
		</tr>
		
		<tr style="height:10px;">
			<th width="20%">이미지</th>
			<td colspan="3"><input type="file" name="image"/><input type="hidden" name="image2" value="${dto.image}"/></td>
		</tr>
		
		<tr>
			<td colspan="4" height="30%" align="center">
				<textarea name="content" style="font-size:16px; height:375px; width:780px; over-flow:auto">${dto.content}</textarea>
			</td>
		</tr>
		
		<tr style="height:10px;">
			<td colspan="4" align="right">
				<input type="hidden" name="readcount" value="${dto.readcount}"/>
				<input type="submit" value="작성완료" style="font-size:22px;"/>
			</td>
		</tr>
		
		<tr>
			<td colspan="4" style="border:none;"></td>
		</tr>
	
	</table>
</form>



<%@ include file="notlog_bottom.jsp"%>	