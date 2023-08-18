<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 비회원 로그인 top -->

<html lang="en">
	<head>
		<title>비회원 로그인 top</title>
			<link rel="stylesheet" type="text/css" href="resources/main_css/ezenHome.css">
			<link href="../css/style.css" type="text/css" rel="stylesheet">
			<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
			<link rel="stylesheet" type="text/css" href="resources/css/bootstrap.css">
			<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
			<script src="https://code.jquery.com/jquery-latest.min.js"></script>
    		<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
			<script src="../js/script.js"></script>
			<script type="text/javascript">
		        window.onload = function () {
		            var elm = ".box";
		            $(elm).each(function (index) {
		                // 개별적으로 Wheel 이벤트 적용
		                $(this).on("mousewheel DOMMouseScroll", function (e) {
		                    e.preventDefault();
		                    var delta = 0;
		                    if (!event) event = window.event;
		                    if (event.wheelDelta) {
		                        delta = event.wheelDelta / 120;
		                        if (window.opera) delta = -delta;
		                    } 
		                    else if (event.detail)
		                        delta = -event.detail / 3;
		                    var moveTop = $(window).scrollTop();
		                    var elmSelecter = $(elm).eq(index);
		                    // 마우스휠을 위에서 아래로
		                    if (delta < 0) {
		                        if ($(elmSelecter).next() != undefined) {
		                            try{
		                                moveTop = $(elmSelecter).next().offset().top;
		                            }catch(e){}
		                        }
		                    // 마우스휠을 아래에서 위로
		                    } else {
		                        if ($(elmSelecter).prev() != undefined) {
		                            try{
		                                moveTop = $(elmSelecter).prev().offset().top;
		                            }catch(e){}
		                        }
		                    }
		                     
		                    // 화면 이동 0.4초(400)
		                    $("html,body").stop().animate({
		                        scrollTop: moveTop + 'px'
		                    }, {
		                        duration: 400, complete: function () {
		                        }
		                    });
		                });
		            });
		        }
		    </script>
			
			<script>
				$(document).ready(function(){
					// 마우스오버 메뉴
					  $('.navi2 > li').mouseover(function(){
					    $(this).find('.subMenu2').stop().slideDown(300);
					  }).mouseout(function(){
					    $(this).find('.subMenu2').stop().slideUp(300);
					  });
				
					// 이미지슬라이드 페이드 인 페이드 아웃
					  $('.imgSlide a:gt(0)').hide();
				
					  setInterval(function(){
					    $('.imgSlide a:first-child').fadeOut()
					    .next('a').fadeIn()
					    .end().appendTo('.imgSlide');
					  }, 3000);
				
					  // ******  탭 메뉴 공지사항 갤러리  ****** //
					  $(function(){
					  $('.tabMenu>li>a').click(function(){
					      $(this).parent().addClass("active").siblings().removeClass("active");
					    // return false;
					   /* return false를 반드시 적기.
					      버블링(bubbling) 때믄. 버블링이란?
					      한 요소에 이벤트가 발생하면,
					      이 요소에 할당된 핸들러가 동작하고,
					      이어서 부모 요소의 핸들러가 동작합니다.
				
					      가장 최상단의 조상 요소를 만날 때까지
					      이 과정이 반복되면서 요소 각각에 할당된 핸들러가 동작합니다.
				
					      이벤트가 제일 깊은 곳에 있는 요소에서 시작해 부모 요소를 거슬러 올라가며 발생하는 모양이 마치 물속 거품(bubble)과 닮았기 때문입니다.
				
					      클릭 이벤트를 중단하고, 호출한 곳으로 되돌아 가라~라는 의미.
					      a를 클릭했을 때, 부모의 요소도 클릭한것 처럼 처리가 되기때문에
					     HTML을 클릭 이전 상태로 되돌리기 위해서
					   */
					    });
					  });
					// 레이어 팝업
					  $('.notice li:first').click(function(){
					    $('#modalWrap').addClass("active");
					  });
					  $('.btn').click(function(){
					    $('#modalWrap').removeClass("active");
					  });
					});
			</script>
			<script>
				$(document).ready(function(){
					// 마우스오버 메뉴
					  $('.navi > li').mouseover(function(){
					    $(this).find('.subMenu').stop().slideDown(300);
					  }).mouseout(function(){
					    $(this).find('.subMenu').stop().slideUp(300);
					  });
				
					// 이미지슬라이드 페이드 인 페이드 아웃
					  $('.imgSlide a:gt(0)').hide();
				
					  setInterval(function(){
					    $('.imgSlide a:first-child').fadeOut()
					    .next('a').fadeIn()
					    .end().appendTo('.imgSlide');
					  }, 3000);
				
					  // ******  탭 메뉴 공지사항 갤러리  ****** //
					  $(function(){
					  $('.tabMenu>li>a').click(function(){
					      $(this).parent().addClass("active").siblings().removeClass("active");
					    // return false;
					   /* return false를 반드시 적기.
					      버블링(bubbling) 때믄. 버블링이란?
					      한 요소에 이벤트가 발생하면,
					      이 요소에 할당된 핸들러가 동작하고,
					      이어서 부모 요소의 핸들러가 동작합니다.
				
					      가장 최상단의 조상 요소를 만날 때까지
					      이 과정이 반복되면서 요소 각각에 할당된 핸들러가 동작합니다.
				
					      이벤트가 제일 깊은 곳에 있는 요소에서 시작해 부모 요소를 거슬러 올라가며 발생하는 모양이 마치 물속 거품(bubble)과 닮았기 때문입니다.
				
					      클릭 이벤트를 중단하고, 호출한 곳으로 되돌아 가라~라는 의미.
					      a를 클릭했을 때, 부모의 요소도 클릭한것 처럼 처리가 되기때문에
					     HTML을 클릭 이전 상태로 되돌리기 위해서
					   */
					    });
					  });
				
				
					// 레이어 팝업
					  $('.notice li:first').click(function(){
					    $('#modalWrap').addClass("active");
					  });
					  $('.btn').click(function(){
					    $('#modalWrap').removeClass("active");
					  });
				
				
					});
			</script>
  			
