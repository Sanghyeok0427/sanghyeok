<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 비회원 로그인 top -->

<html>
	<head>
		<title>비회원 로그인 top</title>
 
		<style>
			.toc {
				display: none;
			}
		    
			.link-button {
				background: none;
				border: none;
				color: blue;
				text-decoration: underline;
				cursor: pointer;
			}
		    
			.close-button {
				background: none;
				border: none;
				color: red;
				text-decoration: none;
				cursor: pointer;
			}
		</style>
	
		<script>
			window.onload = function() {
				var link1 = document.getElementById("toggleLink1");
				var link2 = document.getElementById("toggleLink2");
				var link3 = document.getElementById("toggleLink3");
				var link4 = document.getElementById("toggleLink4");
				var link5 = document.getElementById("toggleLink5");
		      
				var toc1 = document.getElementById("toc1");
				var toc2 = document.getElementById("toc2");
				var toc3 = document.getElementById("toc3");
				var toc4 = document.getElementById("toc4");
				var toc5 = document.getElementById("toc5");
		      
				var close1 = document.getElementById("closeButton1");
			 	var close2 = document.getElementById("closeButton2");
				var close3 = document.getElementById("closeButton3");
				var close4 = document.getElementById("closeButton4");
				var close5 = document.getElementById("closeButton5");
		      
				link1.onclick = function() {
					toc1.style.display = "block";
				};     
				link2.onclick = function() {
					toc2.style.display = "block";
				};      
				link3.onclick = function() {
					toc3.style.display = "block";
				};      
				link4.onclick = function() {
					toc4.style.display = "block";
				};
			 	link5.onclick = function() {
					toc5.style.display = "block";
				};
					
				close1.onclick = function() {
					toc1.style.display = "none";
				};
				close2.onclick = function() {
					toc2.style.display = "none";
				};      
				close3.onclick = function() {
					toc3.style.display = "none";
				};     
				close4.onclick = function() {
					toc4.style.display = "none";
				};
				close5.onclick = function() {
					toc5.style.display = "none";
				};
			};
		</script>
	
	
	
		<link rel="stylesheet" type="text/css" href="style.css">
	
		<script type="text/javascript">
			function topFind(){
				window.open("topFind.do", "",  "left=900, top=500, width=480, height=420, menubar=no, toolbar=no, resizeTo=no, scrollbars=no")	
			}
			
			function studentList(){
				window.open("studentList.do", "", "width=480, height=420, menubar=no, toolbar=no, resizable=no, scrollbars=no")
			}
			
			function staffList(){
				window.open("staffList.do", "", "width=480, height=420")
			}
			
			function preEzenList(){
				window.open("preEzenList.do", "", "width=480, height=420")
			}
		</script>

  
</head>

<body>
	<div align="center">
		<table border="0" width="100%" height="100%" bgcolor="#F5F5F5">
			<tr height="10%" >
				<td colspan="6" align="left">
					<a href="main.do"><img src="resources/img/ezenlogo.png" alt="ezen로고"></a>
				</td>
			</tr>
			
			<tr>
				<td><a id="toggleLink1" class="link-button">대학소개 </a></td>
				<td><a id="toggleLink2" class="link-button">입학소개</a></td>
				<td><a id="toggleLink3" class="link-button">학사소개</a></td>
	  			<td><a id="toggleLink4" class="link-button">공지</a></td>
				<td><a id="toggleLink5" class="link-button">자유게시판</a></td>
				<td align="center">
					<a href="javascript:topFind()"><img src="resources/img/glasses.png" width="35" height="15" alt="돋보기"></a>
				</td>
			</tr>
	
			<tr>
				<td width="19%" height="20%">		
					<div id="toc1" class="toc">
	  						<h2>대학 소개 <img id="closeButton1" class="close-button" src="resources/img/X.png" alt="닫기" width="10" height="10" ></h2>
	  						<ul>
	   							<li><a href="notlog_vision.do">비전</a></li>
	    						<li><a href="notlog_campusGuide.do">캠퍼스 안내</a></li>			
	  						</ul>
					</div>
				</td>
	
			 	<td width="19%" height="20%">
						<div id="toc2" class="toc">
	  						<h2>입학 소개 <img id="closeButton2" class="close-button" src="resources/img/X.png" alt="닫기" width="10" height="10"></h2>
	  						<ul>
	    						<li><a href="notlog_enroll.do">대학입학안내</a> </li>
	  						</ul>
						</div>
				</td>
	
			 	<td width="19%" height="20%">
		 			<div id="toc3" class="toc hidden">
						<h3>학사 안내 <img id="closeButton3" class="close-button" src="resources/img/X.png" alt="닫기" width="10" height="10"></h3>
	     				<ul>
      						<li><a href="notlog_schoolCalender.do">학사일정</a></li>
   							<li><a href="">수강신청</a></li>
   							<li><a href="schoolScholarship.do">교내/교외장학</a></li>
   							<li><a href="graduationRequirement.do">졸업요건</a></li>
   							<li><a href="majorRelated.do">전공/교과</a></li>
   							<li><a href="hyuhak.do">휴학/복학</a></li>
						</ul>
					</div>
				</td>
	
				<td width="19%" height="20%">	
					<div id="toc4" class="toc hidden">
						<h3>공지 <img id="closeButton4" class="close-button" src="resources/img/X.png" alt="닫기" width="10" height="10"></h3>
      					<ul>
      						<li><a href="administrationBoard.do">행정공지</a></li>
   							<li><a href="scholarBoard.do?page=1">장학 공지</a></li>
   							<li><a href="communityService.do">사회봉사</a></li>
   							<li><a href="libraryBoard.do">도서관공지</a></li>
      					</ul>
  					</div>
				</td>
		
			 	<td width="19%" height="20%">
					<div id="toc5" class="toc hidden">
						<h3>자유게시판 <img id="closeButton5" class="close-button" src="resources/img/X.png" alt="닫기" width="10" height="10"></h3>
      					<ul>
      						<li><a href="notlog_qnaBoardList.do">Q&A게시판</a></li>
      					</ul>
					</div>
				</td>	
			</tr>
			
			
			<tr height="80%">
				<td width="10%" valign="top" align="center" bgcolor="#E0EAFD" >
					 EZEN SERVICE
			
					<table border="0" width="100%">
						<tr bgcolor="#E1F5FE">
		  					<th align="center">
		  	  					<a href="studentList.do"><span style="color: #444;">재학생</span></a>
		  	  				</th>
						</tr>
						<tr bgcolor="#E1F5FE">
							<th align="center">
		    					<a href="staffList.do"><span style="color: #444;">교직원</span></a>
		    				</th>
						</tr>
						<tr bgcolor="#E1F5FE">
		   			 		<th align="center">
		    					<a href="preEzenList.do"><span style="color: #444;">예비이젠인</span></a>
		    				</th>
						</tr>			
					</table>
				</td>
				<td width="85%"  colspan="5">