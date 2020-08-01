<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<!--
	Editorial by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>Inventory</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets/css/main.css" />
		<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
		
	<style>
/* 		nav#nav div#nav_box { font-size:14px; padding:10px; text-align:right; } */
/* 		nav#nav div#nav_box li { display:inline-block; margin:0 10px; } */
/* 		nav#nav div#nav_box li a { color:#333; } */
		
		nav#nav div#nav_box { font-size:14px; padding:10px; text-align:right; }
		nav#nav div#nav_box li { display:inline-block;}
		nav#nav div#nav_box li a { color:#333; }
	</style>	
<script type="text/javascript">
function goPage() {
	debugger;
		location.href="/category/boardList?n=" + 1;
	} 
</script>

	</head>
	<body>

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Main -->
					<div id="main">
						<div class="inner">

							<!-- Header -->
								<nav id="nav" style='padding: 0em 0 0em 0;'>
									<div id="nav_box">
										<%@ include file="include/nav.jsp" %>
									</div>
								</nav>
								<header id="header">
									<a href="/" class="logo"> INVENTORY by BroColy </a>
<!-- 									<ul class="icons"> -->
<!-- 										<li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li> -->
<!-- 										<li><a href="#" class="icon fa-facebook"><span class="label">Facebook</span></a></li> -->
<!-- 										<li><a href="#" class="icon fa-snapchat-ghost"><span class="label">Snapchat</span></a></li> -->
<!-- 										<li><a href="#" class="icon fa-instagram"><span class="label">Instagram</span></a></li> -->
<!-- 										<li><a href="#" class="icon fa-medium"><span class="label">Medium</span></a></li> -->
<!-- 									</ul> -->

								</header>
								
							<!-- Banner -->
<!-- 								<section id="banner"> -->
<!-- 									<div class="content"> -->

<!-- 								<nav id="nav"> -->
<!-- 									<div id="nav_box"> -->
<%-- 										<%@ include file="include/nav.jsp" %> --%>
<!-- 									</div> -->
<!-- 								</nav> -->
								<nav style='padding: 1em 0 0em 0;'>
									<c:if test="${member != null}">
									<div>
										<button type="button" onclick="location.href='/content/resist' ">새글쓰기</button>
									</div>
									</c:if>
								</nav>
								
								<section style='padding: 2em 0 3em 0;'>
									<div>
<%-- 										<%@ include file="content/list.jsp" %> --%>
asssssssssssssssssssssssssssssssssssssssssss
<!--     	 <table> -->
<!--                     <thead> -->
<!--                         <tr> -->
<!--                             <th>Entry11</th> -->
<!--                             <th>Entry</th> -->
<!--                             <th>Entry</th> -->
<!--                             <th>Entry</th> -->
<!--                             <th>Entry</th> -->
<!--                             <th>Entry</th> -->
<!--                         </tr> -->
<!--                     </thead> -->
<!--                     <tbody> -->
<!--                         <tr> -->
<!--                             <td>Sample</td> -->
<!--                             <td>Filter</td> -->
<!--                             <td>12-11-2011 11:11</td> -->
<!--                             <td>OK</td> -->
<!--                             <td>123</td> -->
<!--                             <td>Do some other</td> -->
<!--                         </tr> -->
<!--                         <tr> -->
<!--                             <td>Try</td> -->
<!--                             <td>It</td> -->
<!--                             <td>11-20-2013 08:56</td> -->
<!--                             <td>It</td> -->
<!--                             <td>Works</td> -->
<!--                             <td>Do some FILTERME</td> -->
<!--                         </tr> -->
<!--                         <tr> -->
<!--                             <td>§</td> -->
<!--                             <td>$</td> -->
<!--                             <td>%</td> -->
<!--                             <td>&</td> -->
<!--                             <td>/</td> -->
<!--                             <td>!</td> -->
<!--                         </tr> -->
<!--                     </tbody> -->
<!--                 </table> -->
									</div>
<!-- 									</div> -->
								</section>

							<!-- Section -->
