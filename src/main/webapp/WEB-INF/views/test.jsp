<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<!-- freeB_top.jsp -->

<html>
<head>
	<meta charset="UTF-8">
	<title>이젠대학교 자유게시판</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<link rel="canonical" href="https://getbootstrap.com/docs/4.5.2/examples/carousel/">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	
	<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
	<script src="resources/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	<script src="resources/freeB_css/dist/js/scripts.js"></script>
	<script src="resources/js/jquery-3.7.0.js"></script>
</head>
<body class="sb-nav-fixed">	

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
		function openWindow(url, title) {
			var left = (window.screen.width - 1280) / 2;
			var top = (window.screen.height - 800) / 2;
			window.open(url, title, "width=1280, height=800, left="+left+", top="+top);
		}
	</script>
	
<header data-bs-theme="dark">
	<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
		<div class="container-fluid">
			<div class="collapse navbar-collapse" id="navbarCollapse">
				<ul class="navbar-nav me-auto mb-2 mb-md-0">
					<li class="nav-item">
						<a class="nav-item btn btn-secondary" href="login_main.do">메인페이지</a>
					</li>
					&nbsp;&nbsp;&nbsp;
					<c:if test="${sessionScope.id != null}">
						<li>
							<a class="nav-item btn btn-secondary disabled">${sessionScope.id} 로그인 중...</a>
						</li>
						&nbsp;&nbsp;&nbsp;
						<li>
							<a class="nav-item btn btn-secondary" href="login_main.do?mode=logout">로그아웃</a>
						</li>
					</c:if>
					<c:if test="${sessionScope.id == null}">
						<li>
							<a class="nav-item btn btn-secondary" href="login_main.do">로그인 페이지로 이동</a>
						</li>
					</c:if>
				</ul>
			</div>
		</div>
	</nav>
</header>


<main>
	<div align="center" style=position:relative;">
		
		<table width="1080" class="table">			
			<tr>
				<td style="border:none;" colspan="2">
					<img src="resources/img/ezenlogo.png" align="left" 
						alt="이젠대학교 자유게시판" onclick="location.href='freeB_list.do?page=1&mode=all'">
				</td>
			</tr>
			
			<thread>
			<tr>
				<th width="800"><h1>대문입니다 이젠대학교 자유게시판입니다</h1></th>
				<td align="center">
					<h4>주 관리자 : 김관리자</h4><br>
					<h4>보조 관리자 : 게시판관리자</h4><br>
					<h6>*과도한 어그로는 제재받을 수 있습니다</h6>
				</td>
			</tr>
			</thread>
			
			<tbody>
			<tr>
				<td style="width:800px; min-height:1280px;">
				
	