<!-- top옆부분 -->
			<script>
				$(document).ready(function(){
				// 마우스오버 메뉴
				    $(this).find('.subMenu').stop().slideDown(300);
				  }).mouseout(function(){
				    $(this).find('.subMenu').stop().slideUp(300);
				  });
			
				// 이미지슬라이드 페이드 인 페이드 아웃
				  $('.imgSlide a:gt(0)').hide();
			
				  setInterval(function(){
				    $('.imgSlide a:first-child').fadeOut()
				    .next('a').fadeIn()
				    .end().appendTo('.imgSlide');
				  }, 3000);
			
				  // ******  탭 메뉴 공지사항 갤러리  ****** //
				  $(function(){
				  $('.tabMenu>li>a').click(function(){
				      $(this).parent().addClass("active").siblings().removeClass("active");
				    });
				  });
			
			
				// 레이어 팝업
				  $('.notice li:first').click(function(){
				    $('#modalWrap').addClass("active");
				  });
				  $('.btn').click(function(){
				    $('#modalWrap').removeClass("active");
				  });
			
			
				  }});
			</script>
			
<!-- top옆부분 jQuery -->
			
				<script>
			jQuery(document).ready(function(){
			  // ******  상단메뉴  ****** //
			  $('.navi>li').mouseover(function(){
				  $(this).find('.subMenu').stop().slideDown(500);
			  }).mouseout(function(){
				  $(this).find('.subMenu').stop().slideUp(500);
			  });
			
			  // ******  이미지 슬라이드  ****** //
			  $('.imgSlide a:gt(0)').hide();
			
			  setInterval(function(){
				$('.imgSlide a:first-child').fadeOut()
				   .next('a').fadeIn()
				   .end().appendTo('.imgSlide');},5000);
			
			  // ******  탭 메뉴 공지사항 갤러리  ****** //
			  $(function(){
			  $('.tabMenu>li>a').click(function(){
			      $(this).parent().addClass("active").siblings().removeClass("active");
			  	// return false;
			   /* return false를 반드시 적기.
			      버블링(bubbling) 때믄. 버블링이란?
			      한 요소에 이벤트가 발생하면,
			      이 요소에 할당된 핸들러가 동작하고,
			      이어서 부모 요소의 핸들러가 동작합니다.
			
			      가장 최상단의 조상 요소를 만날 때까지
			      이 과정이 반복되면서 요소 각각에 할당된 핸들러가 동작합니다.
			
			      이벤트가 제일 깊은 곳에 있는 요소에서 시작해 부모 요소를 거슬러 올라가며 발생하는 모양이 마치 물속 거품(bubble)과 닮았기 때문입니다.
			
			      클릭 이벤트를 중단하고, 호출한 곳으로 되돌아 가라~라는 의미.
			      a를 클릭했을 때, 부모의 요소도 클릭한것 처럼 처리가 되기때문에
			     HTML을 클릭 이전 상태로 되돌리기 위해서
			   */
			    });
			  });
			
			   // ******  Modal 팝업  ****** //
			
			  $(".notice li:first").click(function(){
				   $("#modalWrap").addClass("active");
			  });
			    $(".btn").click(function(){
				$("#modalWrap").removeClass("active");
			  });
			
			});
			</script>
			
			    <!-- main3에서 이미지 넘어가는 속도 -->
			<script>
			  document.addEventListener("DOMContentLoaded", function() {
			    var carousel = document.getElementById("carouselExampleControls");
			    var carouselInstance = new bootstrap.Carousel(carousel, {
			      interval: 4000  // 이미지를 넘어가는 시간(밀리초)
			    });
			  });
			</script>
  			
