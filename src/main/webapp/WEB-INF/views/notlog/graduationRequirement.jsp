<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 졸업요건 -->
<%@ include file="notlog_top.jsp" %>
<html>
	<head>
		<title>졸업요건</title>
	
<!-- 쿼리문 시작 -->
	<body>
			<div align="center">
				<h1>학사소개  <img src="resources/img/lowerButton.png" alt="내리기 버튼" onmouseover="showTableOfContents('toc11')" onmouseout="setTimeout(function() { hideTableOfContents('') }, 5000)"></h1>
				<h2>졸업요건</h2>
			</div>
			<div id="toc11" class="toc hidden"  align="center">
				<table>
			 		 <tr>
		 				<th>
		 					<ul>
		 						<li><p><a href="notlog_schoolCalender.do" >학사일정</a></p></li>
		 						<li><p><a href="" >수강신청</a></p></li>
		 						<li><p><a href="schoolScholarship.do" >교내/교외장학금</a></p></li>
		 						<li><p><a href="majorRelated.do" >전공/교과</a></p></li>
							</ul>
						</th>
					</tr>
				</table>
			</div>
	
	<hr color="blue" width="100%">
	<hr color="gray" align="left" width="2%">
	<h3>졸업요건</h3>
		<table width="100%">
			<tr>
				<td>
					<p>-8학기(건축대학 건축설계전공은 10학기) 이상 등록한 재학생<p>
					<p>-제1전공 이수 요건 충족</p>
					<p>-전학년 성적 평점평균 2.0 이상</p>
					<p>-필수과목 및 이수지정과목을 포함하여 이수구분별 최저이수학점 이상 취득</p>
					<p>-졸업논문 심사 합격</p>
					<p>-졸업인증제 기준 충족(2011학년도 신입생부터 적용)</p>
					<p>-공학교육인증 심화프로그램 요건 충족(공학교육인증 심화프로그램 소속자)</p>
				</td>
				<td>
					<input type="image" width="650px" height="400px" src="resources/img/graduation.png" alt="졸업요건이미지" class="image-button" align="center" >
				</td>
			</tr>
		</table>
</body>
</html>


<%@ include file="notlog_bottom.jsp"%>