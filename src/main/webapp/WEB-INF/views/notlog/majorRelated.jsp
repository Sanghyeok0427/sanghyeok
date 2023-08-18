<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 전공/교과 -->
<%@ include file="notlog_top.jsp" %>
<html>
	<head>
		<title>전공/교과</title>
	
<!-- 쿼리문 시작 -->
</head>
	<body>
		<div align="center">
			<h1>학사소개  <img src="resources/img/lowerButton.png" alt="내리기 버튼" onmouseover="showTableOfContents('toc12')" onmouseout="setTimeout(function() { hideTableOfContents('') }, 5000)"></h1>
			<h2>전공/교과</h2>
		</div>
		<div id="toc12" class="toc hidden" align="center">
	 		<table>
	 	 		<tr>
 					<th>
 						<ul>
 							<li><p><a href="notlog_schoolCalender.do" >학사일정</a></p></li>
 							<li><p><a href="" >수강신청</a></p></li>
 							<li><p><a href="schoolScholarship.do" >교내/교외장학금</a></p></li>
 							<li><p><a href="graduationRequirement.do" >졸업요건</a></p></li>
						</ul>
					</th>
				</tr>
			</table>
		</div>
	
	<hr color="blue" width="100%">
	<hr color="gray" align="left" width="2%">
	<h3>전공신청</h3>
		<table width="100%">
			<tr>
				<td><p>-2개 이상의 전공이 설치된 학부로 입학한 자의 전공은 본인의 희망에 따라 제2학년말 소정기간 내에 선택한다.</p>
						<p>(다만, 입학시 전공을 모집단위로 입학한 학생과 학부에서 자체 선발기준에 따라 선발하는 학부의 학생은 제외한다.)</p>
						<font color="orange">-1전공을 신청하지 않은 자는 장학사정시 불이익을 받을 수 있으며, 당해학기 성적 열람이 불가하므로 반드시 소정의 기간 중에 1전공 신청을 마쳐야 함.</font>
				<td>
			</tr>
		</table>
	

	<hr color="gray" align="left" width="2%">
	<h3>전공변경</h3>
		<table width="100%">
			<tr>
				<td><p>2학년 말에 전공을 선택한 학부생은 1회에 한하여 4학년 1학기말(7차학기) 소정 기간에 전공을</p>
						<p>변경신청 할 수 있다. (편입학생 제외)</p>
				</td>
			</tr>
		</table>
	
	<hr color="gray" align="left" width="2%">
	<h3>신청기간</h3>
		<table width="100%">
			<tr>
				<td><p>매년 4월 말 및 10월 말.</p>
			</tr>
			<tr>
				<td>
					<input type="image" width="1200px" height="300px" src="resources/img/majorRelated.png" alt="졸업요건이미지" class="image-button" align="left" >
				</td>
			</tr>
		</table>
</body>
</html>


<%@ include file="notlog_bottom.jsp"%>