<!-- css시작 --> 			
			<style type="text/css">
      			  html,body{ margin:0; padding:0; width:100%; height:100%;}
      			  .box{ width:100%; height:100%; position:relative; color:#ffffff; font-size:24pt;}
 			
  					h3 {
   					 color: black;
 					 }
 			
				hr {
					border: none;
					height: 3px;
					background-color: gray;
					align:left;
				}
 			
  				.table-bordered {
				border-color: gray;
      			width: 80%;
  				}
 	
  				.h_wrap{
    				width: 100%;
   		 			height: 500px;
    				border: 1px white;
					}
 	
        		.line {
           	 	border-top: 1px solid black;
        		}
    
  				.box {
    				width: 100%;
				    height: 90%;
				    display: flex;
				    justify-content: center;
				    align-items: center;
				    text-align: center;
				    font-weight: bold;
				    color: white;
				    text-decoration: none;
				    background-size: cover;
				 	background-position: center;
				  }

			 	 .carousel-inner .carousel-item img {
			   		 object-fit: cover;
			   		 width: 500px;
			   		 height: 400px; /* 원하는 높이로 조정 */
			  	}
			</style>
	</head>
    
    <header2>
     <a class="logo" href="notlog_main.do"><img src="resources/img/ezenlogo2.png" alt="로고"></a>

      <ul class="navi2 custom-font">
        <li><a href="#">대학소개</a>
          <ul class="subMenu2">
              <li><a href="notlog_vision.do">비전</a></li>
              <li><a href="notlog_campusGuide.do">캠퍼스 안내</a></li>
            </ul>
        </li>
        <li><a href="#">입학 소개</a>
          <ul class="subMenu2">
              <li><a href="notlog_earlyDecision.do">입학 안내</a></li>
            </ul>
        </li>
        <li><a href="#">학사 소개</a>
          <ul class="subMenu2">
              <li><a href="notlog_schoolCalender.do">학사일정</a></li>
              <li><a href="notlog_courseRegistration.do">수강신청 안내</a></li>
              <li><a href="notlog_schoolScholarship.do">교내/교외장학</a></li>
              <li><a href="notlog_graduationRequirement.do">졸업요건</a></li>
              <li><a href="notlog_majorRelated.do">전공/교과</a></li>
              <li><a href="notlog_hyuhak.do">휴학/복학</a></li>
            </ul>
        </li>
        
        <li><a href="#">공지</a>
          <ul class="subMenu2">
              <li><a href="notlog_eventBoardList.do?page=1">공모`행사공지</a></li>
              <li><a href="notlog_scholarBoard.do?page=1">장학 공지</a></li>
              <li><a href="notlog_specialLectureBoardList.do?page=1">특강 공지</a></li>
              <li><a href="notlog_libraryBoardList.do?page=1">도서관공지</a></li>
            </ul>
        </li>
        
        <li><a href="#">Q&A게시판</a>
          <ul class="subMenu2">
              <li><a href="notlog_qnaBoard_list.do">자주 묻는 질문</a></li>
            </ul>
        </li>
        
        <li><a href="#">대학생활</a>
          <ul class="subMenu2">
              <li><a href="notlog_certificate_domestic.do">증명서 발급</a></li>
              <li><a href="notlog_studentClub.do">학생동아리</a></li>
            </ul>
        </li>
      </ul>
    </header2>
	
				
				