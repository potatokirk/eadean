<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지</title>
<%
request.setCharacterEncoding("utf-8");
%>
<style>
@import
'../css/css_mainPage.css'
</style>
<link rel="shortcut icon" type="image/x-icon" href="./img/favicon.ico" />
<link rel="stylesheet"
	href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css" />
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css" />
<link rel="stylesheet" href="./css/css_common.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<script src="https://kit.fontawesome.com/20962f3e4b.js"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<script>
        $(document).ready(function () {
            $(".slider > ul").bxSlider({
                easing: "linear",
            });
        });

        $(function () {
            var best = $("aside > .best");

            $(window).scroll(function () {
                var t = $(this).scrollTop();

                if (t > 620) {
                best.css({
                    position: "fixed",
                    top: "0",
                });
                } else {
                best.css({ position: "static" });
                }
            });
        });
        
        // 자동으로 넘어가는 함수
        function autoSlide() {
            const slider = document.querySelector('.slider ul');
            const slides = document.querySelectorAll('.slider ul li');
            const slideWidth = slides[0].clientWidth;

            // 첫 번째 슬라이드를 마지막으로 이동시키는 애니메이션을 추가합니다.
            slider.style.transition = 'transform 1s ease-in-out';
            slider.style.transform = `translateX(${-slideWidth}px)`;

            // 5초마다 자동으로 넘어가도록 설정합니다.
            setInterval(() => {
                // 현재 슬라이더의 위치를 가져옵니다.
                const currentTranslate = parseInt(slider.style.transform.split('(')[1]) || 0;

                // 다음 슬라이드로 이동시킵니다.
                slider.style.transition = 'transform 1s ease-in-out';
                slider.style.transform = `translateX(${currentTranslate - slideWidth}px)`;

                // 슬라이더의 마지막 슬라이드일 경우, 첫 번째 슬라이드로 되돌립니다.
                if (currentTranslate == -(slides.length - 1) * slideWidth) {
                    setTimeout(() => {
                        slider.style.transition = 'none';
                        slider.style.transform = `translateX(0)`;
                    }, 1000);
                }
            }, 5000);
        }

        // 문서가 로드되면 슬라이드 함수를 호출합니다.
        document.addEventListener('DOMContentLoaded', autoSlide);

    </script>
