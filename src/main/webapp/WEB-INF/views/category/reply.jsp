<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>

<jsp:useBean id="toDay" class="java.util.Date" />


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
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/assets/css/main.css" />
<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->

<style>
/* 		nav#nav div#nav_box { font-size:14px; padding:10px; text-align:right; } */
/* 		nav#nav div#nav_box li { display:inline-block; margin:0 10px; } */
/* 		nav#nav div#nav_box li a { color:#333; } */
nav#nav div#nav_box {
	font-size: 14px;
	padding: 10px;
	text-align: right;
}

nav#nav div#nav_box li {
	display: inline-block;
}

nav#nav div#nav_box li a {
	color: #333;
}

/* The Modal (background) */
.searchModal {
display: none; /* Hidden by default */
position: fixed; /* Stay in place */
z-index: 10; /* Sit on top */
left: 0;
top: 0;
width: 100%; /* Full width */
height: 100%; /* Full height */
overflow: auto; /* Enable scroll if needed */
background-color: rgb(0,0,0); /* Fallback color */
background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}
/* Modal Content/Box */
.search-modal-content {
background-color: #fefefe;
margin: 15% auto; /* 15% from the top and centered */
padding: 20px;
border: 1px solid #888;
width: 70%; /* Could be more or less, depending on screen size */
}
#close { 
float:right; display:inline-block; padding:2px 5px; font-weight: 700; text-shadow: 0 1px 0 #fff; font-size: 1.7rem; 
} 
#close:hover { 
border: 0; cursor:pointer; opacity: .75; 
}

</style>


<!-- Scripts -->
<script
	src="<%=request.getContextPath()%>/resources/assets/js/jquery.min.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/assets/js/skel.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/assets/js/util.js"></script>
<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
<script src="<%=request.getContextPath()%>/resources/assets/js/main.js"></script>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.0.min.js" ></script>
<script type="text/javascript">
	function goPage() {
		location.href = "/category/boardList?n=" + 1;
	}
	
	function myFunction(rno,replyer,replytext,regdate) {
		debugger;

		document.getElementById('replyNo').value = rno;
		document.getElementById('replyText').value = replytext;
		document.getElementById('replyreplyer').value = replyer;
		document.getElementById('replyRegdate').value = regdate;
		$("#modal").show();
	}
	
	function rplRpl(val) {
		document.getElementById('modalReplyNo').value = val;
		document.getElementById('replyreplyer').value = "${member.userId}";
		$("#modalReply").show();
	};
	
	function deleteReply(val) {
// 		alert("deleteReply"+ val);
		
        var confirm_test = confirm("정말 삭제하시겟습니까?");
        
        if ( confirm_test == false  ) {
        	return false;
        } 
        
		var replyNo = val;
		
		var param = {
				"rno" : replyNo
			};
		
		$.ajax({
			type : "post", //데이터를 보낼 방식 
			url : "${pageContext.request.contextPath}/category/deleteReply.do", //데이터를 보낼 url 
			data : param, //보낼 데이터 -->

			success : function() { //데이터를 보내는것이 성공했을시 출력되는 메시지 
				alert("댓글이 삭제되엇습니다.");
				location.reload();   
			}
		});
		
	};
	
