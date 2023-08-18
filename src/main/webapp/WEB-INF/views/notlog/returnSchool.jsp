<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 복학 -->
<%@ include file="notlog_top2.jsp" %>
		<body>
			<div align="center">
				<h1>학사소개 &nbsp; <img src="resources/img/lowerButton.png" alt="내리기 버튼" onmouseover="showTableOfContents('toc16')" onmouseout="setTimeout(function() { hideTableOfContents('') }, 5000)"></h1>
				<h2>복학 <img src="resources/img/lowerButton.png" alt="내리기 버튼" onmouseover="showTableOfContents('toc15')" onmouseout="setTimeout(function() { hideTableOfContents('') }, 5000)"></h2>	
			
		 		 <div id="toc16" class="toc hidden" >
		 	 		<table>
		 	 			<tr>
	 						<th>
	 							<ul>
	 								<li><p><a href="notlog_schoolCalender.do" >학사일정</a></p></li>
	 								<li><p><a href="" >수강신청</a></p></li>
	 								<li><p><a href="schoolScholarship.do" >교내/교외장학</a></p></li>
	 								<li><p><a href="graduationRequirement.do" >졸업요건</a></p></li>
	 								<li><p><a href="majorRelated.do" >전공/교과</a></p></li>
								</ul>
							</th>
						</tr>
					</table>
				</div>
		 	 	
			  <div id="toc15" class="toc hidden" >
		 		 <table>
		 			 <tr>
	 					<th>
	 						<ul>
	 							<li><p><a href="hyuhak.do" >휴학</a></p></li>
							</ul>
						</th>
					</tr>
				</table>
			</div>
		</div>
		<hr color="blue" width="100%">

			<hr color="gray" align="left" width="2%">
				<h3 align="left">휴학의 종류</h3>	
					<table border="1" width="80%">
						<tr align="center" bgcolor="#D3D3D3">
							<td width="20%">구분</td>
							<td width="20%">가능기간</td>
							<td width="60%">휴학종류 및 가능기간에 대한 설명</td>
						</tr>
						<tr>
							<td align="center">가사휴학</td>
							<td align="center">4년</td>
							<td>개인사정으로 인한 휴학</td>
						</tr>
						<tr>
							<td align="center">입영휴학(군휴학)</td>
							<td align="center">3년</td>
							<td>군 입대로 인한 휴학(입영일로부터 전역일 후 1년 이내)</td>
						</tr>
						<tr>
							<td align="center">임신`출산`육아휴학</td>
							<td align="center">3년</td>
							<td>여학생의 임신 출산 육아시 통산3년/남학생의 육아1년이내 가능</td>
						</tr>
						<tr>
							<td align="center">창업휴학</td>
							<td align="center">2년</td>
							<td>학생 본인 창업시 가능</td>
						</tr>
						<tr>
							<td align="center">질병휴학</td>
							<td align="center">해당기간</td>
							<td>치료기간</td>
						</tr>
					</table>
				<hr color="gray" align="left" width="2%">
				<h3 align="left">가사휴학 신청</h3>	
					<table>
						<tr>
							<td><p>가.신청기간: 개강 전 소정기간 및 학기개시일 후 90일 이내</p></td>
							<td><p>나.신청방법</p></td>
							<td><p></p></td>
							개강전 또는 학기개시일 후 90일 이내 - ON국민포털 신청( 로그인 → 학사서비스 → 학적정보 → 휴학/복학신청 → 휴학신청)
						</tr>
					</table>


<%@ include file="notlog_bottom.jsp"%>	