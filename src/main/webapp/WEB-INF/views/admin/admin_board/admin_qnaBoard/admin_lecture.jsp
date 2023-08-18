<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<%@ include file="../top.jsp" %>
	<h3 align="center">강의 게시판</h3>
	<form name="f" action="admin_qna_classCheck.do" method="post">
	<input type="hidden" name="class_name" value="${dto.class_name }">
	<table align="center">
		<tr>
			<td>&nbsp;&nbsp;&nbsp;
			<select name="lecture">
			<c:forEach var="dto" items="${list}">
					<option value="${dto.class_name }">${dto.class_name }</option>
			</c:forEach>
			</select> 
			<input type="submit" value="조회">
			</td>
		</tr>
	</form>
	</table> 
<%@ include file="../bottom.jsp"%>