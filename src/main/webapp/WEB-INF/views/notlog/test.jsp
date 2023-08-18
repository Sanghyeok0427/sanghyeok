<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- test.jsp -->
<%@ include file="notlog_top.jsp" %>

<!DOCTYPE html>
<html>
<head>
  <style>
    .image-container {
      position: relative;
      overflow: hidden;
      width: 400px; /* 이미지 컨테이너의 너비 조정 */
    }
    
    .image-container img {
      position: absolute;
      transition: transform 0.5s ease;
    }
    
    .image-container img.animate {
      transform: translateX(-100%);
    }
  </style>
</head>
<body>
  <div class="image-container">
    <img id="main-image" src="resources/img/main1.jpg" alt="Main Image">
  </div>
  
  <button id="animate-button">애니메이션 시작</button>

  <script>
  document.addEventListener('DOMContentLoaded', function() {
	  var animateButton = document.getElementById('animate-button');
	  var mainImage = document.getElementById('main-image');

	  animateButton.addEventListener('click', function() {
	    mainImage.classList.add('animate');

	    // 애니메이션 완료 후 클래스 제거
	    mainImage.addEventListener('transitionend', function() {
	      mainImage.classList.remove('animate');
	    });
	  });
	});

  </script>
</body>
</html>






<%@ include file="notlog_bottom.jsp"%>	