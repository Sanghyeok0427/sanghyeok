<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- contentBoard.jsp -->
<head>
<script type="text/javascript">
	function check(){
		if (f.content.value==""){
			alert("내용을 입력해 주세요!!")
			f.content.focus()
			return false
		}
		return true
	}
</script>
<style>
.card-title2 {
  padding: 10px 0 15px 0;
  font-size: 18px;
  font-weight: 500;
  color: #012970;
  font-family: "Poppins", sans-serif;
}
</style>

<link href="resources/majorBoard_css/assets/css/main.css" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Orbit&display=swap" rel="stylesheet">
</head>
<%@ include file="../top.jsp"%>
<div class="card">
	<div class="card-body">
		<div class="container">
			<div class="row">
				<!-- 			<div class="col-3 col-12-medium imp-medium"> -->
				<article class="box page-content">
					<header>
						<h3 style="font-family: 'Orbit', sans-serif;">${getBoard.subject }</h3>
						<c:if test="${getBoard.writer_id eq sessionScope.id }">
							<a class="icon" href="#" data-bs-toggle="dropdown"
								aria-expanded="false"
								style="position: absolute; right: 30px; top: 50px;"> <i
								class="bi bi-three-dots"></i>
							</a>
							<ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow"
								style>
								<li class="dropdown-header text-start">
									<h6>편집</h6>
								</li>
								<li><a class="dropdown-item"
									href="update_major_board.do?major_board_code=${getBoard.major_board_code}">수정</a>
								</li>
								<li><a class="dropdown-item"
									href="delete_major_board.do?major_board_code=${getBoard.major_board_code}&image=${getBoard.image }">삭제</a>
								</li>
							</ul>
						</c:if>
						<ul class="meta">
							<li style="font-family: 'Orbit', sans-serif;"><svg
									xmlns="http://www.w3.org/2000/svg" width="16" height="16"
									fill="currentColor" class="bi bi-calendar-heart"
									viewBox="0 0 16 16">
 							<path fill-rule="evenodd"
										d="M4 .5a.5.5 0 0 0-1 0V1H2a2 2 0 0 0-2 2v11a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V3a2 2 0 0 0-2-2h-1V.5a.5.5 0 0 0-1 0V1H4V.5ZM1 14V4h14v10a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1Zm7-6.507c1.664-1.711 5.825 1.283 0 5.132-5.825-3.85-1.664-6.843 0-5.132Z" />
							</svg>&nbsp;&nbsp;${getBoard.reg_date }</li>
							<li style="font-family: 'Orbit', sans-serif;"><svg
									xmlns="http://www.w3.org/2000/svg" width="16" height="16"
									fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
  								<path
										d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6Zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0Zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4Zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10Z" />
								</svg>&nbsp;&nbsp;${getBoard.writer }</li>
						</ul>
					</header>
					<section>
						<div align="center">
							<c:if test="${getBoard.image ne 'none' }">
								<img src="${path}/${getBoard.image}" width="50%" height="50%">
							</c:if>
							<p style="font-family: 'Orbit', sans-serif;">${getBoard.content }</p>
						</div>
						<div>
						첨부파일 : <br>
						<c:forEach var="dto" items="${listFile}">
							<a href="majorBoard_download.do?major_board_code=${getBoard.major_board_code }&name=${dto.save_name }">${dto.original_name }</a>
						</c:forEach>
						</div>
					</section>
				</article>
			</div>
		</div>
	</div>
</div>
<div class="card">
	<c:forEach items="${replyList}" var="replyList">
	<div class="card info-card sales-card">
		<div align="right" class="filter" style="position: absolute; right: 15px; top: 10px;">
			<h6 style="font-family: 'Orbit', sans-serif;">
				<fmt:formatDate value="${replyList.reg_date}" pattern="yyyy-MM-dd" />
			</h6>
			<c:if test="${replyList.writer_id eq sessionScope.id }">
			<a class="icon" href="#" data-bs-toggle="dropdown" aria-expanded="false">
				<i class="bi bi-three-dots"></i>
			</a>
			<ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow" style>
				<li class="dropdown-header text-start">
					<h6>편집</h6>
				</li>
				<li>
					<a class="dropdown-item" href="update_reply_mb.do?rno=${replyList.rno}&major_board_code=${getBoard.major_board_code }">수정</a>
				</li>
				<li>
					<a class="dropdown-item" href="delete_reply_mb.do?rno=${replyList.rno}&major_board_code=${getBoard.major_board_code }">삭제</a>
				</li>
			</ul>
			</c:if>
			</div>
			<div class="card-body">
				<h1 style="font-family: 'Orbit', sans-serif;" class="card-title2">${replyList.writer }</h1>
				<div class="d-flex align-items-center">
					<div class="ps-3">
						<h6 style="font-family: 'Orbit', sans-serif;">${replyList.content }</h6>
					</div>
				</div>
			</div>
		</div>
			</c:forEach>
	</div>
<form name="f" action="major_board_reWrite.do" method="post" onsubmit="return check()">
	<input type="hidden" name="major_board_code"
		value="${getBoard.major_board_code }" />
	<div>
		<label for="content"></label> <input type="text" id="content" name="content" placeholder="댓글 내용을 입력하세요." />
	</div>
	<div align="right">
	<br>
		<button type="submit" class="btn btn-outline-primary">작성</button>
	</div>
</form>
<!--  댓글 끝 -->
<%@ include file="../bottom.jsp"%>