<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 장학공지 -->
<%@ include file="notlog_top2.jsp" %>
		<div align="center">
			<h1>공지  &nbsp;<img src="resources/img/lowerButton.png" alt="내리기 버튼" onmouseover="showTableOfContents('toc13')" onmouseout="setTimeout(function() { hideTableOfContents('') }, 5000)"></h1>
			<h2>장학공지</h2>
		</div>
		
		<div id="toc13" class="toc hidden" >
	 	 	<table align="center">
	 	 		<tr>
 					<th>
 						<ul>
 							<li><p><a href="administrationBoard.do" >행정공지</a></p></li>
 							<li><p><a href="communityService.do" >사회봉사</a></p></li>
 							<li><p><a href="libraryBoard.do" >도서관공지</a></p></li>
						</ul>
					</th>
				</tr>
			</table>
		
		</div>		
				총   ${totalPosts}개의 게시물이 있습니다.
				<hr color="black">
				
				<table border="1" align="center" width="90%">
					<tr>
						<c:if test="${notlog_listBoard != null || notlog_listBoard.size() != 0}">
							<c:forEach var="ldto" items="${notlog_listBoard}">
								<tr align="center">
									<td width="200px" height="130px"><a href="scholarBoard_Content.do?info_code=${ldto.info_code}&type=${ldto.type}"><input type="image" width="200px" height="130px" src="resources/infoBoard_img/${ldto.image}" alt="장학공지" class="image-button"></a></td>
									<td height="30px"><a href="scholarBoard_Content.do?info_code=${ldto.info_code}&type=${ldto.type}">공지_&nbsp;&nbsp;${ldto.info_title}</a></td>
								</tr>
							</c:forEach>
						</c:if>
				
						<c:if test="${notlog_listBoard == null || notlog_listBoard.size() == 0}">
							<tr>
            					<td><h1 align="center">등록된 공지가 없습니다</h1></td>
         					</tr>			
						</c:if>
				
					<tr>
						<td align="center">
			 				<c:forEach begin="1" end="${pageCount}" var="i">
        						 <a href="scholarBoard.do?page=${i}"><font size="3">[${i}]</font></a>   
      						</c:forEach>
						</td>
					</tr>
				</table>
			

<%@ include file="notlog_bottom.jsp"%>