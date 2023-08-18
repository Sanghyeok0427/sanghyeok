<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- notlog_qnaBoard_insert.jsp -->
<%@ include file="notlog_top2.jsp" %>

<form name="freeBinsert" action="notlog_qnaBoard_insert_pro.do" method="post" enctype="multipart/form-data">
	<table width="100%" height="1280" border="1" style="font-size:20px;">
		<tr style="height:10px;">
			<th colspan="2"><a href="notlog_qnaBoard_list.do?page=1&mode=all">모든글</a></th>
			<th colspan="2"><a href="notlog_qnaBoard_list.do?page=1&mode=best">개념글</a></th>
		</tr>
		
		<tr style="height:10px;">
			<th colspan="4">새 글 작성</th>
		</tr>
		
		<tr style="height:20px;">
			<th width="20%">글 제목</th>
			<td width="30%"><input type="text" name="qna_title" style="height:20px; width:240px; font-size:20px;"/></td>
			<th width="20%">작성자</th>
			<td width="30%">
				<input type="text" name="writer" value="${writer}" style="height:20px; width:240px; font-size:20px;"/>
				<input type="hidden" name="writer_id" value="${sessionScope.id}"/>
			</td>
		</tr>
		
		<tr style="height:10px;">
			<th width="20%">이미지</th>
			<td colspan="3"><input type="file" name="image"/></td>
		</tr>
		
		<tr>
			<td colspan="4" height="30%" align="center">
				<textarea name="content" style="font-size:16px; height:375px; width:780px; over-flow:auto"></textarea>
			</td>
		</tr>
		
		<tr style="height:10px;">
			<td colspan="4" align="right">
				<input type="submit" value="작성완료" style="font-size:22px;"/>
			</td>
		</tr>
		
		<tr>
			<td colspan="4" style="border:none;">광고</td>
		</tr>
	
	</table>
</form>




<%@ include file="notlog_bottom.jsp"%>	