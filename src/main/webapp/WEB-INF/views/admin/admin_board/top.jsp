<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
      function fn_checkByte(obj, max) {
         const maxByte = max; //최대 바이트 설정
         const text_val = obj.value; //입력한 문자
         const text_len = text_val.length; //입력한 문자수
          
         let totalByte=0;
         for(let i=0; i<text_len; i++){
            const each_char = text_val.charAt(i);
            const uni_char = escape(each_char); //유니코드 형식으로 변환
            if(uni_char.length>4){
               // 한글 : 2Byte
               totalByte += 2;
            }
            else{
               // 영문,숫자,특수문자 : 1Byte
               totalByte += 1;
            }
         }
          
         if(totalByte>maxByte){
            alert("최대 "+maxByte+"Byte까지만 입력가능합니다.");
         }
      }
   </script>
<meta charset="UTF-8">
<title>마이페이지</title>
</head>
<body>
	<div align="center">
		<table border="1" style="min-height:780px; width:1260px;">
			<tr>
				<c:if test="${sessionScope.type eq '교수' }">
					<td colspan="3"><a href="classCheck.do">마이페이지</a></td>
				</c:if>
				<c:if test="${sessionScope.type eq '학생' }">
					<td colspan="3"><a href="classCheck.do">학생페이지</a></td>
				</c:if>
			</tr>
			<tr height="80%">
			<td width="20%" valign="top" align="center">
					<a href="admin_majorBoard.do">게시판</a><br>
					<a href="admin_qnaBoard.do">질문게시판</a><br>
					</td>
			<td>
