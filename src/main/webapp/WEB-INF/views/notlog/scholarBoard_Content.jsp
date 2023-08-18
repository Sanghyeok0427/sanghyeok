<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 장학공지 자세히보기 -->
<%@ include file="notlog_top.jsp" %>

 	<table border="1">
		<tr>
			<th width="15%">제목</th>
			<td colspan="3">${InfoBoard.info_title}</td>
			<th width="10%">첨부파일</th>
			<td>
           		<c:if test="${file != null}">
        			<a href="notlog_infoBoard_download.do?info_code=${dto.info_code}&type=${dto.type}&name=${file.save_name}">${file.original_name}</a>
        		</c:if>
        		<c:if test="${file == null}">
        			첨부파일이 없습니다
        		</c:if>
           	</td>
		</tr>
		<tr>
			<th>작성일</th>
			<td align="center" width="20%">${InfoBoard.reg_date}</td>
			<th width="10%">담당자</th>
			<td align="center" width="20%">${InfoBoard.writer}</td>
			<th width="10%">조회수</th>
			<td align="center" width="20%">${InfoBoard.readcount}</td>
		</tr>   
		<tr>
			<td colspan="6" height="50">${InfoBoard.content}</td>
		</tr>
		<tr>
			<td colspan="6" align="center"><img src="resources/infoBoard_img/${InfoBoard.image}" width="1200px" height="500px"></td>
		</tr>		
	</table>
<br>
	<div align="center">
		<table>
			<tr>
				<td bgcolor="#D3D3D3">
					<a href="scholarBoard.do?page=1">목록</a>
				</td>
			</tr>
		</table>
	</div>
		
<%@ include file="notlog_bottom.jsp"%>