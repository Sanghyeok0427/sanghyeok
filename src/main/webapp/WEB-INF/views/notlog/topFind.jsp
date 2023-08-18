<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--비로그인 검색하기 -->
<html>
	<head>
		<title>EZEN검색</title>
			<link rel="stylesheet" type="text/css" href="style.css">
<style>
	.small-reset-button {
		font-size: 12px;
		padding: 3px 8px;
	}
</style>

	</head>
		<body>
			<div align="center">
			<br>
			<h2>EZEN검색</h2>
			<br>
			<form name="f" action="checkTop" method="post">
				<table width="500" class="outline">
					<tr align="center">
						<td><input type="text" name="search" class="box" maxlength="15"> 
								<a href="javascript:check()"> <img src="resources/img/glasses.png" width="35" height="15" alt="돋보기"></a>
								<input width="30" type="reset" value="다시입력" class="small-reset-button">
					</tr>
				</table>
			</form>
		</div>
	</body>
</html>
