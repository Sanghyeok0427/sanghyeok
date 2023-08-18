<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<%@ include file="../admin_top.jsp"%>
	<table align="center">
		<tr>
			<th><a href="admin_qnaBoard.do?class_code=${getClass.class_code }">게시판으로 가기</a></th>
		</tr>
		<tr>
			<td align="center"><input type="button" value="뒤로가기 " onclick="location.href='admin_selectLecture.do'"></td>
	</table> 

<%@ include file="../admin_bottom.jsp" %>