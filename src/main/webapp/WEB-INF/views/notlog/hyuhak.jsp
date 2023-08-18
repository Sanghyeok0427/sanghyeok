<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 휴학/복학 -->
<%@ include file="notlog_top2.jsp" %>

<style>
	.hidden {
		display: none;
		}
</style>	

<script>
	function showTableOfContents(tocId) {
		var allToc = document.querySelectorAll(".toc");
			for (var i = 0; i < allToc.length; i++) {
				allToc[i].style.display = "none";
			}
 			var toc = document.getElementById(tocId);
				toc.style.display = "block";
        }

	function hideTableOfContents() {
		var allToc = document.querySelectorAll(".toc");
			for (var i = 0; i < allToc.length; i++) {
				allToc[i].style.display = "none";
			}
		}
</script>		

		<body>
			<div align="center">
				<h1>학사소개 &nbsp; <img src="resources/img/lowerButton.png" alt="내리기 버튼" onmouseover="showTableOfContents('toc14')" onmouseout="setTimeout(function() { hideTableOfContents('') }, 5000)"></h1>
				<h2>휴학 <img src="resources/img/lowerButton.png" alt="내리기 버튼" onmouseover="showTableOfContents('toc13')" onmouseout="setTimeout(function() { hideTableOfContents('') }, 5000)"></h2>	
			
	 		 <div id="toc14" class="toc hidden" >
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
	 	 
		  <div id="toc13" class="toc hidden" >
	 		 <table>
	 			 <tr>
 					<th>
 						<ul>
 							<li><p><a href="returnSchool.do" >복학</a></p></li>
						</ul>
					</th>
				</tr>
			</table>
		</div>
		
		<hr color="blue" width="100%">




<%@ include file="notlog_bottom.jsp"%>	