<!-- 								<section> -->
<!-- 									<header class="major"> -->
<!-- 										<h2>Erat lacinia</h2> -->
<!-- 									</header> -->
<!-- 									<div class="features"> -->
<!-- 										<article> -->
<!-- 											<span class="icon fa-diamond"></span> -->
<!-- 											<div class="content"> -->
<!-- 												<h3>Portitor ullamcorper</h3> -->
<!-- 												<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p> -->
<!-- 											</div> -->
<!-- 										</article> -->
<!-- 										<article> -->
<!-- 											<span class="icon fa-paper-plane"></span> -->
<!-- 											<div class="content"> -->
<!-- 												<h3>Sapien veroeros</h3> -->
<!-- 												<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p> -->
<!-- 											</div> -->
<!-- 										</article> -->
<!-- 										<article> -->
<!-- 											<span class="icon fa-rocket"></span> -->
<!-- 											<div class="content"> -->
<!-- 												<h3>Quam lorem ipsum</h3> -->
<!-- 												<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p> -->
<!-- 											</div> -->
<!-- 										</article> -->
<!-- 										<article> -->
<!-- 											<span class="icon fa-signal"></span> -->
<!-- 											<div class="content"> -->
<!-- 												<h3>Sed magna finibus</h3> -->
<!-- 												<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p> -->
<!-- 											</div> -->
<!-- 										</article> -->
<!-- 									</div> -->
<!-- 								</section> -->

							<!-- Section -->
<!-- 								<section> -->
<!-- 									<header class="major"> -->
<!-- 										<h2>Ipsum sed dolor</h2> -->
<!-- 									</header> -->
<!-- 									<div class="posts"> -->
<!-- 										<article> -->
<!-- 											<a href="#" class="image"><img src="images/pic01.jpg" alt="" /></a> -->
<!-- 											<h3>Interdum aenean</h3> -->
<!-- 											<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p> -->
<!-- 											<ul class="actions"> -->
<!-- 												<li><a href="#" class="button">More</a></li> -->
<!-- 											</ul> -->
<!-- 										</article> -->
<!-- 										<article> -->
<!-- 											<a href="#" class="image"><img src="images/pic02.jpg" alt="" /></a> -->
<!-- 											<h3>Nulla amet dolore</h3> -->
<!-- 											<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p> -->
<!-- 											<ul class="actions"> -->
<!-- 												<li><a href="#" class="button">More</a></li> -->
<!-- 											</ul> -->
<!-- 										</article> -->
<!-- 										<article> -->
<!-- 											<a href="#" class="image"><img src="images/pic03.jpg" alt="" /></a> -->
<!-- 											<h3>Tempus ullamcorper</h3> -->
<!-- 											<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p> -->
<!-- 											<ul class="actions"> -->
<!-- 												<li><a href="#" class="button">More</a></li> -->
<!-- 											</ul> -->
<!-- 										</article> -->
<!-- 										<article> -->
<!-- 											<a href="#" class="image"><img src="images/pic04.jpg" alt="" /></a> -->
<!-- 											<h3>Sed etiam facilis</h3> -->
<!-- 											<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p> -->
<!-- 											<ul class="actions"> -->
<!-- 												<li><a href="#" class="button">More</a></li> -->
<!-- 											</ul> -->
<!-- 										</article> -->
<!-- 										<article> -->
<!-- 											<a href="#" class="image"><img src="images/pic05.jpg" alt="" /></a> -->
<!-- 											<h3>Feugiat lorem aenean</h3> -->
<!-- 											<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p> -->
<!-- 											<ul class="actions"> -->
<!-- 												<li><a href="#" class="button">More</a></li> -->
<!-- 											</ul> -->
<!-- 										</article> -->
<!-- 										<article> -->
<!-- 											<a href="#" class="image"><img src="images/pic06.jpg" alt="" /></a> -->
<!-- 											<h3>Amet varius aliquam</h3> -->
<!-- 											<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p> -->
<!-- 											<ul class="actions"> -->
<!-- 												<li><a href="#" class="button">More</a></li> -->
<!-- 											</ul> -->
<!-- 										</article> -->
<!-- 									</div> -->
<!-- 								</section> -->

						</div>
					</div>

				<!-- Sidebar -->
					<div id="sidebar">
						<div class="inner">

							<!-- Search -->
								<section id="search" class="alt">
									<form method="get" action="/category/keyText">
										<input type="text" name="boardTitle" id="boardTitle" placeholder="Search" />
										<input type="hidden" name="n" id="n" value="100" />
									</form>
								</section>

							<!-- Menu -->
								<nav id="menu">
									<header class="major">
										<h2>Menu</h2>
									</header>
									<ul>
										<li><a href="javascript:goPage()">전체 글목록</a></li>
										<li><a href="generic.html">JAVA</a></li>
										<li><a href="elements.html">JAVASCRIPT</a></li>
										<li>
											<span class="opener">SPRING</span>
											<ul>
												<li><a href="#">Lorem Dolor</a></li>
												<li><a href="#">Ipsum Adipiscing</a></li>
												<li><a href="#">Tempus Magna</a></li>
												<li><a href="#">Feugiat Veroeros</a></li>
											</ul>
										</li>
										<li><a href="#">HTML/CSS</a></li>
										<li><a href="#">ALGORISM</a></li>
										<li>
											<span class="opener">GIT</span>
											<ul>
												<li><a href="#">Lorem Dolor</a></li>
												<li><a href="#">Ipsum Adipiscing</a></li>
												<li><a href="#">Tempus Magna</a></li>
												<li><a href="#">Feugiat Veroeros</a></li>
											</ul>
										</li>
										<li><a href="#">시사</a></li>
										<li><a href="#">TIP</a></li>
										<li><a href="#">DATA BASE</a></li>
									</ul>
								</nav>

							<!-- Section -->
