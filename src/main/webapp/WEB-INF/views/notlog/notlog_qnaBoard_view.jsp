<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!-- notlog_qnaBoard_view.jsp -->
<%@ include file="notlog_top.jsp" %>

<table class="table" width="80%"  height=80% border="1" style="font-size:20px;">
	<tr style="height:10px;">
		<td colspan="5">${vdto.qna_title}</td>
	</tr>
	
	<tr style="height:10px;">
		<td colspan="3">${vdto.content}</td>
	</tr>
	
	<tr>
		<td colspan="5" height="700px" align="center" style="word-break:break_all;padding:0;">
			<textarea style="width:740px; height:350px; text-align:left; font-size:20px; white-space:pre-wrap;" readonly>${vdto.content}</textarea>
			<br>
		</td>
	</tr>
	
	<tr height="1%">
			<td bgcolor="#D3D3D3" colspan="5" align="center">
      			<a href="notlog_qnaBoard_list.do?page=1">목록</a>
    	  	</td>
   		 </tr>
	</table>
	







<%@ include file="notlog_bottom.jsp"%>	