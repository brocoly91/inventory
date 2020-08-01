<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/SE2/js/HuskyEZCreator.js" charset="utf-8"></script>
<!-- jQuery를 사용하기위해 jQuery라이브러리 추가 -->
<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.0.min.js"></script>

<script type="text/javascript">
var oEditors = [];
$(function(){
      nhn.husky.EZCreator.createInIFrame({
          oAppRef: oEditors,
          elPlaceHolder: "ir1", //textarea에서 지정한 id와 일치해야 합니다. 
          //SmartEditor2Skin.html 파일이 존재하는 경로
          sSkinURI: "<%=request.getContextPath()%>/resources/SE2/SmartEditor2Skin.html",  
          htParams : {
              // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
              bUseToolbar : true,             
              // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
              bUseVerticalResizer : true,     
              // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
              bUseModeChanger : true,         
              fOnBeforeUnload : function(){
                   
              }
          }, 
          fOnAppLoad : function(){
              //기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
              oEditors.getById["ir1"].exec("PASTE_HTML", [""]);
          },
          fCreator: "createSEditor2"
      });
      
      //저장버튼 클릭시 호출 함수
      $("#btnModify").click(function(){
    	 debugger;
    	  var boardTitle = $("#boardTitle").val()
    	  var boardContens = oEditors.getById["ir1"].getIR();
    	  
    	  if(boardTitle == "" || boardTitle == null || boardContens == null || boardContens == ""){
    		  alert("제목과 내용을 입력해 주세요");
    		  document.save.boardTitle.focus();
    		  return false;
    	  }
    	  
          oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
          var confirm_test = confirm("수정 하시겟습니까?");
          
          if ( confirm_test == false  ) {
          	return false;
          } 
        
          $("#modify").submit();
          
      });    
      //목록버튼 클릭시 호출 함수
      $("#btnList").click(function(){
    	  location.href="/category/boardList?n=" + 1;
       });    
      //삭제버튼 클릭시 호출 함수
//       $("#btnDel").click(function(){
//           var confirm_test = confirm("삭제 하시겟습니까?");
          
//           if ( confirm_test == false  ) {
//           	return false;
//           } 
// //     	  location.href="/category/boardList?n=" + 3 +"&boardNo="+${modify.boardNo};
//     	  location.href="/category/boardDelete?boardNo=" +${modify.boardNo};
//        });    
      
		$("#btnDel").click(function(){
			var confirm_val = confirm("정말 삭제하시겠습니까?");
			
			if(confirm_val) {
					
				$.ajax({
					url : "/category/boardDelete",
					type : "post",
					data : { boardNo : '${modify.boardNo}' },
					success : function(result){
// 						location.href="/category/boardList?n=" + 3
						location.href="/"
					}
				});
			}	
		});
});
</script>
		
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
	
$(document).ready(function(){	
	
	$("#boardCategory").val(${modify.boardCategory}).prop("selected", true);

});

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
										<%@ include file="../include/nav.jsp" %>
									</div>
								</nav>
								<header id="header">
									<a href="/" class="logo"> INVENTORY by BroColy</a>
								</header>
								
								
							<section style='padding: 2em 0 3em 0;'>
								<div class="container" role="main">
									<form  id="modify" name="save" role="form" method="get" action="/category/boardList">
									<div class="mb-3">
										<select name="boardCategory" id="boardCategory">
											<option value="000">게시판을 선택하여 주세요</option>
											<option value="100" <c:if test="${modify.boardCategory}"> selected </c:if>>JAVA</option>
											<option value="200">JAVASCRIPT</option>
											<option value="300">SPRING</option>
											<option value="400">HTML/CSS</option>
											<option value="500">ALGORISM</option>
											<option value="600">GIT</option>
											<option value="700">시사</option>
											<option value="800">TIP</option>
											<option value="900">DATABASE</option>
										</select>
										
									</div>
									<input type="hidden" name="n" id="n" value="2">
										<div class="mb-3">
											<label for="title">제목</label> 
											<input type="text" class="form-control" name="boardTitle" id="boardTitle" value="${modify.boardTitle}">
											<input type="hidden" class="form-control" name="boardNo" id="boardTitle" value="${modify.boardNo}">
										</div>
										<div class="mb-3">
											<label for="content" style="margin: 10px 0 1em 0;">내용</label>
											<textarea class="form-control" id="ir1" rows="15" name="boardContens" id="boardContens" style="width:100%";>
												<c:out value="${modify.boardContens}"/>
											</textarea>
										</div>
									</form>
									<div>
										<button type="submit" id="btnModify">저장</button>
										<button id="btnDel">삭제</button>
										<button id="btnList">목록</button>
									</div>
								</div>
							</section>
						</div>
					</div>

				<!-- Sidebar -->
					<div id="sidebar">
						<div class="inner">

							<!-- Search -->
								<section id="search" class="alt">
									<form method="get" action="/category/boardList">
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