<!-- 								<section> -->
<!-- 									<header class="major"> -->
<!-- 										<h2>Ante interdum</h2> -->
<!-- 									</header> -->
<!-- 									<div class="mini-posts"> -->
<!-- 										<article> -->
<!-- 											<a href="#" class="image"><img src="images/pic07.jpg" alt="" /></a> -->
<!-- 											<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore aliquam.</p> -->
<!-- 										</article> -->
<!-- 										<article> -->
<!-- 											<a href="#" class="image"><img src="images/pic08.jpg" alt="" /></a> -->
<!-- 											<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore aliquam.</p> -->
<!-- 										</article> -->
<!-- 										<article> -->
<!-- 											<a href="#" class="image"><img src="images/pic09.jpg" alt="" /></a> -->
<!-- 											<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore aliquam.</p> -->
<!-- 										</article> -->
<!-- 									</div> -->
<!-- 									<ul class="actions"> -->
<!-- 										<li><a href="#" class="button">More</a></li> -->
<!-- 									</ul> -->
<!-- 								</section> -->

							<!-- Section -->
<!-- 								<section> -->
<!-- 									<header class="major"> -->
<!-- 										<h2>Get in touch</h2> -->
<!-- 									</header> -->
<!-- 									<p>Sed varius enim lorem ullamcorper dolore aliquam aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin sed aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p> -->
<!-- 									<ul class="contact"> -->
<!-- 										<li class="fa-envelope-o"><a href="#">information@untitled.tld</a></li> -->
<!-- 										<li class="fa-phone">(000) 000-0000</li> -->
<!-- 										<li class="fa-home">1234 Somewhere Road #8254<br /> -->
<!-- 										Nashville, TN 00000-0000</li> -->
<!-- 									</ul> -->
<!-- 								</section> -->

							<!-- Footer -->
								<footer id="footer">
									<p class="copyright">&copy; Untitled. All rights reserved. Demo Images: <a href="https://unsplash.com">Unsplash</a>. Design: <a href="https://html5up.net">HTML5 UP</a>.</p>
								</footer>

						</div>
					</div>

			</div>

		<!-- Scripts -->
			<script src="<%=request.getContextPath()%>/resources/assets/js/jquery.min.js"></script>
			<script src="<%=request.getContextPath()%>/resources/assets/js/skel.min.js"></script>
			<script src="<%=request.getContextPath()%>/resources/assets/js/util.js"></script>
			<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="<%=request.getContextPath()%>/resources/assets/js/main.js"></script>

	</body>
</html>