// 	function myFunction2() {
// 		var t = document.getElementById('modal2').value;
// 		document.getElementById('bookId2').value = t;
// 	}
	function closeModal() {
		$('.searchModal').hide();
		location.reload();   
	};
	
	function closeModalnologic() {
		$('.searchModal').hide();
// 		location.reload();   
	};
	
	$(document).ready(function(){
		var ID = '${member.userId}'
		listReply()
		//댓글 목록 출력 함수
		
		function listReply() {
			$.ajax({
						type : "get",
						contentType : "application/json",
						url : "${pageContext.request.contextPath}/category/list.do?boardNo=${boardContent.boardNo}",
						success : function(retVal) {
							var output = "<table>";
							for ( var i in retVal.list) {
								if(retVal.list[i].replyer == ID){
									output += "<tr style='text-align:left;'>";
									output += "<td style='width:100%;'>";
									output += retVal.list[i].replyer;
									output += '   (' + retVal.list[i].regdate + ')';
									output += "<br><br>";
									output += "<textarea rows='4' readonly cols='150' style='resize: vertical;'>'"+retVal.list[i].replytext+"'</textarea>"
									output += "<br>";
									output += "<input type='hidden' id='modal' name='modal2' value='"+retVal.list[i].rno+"' style='padding: 3px 6px;font-size: 13px;'/>"
									output += "<input type='hidden' id='modal3' name='modal3' value='"+retVal.list[i].replyer+"' style='padding: 3px 6px;font-size: 13px;'/>"
									output += "<input type='hidden' id='modal4' name='modal4' value='"+retVal.list[i].regdate+"' style='padding: 3px 6px;font-size: 13px;'/>"
									output += '<button type="button" id="modal" onclick="myFunction(\''+retVal.list[i].rno+'\',\''+retVal.list[i].replyer+'\',\''+retVal.list[i].replytext+'\',\''+retVal.list[i].regdate+'\')"  value='+retVal.list[i].rno+'  style="padding: 3px 6px;font-size: 13px;">수정</button>'
									output += "&nbsp;"
									output += "<button type='button'id='deleteReply' onclick='deleteReply(this.value)' value='"+retVal.list[i].rno+"' style='padding: 3px 6px;font-size: 13px;'>삭제</button>"
									output += "&nbsp;"
									//output += "<button type='button'id='rplRpl' onclick='rplRpl(this.value)' value='"+retVal.list[i].rno+"' style='padding: 3px 6px;font-size: 13px;'>답글</button>"
									output += "</td>";
									output += "</tr>";
								}else{
									output += "<tr style='text-align:left;'>";
									output += "<td style='width:100%;'>";
									output += retVal.list[i].replyer;
									output += '   (' + retVal.list[i].regdate + ')';
									output += "<br><br>";
									output += "<textarea rows='4' readonly cols='150' style='resize: vertical;'>'"+retVal.list[i].replytext+"'</textarea>"
									output += "<br>";
									output += "<input type='hidden' id='modal2'  value='"+retVal.list[i].rno+"' style='padding: 3px 6px;font-size: 13px;'/>"
									output += "<input type='hidden' id='modal3'  value='"+retVal.list[i].replyer+"' style='padding: 3px 6px;font-size: 13px;'/>"
									output += "<input type='hidden' id='modal4'  value='"+retVal.list[i].regdate+"' style='padding: 3px 6px;font-size: 13px;'/>"
									output += "&nbsp;"
									output += "</td>";
									output += "</tr>";
								}
							}
							output += "</table>";
							$("#listReply").append(output);
		
						}
					});
		}
		
		
		$("#btnReply").click(
				function() {
					var replytext = $("#replytext").val(); //댓글 내용 
					var boardNo = $("#boardNo").val();
					var param = {
						"replytext" : replytext,
						"boardNo" : boardNo
					};
					//var param="replytext="+replytext+"&bno="+bno; 
					$.ajax({
								type : "post", //데이터를 보낼 방식 
								url : "${pageContext.request.contextPath}/category/insert.do", //데이터를 보낼 url 
								data : param, //보낼 데이터 -->

								success : function() { //데이터를 보내는것이 성공했을시 출력되는 메시지 
									alert("댓글이 등록되었습니다.");
									location.reload();   
								}
							});
				});
		
		$("#modifyReply").click(
			function() {
				debugger;
				var replyText = $("#replyText").val(); //댓글 내용 
				var replyNo = $("#replyNo").val();
				if(replyText == null || replyText == 'undefiend' || replyText == ""){
					alert("댓글 내용이 없습니다. 댓글내용을 입력하여 주세요");
					return false;
				}
				
				var param = {
						"replytext" : replyText,
						"rno" : replyNo
					};
				$.ajax({
					type : "post", //데이터를 보낼 방식 
					url : "${pageContext.request.contextPath}/category/replyModify.do", //데이터를 보낼 url 
					data : param, //보낼 데이터 -->

					success : function() { //데이터를 보내는것이 성공했을시 출력되는 메시지 
						alert("댓글이 수정되었습니다.");
						closeModal();
					}
				});
			});
		
		$("#modalReplyinser").click(
				function() {
					debugger;
					var replyText = $("#modalReplyText").val(); //댓글 내용 
					var replyNo = $("#modalReplyNo").val();
					var boardNo = $("#boardNo").val();
					if(replyText == null || replyText == 'undefiend' || replyText == ""){
						alert("답글 내용이 없습니다. 답글내용을 입력하여 주세요");
						return false;
					}
					
					var param = {
							"replytext" : replyText,
							"rno" : replyNo,
							"boardNo" : boardNo
						};
					$.ajax({
						type : "post", //데이터를 보낼 방식 
						url : "${pageContext.request.contextPath}/category/replyInsert.do", //데이터를 보낼 url 
						data : param, //보낼 데이터 -->

						success : function() { //데이터를 보내는것이 성공했을시 출력되는 메시지 
							alert("답글이 등록되엇습니다.");
							closeModal();
//	 						listReply(); //댓글 목록 출력 
						}
					});
				});
		
		
		
		$("#deleteReply").click(
// 				alert("deleteReply");
				function() {
					debugger;
					var replyNo = $("#replyNo").val();
					
					var param = {
							"rno" : replyNo
						};
					$.ajax({
						type : "post", //데이터를 보낼 방식 
						url : "${pageContext.request.contextPath}/category/deleteReply.do", //데이터를 보낼 url 
						data : param, //보낼 데이터 -->

						success : function() { //데이터를 보내는것이 성공했을시 출력되는 메시지 
							alert("댓글이 삭제되엇습니다.");
							closeModal();
//	 						listReply(); //댓글 목록 출력 
						}
					});
				});
		
		
		
	});