</head>
<body>
	<div id="wrapper">
		<header>
			<%@include file="../views/header.jsp"%>
		</header>
		<main>
			<aside>
				<ul class="category">
					<li><i class="fa fa-bars" aria-hidden="true"></i>카테고리</li>
					<li><a href="#"> <i class="fas fa-tshirt"
							aria-hidden="true"></i>패션·의류·뷰티 <i class="fas fa-angle-right"
							aria-hidden="true"> </i>
					</a>
						<ol>
							<li><a href="#">남성의류</a></li>
							<li><a href="#">여성의류</a></li>
							<li><a href="#">잡화</a></li>
							<li><a href="#">뷰티</a></li>
						</ol></li>
					<li><a href="#"> <i class="fas fa-laptop"
							aria-hidden="true"></i>가전·디지털 <i class="fas fa-angle-right"
							aria-hidden="ture"> </i>
					</a>
						<ol>
							<li><a href="#">노트북/PC</a></li>
							<li><a href="#">가전</a></li>
							<li><a href="#">휴대폰</a></li>
							<li><a href="#">기타</a></li>
						</ol></li>
					<li><a href="#"> <i class="fas fa-utensils"
							aria-hidden="true"></i>식품·생필품 <i class="fas fa-angle-right"
							aria-hidden="ture"> </i>
					</a>
						<ol>
							<li><a href="#">신선식품</a></li>
							<li><a href="#">가공식품</a></li>
							<li><a href="#">건강식품</a></li>
							<li><a href="#">생필품</a></li>
						</ol></li>
					<li><a href="#"> <i class="fas fa-home" aria-hidden="true"></i>홈·문구·취미
							<i class="fas fa-angle-right" aria-hidden="ture"> </i>
					</a>
						<ol>
							<li><a href="#">가구/DIY</a></li>
							<li><a href="#">침구·커튼</a></li>
							<li><a href="#">생활용품</a></li>
							<li><a href="#">사무용품</a></li>
						</ol></li>
				</ul>
				<article class="best">
					<h1>
						<i class="fas fa-crown" aria-hidden="true"></i> 베스트상품
					</h1>
					<ol>
						<li><a href="#">
								<div class="thumb">
									<i>1</i> <img src="https://via.placeholder.com/230" alt="item1">
								</div>
								<h2>상품명</h2>
								<div class="org_price">
									<del>30,000</del>
									<span> 10% </span>
								</div>
								<div class="dis_price">
									<ins> 27,000 </ins>
								</div>
						</a></li>
						<li><a href="#">
								<div class="thumb">
									<i>2</i> <img src="https://via.placeholder.com/50" alt="item1">
								</div>
								<article>
									<h2>상품명</h2>
									<div class="org_price">
										<del>30,000</del>
										<span> 10% </span>
									</div>
									<div class="dis_price">
										<ins> 27,000 </ins>
									</div>
								</article>
						</a></li>
						<li><a href="#">
								<div class="thumb">
									<i>3</i> <img src="https://via.placeholder.com/50" alt="item1">
								</div>
								<article>
									<h2>상품명</h2>
									<div class="org_price">
										<del>30,000</del>
										<span> 10% </span>
									</div>
									<div class="dis_price">
										<ins> 27,000 </ins>
									</div>
								</article>
						</a></li>
						<li><a href="#">
								<div class="thumb">
									<i>4</i> <img src="https://via.placeholder.com/50" alt="item1">
								</div>
								<article>
									<h2>상품명</h2>
									<div class="org_price">
										<del>30,000</del>
										<span> 10% </span>
									</div>
									<div class="dis_price">
										<ins> 27,000 </ins>
									</div>
								</article>
						</a></li>
						<li><a href="#">
								<div class="thumb">
									<i>5</i> <img src="https://via.placeholder.com/50" alt="item1">
								</div>
								<article>
									<h2>상품명</h2>
									<div class="org_price">
										<del>30,000</del>
										<span> 10% </span>
									</div>
									<div class="dis_price">
										<ins> 27,000 </ins>
									</div>
								</article>
						</a></li>
					</ol>
				</article>
			</aside>

			<section>
				<!-- 슬라이더 영역 -->
				<section class="slider">
					<ul>
						<li><a href="#"> <img src="images/clothes1.png"
								alt="item1" width="985" height="447" /></a></li>

						<li><a href="#"><img
								src="images/clothes2.png" alt="item2" width="985" height="447" /></a>
						</li>

						<li><a href="#"> <img src="images/clothes3.png"
								alt="item3" width="985" height="447" /></a></li>
						<li><a href="#"> <img src="images/clothes1.png"
								alt="item4" width="985" height="447" /></a></li>

						<li><a href="#"> <img src="images/clothes2.png"
								alt="item5" width="985" height="447" /></a></li>
					</ul>
				</section>

				<!-- 히트상품 영역 -->
				<section class="hit">
					<h3>
						<span>히트상품</span>
					</h3>
					<article>
						<a href="#">
							<div class="thumb">
								<img src="https://via.placeholder.com/230X230" alt="t1">
							</div>
							<h2>상품명</h2>
							<p>간단한 상품 설명</p>
							<div class="org_price">
								<del>30,000</del>
								<span> 10% </span>
							</div>
							<div class="dis_price">
								<ins> 27,000 </ins>
								<span class="free">무료배송</span>
							</div>
						</a>
					</article>
					<article>
						<a href="#">
							<div class="thumb">
								<img src="https://via.placeholder.com/230X230" alt="t1">
							</div>
							<h2>상품명</h2>
							<p>간단한 상품 설명</p>
							<div class="org_price">
								<del>30,000</del>
								<span> 10% </span>
							</div>
							<div class="dis_price">
								<ins> 27,000 </ins>
								<span class="free">무료배송</span>
							</div>
						</a>
					</article>
					<article>
						<a href="#">
							<div class="thumb">
								<img src="https://via.placeholder.com/230X230" alt="t1">
							</div>
							<h2>상품명</h2>
							<p>간단한 상품 설명</p>
							<div class="org_price">
								<del>30,000</del>
								<span> 10% </span>
							</div>
							<div class="dis_price">
								<ins> 27,000 </ins>
								<span class="free">무료배송</span>
							</div>
						</a>
					</article>
					<article>
						<a href="#">
							<div class="thumb">
								<img src="https://via.placeholder.com/230X230" alt="t1">
							</div>
							<h2>상품명</h2>
							<p>간단한 상품 설명</p>
							<div class="org_price">
								<del>30,000</del>
								<span> 10% </span>
							</div>
							<div class="dis_price">
								<ins> 27,000 </ins>
								<span class="free">무료배송</span>
							</div>
						</a>
					</article>
					<article>
						<a href="#">
							<div class="thumb">
								<img src="https://via.placeholder.com/230X230" alt="t1">
							</div>
							<h2>상품명</h2>
							<p>간단한 상품 설명</p>
							<div class="org_price">
								<del>30,000</del>
								<span> 10% </span>
							</div>
							<div class="dis_price">
								<ins> 27,000 </ins>
								<span class="free">무료배송</span>
							</div>
						</a>
					</article>
					<article>
						<a href="#">
							<div class="thumb">
								<img src="https://via.placeholder.com/230X230" alt="t1">
							</div>
							<h2>상품명</h2>
							<p>간단한 상품 설명</p>
							<div class="org_price">
								<del>30,000</del>
								<span> 10% </span>
							</div>
							<div class="dis_price">
								<ins> 27,000 </ins>
								<span class="free">무료배송</span>
							</div>
						</a>
					</article>
					<article>
						<a href="#">
							<div class="thumb">
								<img src="https://via.placeholder.com/230X230" alt="t1">
							</div>
							<h2>상품명</h2>
							<p>간단한 상품 설명</p>
							<div class="org_price">
								<del>30,000</del>
								<span> 10% </span>
							</div>
							<div class="dis_price">
								<ins> 27,000 </ins>
								<span class="free">무료배송</span>
							</div>
						</a>
					</article>
					<article>
						<a href="#">
							<div class="thumb">
								<img src="https://via.placeholder.com/230X230" alt="t1">
							</div>
							<h2>상품명</h2>
							<p>간단한 상품 설명</p>
							<div class="org_price">
								<del>30,000</del>
								<span> 10% </span>
							</div>
							<div class="dis_price">
								<ins> 27,000 </ins>
								<span class="free">무료배송</span>
							</div>
						</a>
					</article>
				</section>
				<!-- 추천상품 영역 -->
				<section class="recommend">
					<h3>
						<span>추천상품</span>
					</h3>
					<article>
						<a href="#">
							<div class="thumb">
								<img src="https://via.placeholder.com/230X230" alt="t1">
							</div>
							<h2>상품명</h2>
							<p>간단한 상품 설명</p>
							<div class="org_price">
								<del>30,000</del>
								<span> 10% </span>
							</div>
							<div class="dis_price">
								<ins> 27,000 </ins>
								<span>배송비 2500</span>
							</div>
						</a>
					</article>
					<article>
						<a href="#">
							<div class="thumb">
								<img src="https://via.placeholder.com/230X230" alt="t1">
							</div>
							<h2>상품명</h2>
							<p>간단한 상품 설명</p>
							<div class="org_price">
								<del>30,000</del>
								<span> 10% </span>
							</div>
							<div class="dis_price">
								<ins> 27,000 </ins>
								<span>배송비 2500</span>
							</div>
						</a>
					</article>
					<article>
						<a href="#">
							<div class="thumb">
								<img src="https://via.placeholder.com/230X230" alt="t1">
							</div>
							<h2>상품명</h2>
							<p>간단한 상품 설명</p>
							<div class="org_price">
								<del>30,000</del>
								<span> 10% </span>
							</div>
							<div class="dis_price">
								<ins> 27,000 </ins>
								<span>배송비 2500</span>
							</div>
						</a>
					</article>
					<article>
						<a href="#">
							<div class="thumb">
								<img src="https://via.placeholder.com/230X230" alt="t1">
							</div>
							<h2>상품명</h2>
							<p>간단한 상품 설명</p>
							<div class="org_price">
								<del>30,000</del>
								<span> 10% </span>
							</div>
							<div class="dis_price">
								<ins> 27,000 </ins>
								<span>배송비 2500</span>
							</div>
						</a>
					</article>
					<article>
						<a href="#">
							<div class="thumb">
								<img src="https://via.placeholder.com/230X230" alt="t1">
							</div>
							<h2>상품명</h2>
							<p>간단한 상품 설명</p>
							<div class="org_price">
								<del>30,000</del>
								<span> 10% </span>
							</div>
							<div class="dis_price">
								<ins> 27,000 </ins>
								<span>배송비 2500</span>
							</div>
						</a>
					</article>
					<article>
						<a href="#">
							<div class="thumb">
								<img src="https://via.placeholder.com/230X230" alt="t1">
							</div>
							<h2>상품명</h2>
							<p>간단한 상품 설명</p>
							<div class="org_price">
								<del>30,000</del>
								<span> 10% </span>
							</div>
							<div class="dis_price">
								<ins> 27,000 </ins>
								<span>배송비 2500</span>
							</div>
						</a>
					</article>
					<article>
						<a href="#">
							<div class="thumb">
								<img src="https://via.placeholder.com/230X230" alt="t1">
							</div>
							<h2>상품명</h2>
							<p>간단한 상품 설명</p>
							<div class="org_price">
								<del>30,000</del>
								<span> 10% </span>
							</div>
							<div class="dis_price">
								<ins> 27,000 </ins>
								<span>배송비 2500</span>
							</div>
						</a>
					</article>
					<article>
						<a href="#">
							<div class="thumb">
								<img src="https://via.placeholder.com/230X230" alt="t1">
							</div>
							<h2>상품명</h2>
							<p>간단한 상품 설명</p>
							<div class="org_price">
								<del>30,000</del>
								<span> 10% </span>
							</div>
							<div class="dis_price">
								<ins> 27,000 </ins>
								<span>배송비 2500</span>
							</div>
						</a>
					</article>
				</section>
				<section class="new">
					<h3>
						<span>최신상품</span>
					</h3>
					<article>
						<a href="#">
							<div class="thumb">
								<img src="https://via.placeholder.com/230X230" alt="t1">
							</div>
							<h2>상품명</h2>
							<p>간단한 상품 설명</p>
							<div class="org_price">
								<del>30,000</del>
								<span> 10% </span>
							</div>
							<div class="dis_price">
								<ins> 27,000 </ins>
								<span class="free">무료배송</span>
							</div>
						</a>
					</article>
					<article>
						<a href="#">
							<div class="thumb">
								<img src="https://via.placeholder.com/230X230" alt="t1">
							</div>
							<h2>상품명</h2>
							<p>간단한 상품 설명</p>
							<div class="org_price">
								<del>30,000</del>
								<span> 10% </span>
							</div>
							<div class="dis_price">
								<ins> 27,000 </ins>
								<span class="free">무료배송</span>
							</div>
						</a>
					</article>
					<article>
						<a href="#">
							<div class="thumb">
								<img src="https://via.placeholder.com/230X230" alt="t1">
							</div>
							<h2>상품명</h2>
							<p>간단한 상품 설명</p>
							<div class="org_price">
								<del>30,000</del>
								<span> 10% </span>
							</div>
							<div class="dis_price">
								<ins> 27,000 </ins>
								<span class="free">무료배송</span>
							</div>
						</a>
					</article>
					<article>
						<a href="#">
							<div class="thumb">
								<img src="https://via.placeholder.com/230X230" alt="t1">
							</div>
							<h2>상품명</h2>
							<p>간단한 상품 설명</p>
							<div class="org_price">
								<del>30,000</del>
								<span> 10% </span>
							</div>
							<div class="dis_price">
								<ins> 27,000 </ins>
								<span class="free">무료배송</span>
							</div>
						</a>
					</article>
					<article>
						<a href="#">
							<div class="thumb">
								<img src="https://via.placeholder.com/230X230" alt="t1">
							</div>
							<h2>상품명</h2>
							<p>간단한 상품 설명</p>
							<div class="org_price">
								<del>30,000</del>
								<span> 10% </span>
							</div>
							<div class="dis_price">
								<ins> 27,000 </ins>
								<span class="free">무료배송</span>
							</div>
						</a>
					</article>
					<article>
						<a href="#">
							<div class="thumb">
								<img src="https://via.placeholder.com/230X230" alt="t1">
							</div>
							<h2>상품명</h2>
							<p>간단한 상품 설명</p>
							<div class="org_price">
								<del>30,000</del>
								<span> 10% </span>
							</div>
							<div class="dis_price">
								<ins> 27,000 </ins>
								<span class="free">무료배송</span>
							</div>
						</a>
					</article>
					<article>
						<a href="#">
							<div class="thumb">
								<img src="https://via.placeholder.com/230X230" alt="t1">
							</div>
							<h2>상품명</h2>
							<p>간단한 상품 설명</p>
							<div class="org_price">
								<del>30,000</del>
								<span> 10% </span>
							</div>
							<div class="dis_price">
								<ins> 27,000 </ins>
								<span class="free">무료배송</span>
							</div>
						</a>
					</article>
					<article>
						<a href="#">
							<div class="thumb">
								<img src="https://via.placeholder.com/230X230" alt="t1">
							</div>
							<h2>상품명</h2>
							<p>간단한 상품 설명</p>
							<div class="org_price">
								<del>30,000</del>
								<span> 10% </span>
							</div>
							<div class="dis_price">
								<ins> 27,000 </ins>
								<span class="free">무료배송</span>
							</div>
						</a>
					</article>
				</section>
				<section class="discount">
					<h3>
						<span>할인상품</span>
					</h3>
					<article>
						<a href="#">
							<div class="thumb">
								<img src="https://via.placeholder.com/230X230" alt="t1">
							</div>
							<h2>상품명</h2>
							<p>간단한 상품 설명</p>
							<div class="org_price">
								<del>30,000</del>
								<span> 10% </span>
							</div>
							<div class="dis_price">
								<ins> 27,000 </ins>
								<span class="free">무료배송</span>
							</div>
						</a>
					</article>
					<article>
						<a href="#">
							<div class="thumb">
								<img src="https://via.placeholder.com/230X230" alt="t1">
							</div>
							<h2>상품명</h2>
							<p>간단한 상품 설명</p>
							<div class="org_price">
								<del>30,000</del>
								<span> 10% </span>
							</div>
							<div class="dis_price">
								<ins> 27,000 </ins>
								<span class="free">무료배송</span>
							</div>
						</a>
					</article>
					<article>
						<a href="#">
							<div class="thumb">
								<img src="https://via.placeholder.com/230X230" alt="t1">
							</div>
							<h2>상품명</h2>
							<p>간단한 상품 설명</p>
							<div class="org_price">
								<del>30,000</del>
								<span> 10% </span>
							</div>
							<div class="dis_price">
								<ins> 27,000 </ins>
								<span class="free">무료배송</span>
							</div>
						</a>
					</article>
					<article>
						<a href="#">
							<div class="thumb">
								<img src="https://via.placeholder.com/230X230" alt="t1">
							</div>
							<h2>상품명</h2>
							<p>간단한 상품 설명</p>
							<div class="org_price">
								<del>30,000</del>
								<span> 10% </span>
							</div>
							<div class="dis_price">
								<ins> 27,000 </ins>
								<span class="free">무료배송</span>
							</div>
						</a>
					</article>
					<article>
						<a href="#">
							<div class="thumb">
								<img src="https://via.placeholder.com/230X230" alt="t1">
							</div>
							<h2>상품명</h2>
							<p>간단한 상품 설명</p>
							<div class="org_price">
								<del>30,000</del>
								<span> 10% </span>
							</div>
							<div class="dis_price">
								<ins> 27,000 </ins>
								<span class="free">무료배송</span>
							</div>
						</a>
					</article>
					<article>
						<a href="#">
							<div class="thumb">
								<img src="https://via.placeholder.com/230X230" alt="t1">
							</div>
							<h2>상품명</h2>
							<p>간단한 상품 설명</p>
							<div class="org_price">
								<del>30,000</del>
								<span> 10% </span>
							</div>
							<div class="dis_price">
								<ins> 27,000 </ins>
								<span class="free">무료배송</span>
							</div>
						</a>
					</article>
					<article>
						<a href="#">
							<div class="thumb">
								<img src="https://via.placeholder.com/230X230" alt="t1">
							</div>
							<h2>상품명</h2>
							<p>간단한 상품 설명</p>
							<div class="org_price">
								<del>30,000</del>
								<span> 10% </span>
							</div>
							<div class="dis_price">
								<ins> 27,000 </ins>
								<span class="free">무료배송</span>
							</div>
						</a>
					</article>
					<article>
						<a href="#">
							<div class="thumb">
								<img src="https://via.placeholder.com/230X230" alt="t1">
							</div>
							<h2>상품명</h2>
							<p>간단한 상품 설명</p>
							<div class="org_price">
								<del>30,000</del>
								<span> 10% </span>
							</div>
							<div class="dis_price">
								<ins> 27,000 </ins>
								<span class="free">무료배송</span>
							</div>
						</a>
					</article>
				</section>
			</section>
		</main>
		<footer>
			<ul>
				<li><a href="#">회사소개</a></li>
				<li><a href="#">서비스이용약관</a></li>
				<li><a href="#">개인정보처리방침</a></li>
				<li><a href="#">전자금융거래약관</a></li>
			</ul>
			<div>
				<p>
					<img src="./images/main.png" alt="푸터로고" width="220" height="75">
				</p>
				<p>
					<strong>(주)EADEAN</strong> <br> 부산시 수영구 어딘가의 어딘가 <br>
					대표이사 : 박기태 <br> 사업자등록번호 : <br> 통신판매업신고 :
				</p>
				<p>
					<strong>고객센터</strong> <br> Tel : 1234-5678 (평일 09:00~18:00) <br>
					스마일클럽/SVIP 전용 : 1522-5700 (365일 09:00~18:00) <br> 부산광역시 부산진구
					중앙대로 712 수양빌딩 8층 <br> Fax : 051-123-4567 | Mail :
					rlxoa456@hanmail.net <br>
				</p>
			</div>
		</footer>
		<button type="button" id="top">상단이동</button>
	</div>

</body>
</html>