<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 비로그인 메인 화면 -->
<link rel="stylesheet" type="text/css" href="style.css">
<%@ include file="notlog_top.jsp" %>
	
  <img src="resources/img/ezen.png" width="100%" height="400px" alt="ezen.png" class="main-image">
 <!-- 기타 콘텐츠 -->
  
	<div align="left">
		<table border="1" height="1500" >
			<tr height="100">
				<th>교내행사</th>
				<th height="10">공지사항
 					<a href="notlog_infoBoardList.do"><img src="resources/img/themore.png" width="20" height="10" alt="더보기"></a>
 				</th>
			</tr>
			<tr height="10">
				<td align="left" width="70%"  rowspan="6" align="center">&nbsp;&nbsp;
				 	<a href="notlog_vision.do"><input type="image" width="395px" src="resources/img/schoolEvent.png" alt="교내행사" class="image-button"></a> 
					&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
					<a href="notlog_vision.do"><input type="image" width="415px" src="resources/img/schoolEvent4.png" alt="교내행사4" class="image-button"></a></td>
				<td align="left"  width="30%"> 공지1  |  <a href="notlog_eventBoardList_Content.do?event_code=4">행사1</a></td>
			</tr>
			<tr height="10">
				<td align="left">  공지2  |  행사2</td>
			</tr>
			<tr height="10">	
				<td align="left">  공지3  |  행사3</td>
			</tr>
			<tr height="10">
				<td align="left">  공지4  |  행사4</td>
			</tr>
			<tr height="10">
				<td align="left">  공지5  |  행사5</td>
			</tr>
			<tr height="10">
				<td align="left">  공지6  |  행사6</td>
			</tr>
			<tr height="220" border="0">
				<td align="center" colspan="2">
					<a href="notlog_vision.do"><input type="image" width="380px" src="resources/img/vision.png" alt="건학이념" class="image-button"></a>
					<a href="notlog_specialLectureBoardList_Content.do?specialLecture_code=3"><input type="image" width="425px" src="resources/img/specialLecture.png" alt="HIT특강" class="image-button"></a>&nbsp;&nbsp;
					<a href="test.do"><input type="image" width="425px" src="resources/img/hongbo.png" alt="홍보영상" class="image-button"></a>		
				</td>
								
			</tr>
				<th height="10" align="center" colspan="2">
					건학이념 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			 		HIT특강 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 홍보영상
				</th>
			<tr height="800">
				<td colspan="2">
				</td>
			</tr>
		</table>
	</div>
<%@ include file="notlog_bottom.jsp"%>	