</script>



</head>
<body>


<div id="modal" class="searchModal">
<div class="search-modal-content">
<div class="page-header">
<!-- <h1>MODAL</h1> -->
</div>
<div class="row">
<div class="col-sm-12">
<div class="row">
<div class="col-sm-12">
<span id='close' onclick="closeModalnologic();">&times;</span>
<h4>댓글 수정창 입니다.</h4>
<table>
	<tr>
		<th style="text-align: center;">ID
			<td>
				<input type="text" name="replyreplyer" id="replyreplyer" value="replyreplyer" readonly="readonly"/>
			</td>
		</th>
		<th style="text-align: center;">등록일자
			<td>
				<input type="text" name="replyRegdate" id="replyRegdate" value="replyRegdate" readonly="readonly"/>
			</td>
		</th>
	</tr>
</table>
        <textarea rows="4" cols="150" style="resize: vertical;"  name="replyText" id="replyText" value="replyText" placeholder="댓글을 작성하세요"></textarea>
		<input type="hidden" name="replyNo" id="replyNo" value="replyNo" readonly="readonly"/>
</div>
</div>
</div>
</div>
<hr>
<div style="cursor:pointer;background-color:#ffddb6;text-align: center;padding-bottom: 10px;padding-top: 10px;" id="modifyReply">수정
<span class="pop_bt modalCloseBtn" style="font-size: 13pt;">
</span>
</div>
</div>
</div>

<div id="modalReply" class="searchModal">
<div class="search-modal-content">
<div class="page-header">
<!-- <h1>MODAL</h1> -->
</div>
<div class="row">
<div class="col-sm-12">
<div class="row">
<div class="col-sm-12">
<span id='close' onclick="closeModalnologic();">&times;</span>
<h4>답글 등록창 입니다.</h4>
<table>
	<tr>
		<th style="text-align: center;">ID
			<td>
				<input type="text" name="modalReplyId" id="modalReplyId" value="${member.userId}" readonly="readonly"/>
			</td>
		</th>
		<th style="text-align: center;">등록일자
			<td>
				<input type="text" name="modalReplyRegdate" id="modalReplyRegdate" value="<fmt:formatDate value="${toDay}" pattern="yyyy-MM-dd" />" readonly="readonly"/>
<%-- 				<fmt:formatDate value="${toDay}" pattern="yyyy-MM-dd" /> --%>
			</td>
		</th>
	</tr>
</table>
        <textarea rows="4" cols="150" style="resize: vertical;"  name="modalReplyText" id="modalReplyText" value="replyText" placeholder="댓글을 작성하세요"></textarea>
		<input type="hidden" name="modalReplyNo" id="modalReplyNo" value="modalReplyNo" readonly="readonly"/>
</div>
</div>
</div>
</div>
<hr>
<div style="cursor:pointer;background-color:#ffddb6;text-align: center;padding-bottom: 10px;padding-top: 10px;" id="modalReplyinser">저장
<span class="pop_bt modalCloseBtn" style="font-size: 13pt;">
</span>
</div>
</div>
</div>
	
	<div id="listReply"></div>
	
	<c:if test="${member == null}">
		<table>
			<tr>
				<td>로그인을 하시면 답변을 등록할 수 있습니다.</td>
			</tr>

		</table>

	</c:if>
	<c:if test="${member != null}">
		<br>
		<div style="width: 100%; text-align: center;">
			<textarea rows="5" cols="80" id="replytext" placeholder="댓글을 작성하세요"></textarea>
			<br>
			<button type="button" id="btnReply">댓글쓰기</button>

		</div>

	</c:if>


</body>
</html>