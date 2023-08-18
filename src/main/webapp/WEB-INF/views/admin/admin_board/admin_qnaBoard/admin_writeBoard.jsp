<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../top.jsp" %>
<script type="text/javascript">
	function check(){
		if (f.subject.value==""){
			alert("제목을 입력해 주세요!!")
			f.subject.focus()
			return false
		}
		if (f.content.value==""){
			alert("내용을 입력해 주세요!!")
			f.content.focus()
			return false
		}
		return true
	}
</script>
</head>
<body>
<div align="center">
	<form name="f" action="admin_write_qna_board.do" method="post" enctype="multipart/form-data" onsubmit="return check()">
		<table border="1" width="40%">
	<div class="form-check form-check-inline mt-3">
    <input class="form-check-input" type="checkbox" name="secret" id="secret">
    <label class="form-check-label">비밀글 설정</label>
	</div>
			<tr bgcolor="yellow">
				<td align="center" colspan="2">글 쓰 기</td>
			</tr>
			<tr>
				<th bgcolor="yellow" width="20%">제 목</th>
				<td><input type="text" name="subject" onkeyup="fn_checkByte(this, 50)"></td>
			</tr>
			<tr>
				<th bgcolor="yellow" width="20%">내 용</th>
				<td><textarea name="content" rows="11" cols="50" onkeyup="fn_checkByte(this, 4000)"></textarea></td>
			</tr>
			<tr>
				<th bgcolor="yellow" width="20%">이미지</th>
				<td><input type="file" name="image"  onkeyup="fn_checkByte(this, 60)"></td>
			</tr>
			<tr>
				<th bgcolor="yellow" width="20%">파일</th>
				<td><input type="file" name="original_name" multiple="multiple"></td>
			</tr>
			<tr bgcolor="yellow">
				<td align="center" colspan="2">
					<input type="submit" value="글쓰기">
					<input type="reset" value="다시작성">
					<input type="button" value="목록보기" onclick="window.location='admin_qnaBoard.do'">
				</td>
			</tr>
		</table>
		<input type="hidden" name="major_qna_board_code" value="${major_qna_board_code}"/>
		<input type="hidden" name="re_group" value="${re_group}"/>
		<input type="hidden" name="re_step" value="${re_step}"/>
		<input type="hidden" name="re_level" value="${re_level}"/>
	</form>
</div>
<%@ include file="../bottom.jsp" %>