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
        
        #dialog-background {

    display: none;

    position: fixed;

    top: 0; left: 0;

    width: 100%; height: 100%;

    background: rgba(0,0,0,.3);

    z-index: 10;

}

#my-dialog {

    display: none;

    position: fixed;

    left: calc( 50% - 160px ); top: calc( 50% - 70px );

    width: 320px; height: 140px; 

    background: #fff;

    z-index: 11;

    padding: 10px;

}

	</style>	
				

		<!-- Scripts -->
			<script src="<%=request.getContextPath()%>/resources/assets/js/jquery.min.js"></script>
			<script src="<%=request.getContextPath()%>/resources/assets/js/skel.min.js"></script>
			<script src="<%=request.getContextPath()%>/resources/assets/js/util.js"></script>
			<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="<%=request.getContextPath()%>/resources/assets/js/main.js"></script>
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.0.min.js" ></script>
	<script src='//code.jquery.com/jquery.min.js'></script>
<script type="text/javascript">
function goPage() {
	location.href="/category/boardList?n=" + 1;
} 


$(function(){
	listReply2()
	
	function goPage() {
			location.href="/category/boardList?n=" + 1;
		} 
	//댓글 목록 출력 함수
	function listReply(){
	    $.ajax({
	        type: "get", //get방식으로 자료를 전달한다
	        url: "${pageContext.request.contextPath}/category/list.do?boardNo=${boardContent.boardNo}", //컨트롤러에 있는 list.do로 맵핑하고 게시판 번호도 같이 보낸다.
	//	        url: "${pageContext.request.contextPath}/category/insert.do", //데이터를 보낼 url
	        success: function(retVal){ //자료를 보내는것이 성  공했을때 출력되는 메시지
	            //result : responseText 응답텍스트(html)
	            var output="<table>";
	            for(var i in retVal.list){
	                output += "<tr><td>"+retVal.list[i].rno;
	                output += "<tr><td>"+retVal.list[i].boardNo;
	            }
	            output+="</table>";
	            $("#listReply").html(output);
	        },
	        error:function(){
                alert("에러입니다");
        	}
	    });
	}
	
	function listReply2(){
		
	    $.ajax({
	        type: "get",
	        contentType: "application/json",
	        url: "${pageContext.request.contextPath}/category/list.do?boardNo=${boardContent.boardNo}",
	        success: function(retVal){
	            
	            var output="<table>";
	        
	            for(var i in retVal.list){                         
	 	           	output +=   "<tr>" ;
		            output +=   "<td>";
	                output +=   retVal.list[i].replyer;
	                output += '   ('+retVal.list[i].regdate+')';
	                output +=  "<br><br>";
	                output +=    retVal.list[i].replytext;
	                output +=  "<br><br>";
		        	output += "<button type='button' onclick='myFunction()' style='padding: 3px 6px;font-size: 13px;'>수정</button>"
	        		output += "&nbsp;"
		        	output += "<button type='button' style='padding: 3px 6px;font-size: 13px;'>삭제</button>"
	                output +=    "</td>";
			        output +=	"</tr>";                          
	            }                                                  
	            output+="</table>";
	            $("#listReply").html(output);
	            
	            
	        },
	        error:function(){
                alert("에러입니다");
        	}
	    });
	}
	
	function myFunction() {
		  alert("ASdasd");
		}

});

</script>

	</head>
	<body>



<script>





</script>

<div id="my-dialog">

    창 내용

    <button id="btn-close-dialog">창 닫기</button>

</div>

<div id="dialog-background"></div>



<div id="listReply"></div>		
<c:if test="${member == null}">
<table>
	<tr>
		<td>
			   로그인을 하시면 답변을 등록할 수 있습니다.
		</td>
	</tr>
	
</table>

</c:if>							
<c:if test="${member != null}">								
									<!-- 댓글 작성 -->
<!-- 너비와 정렬방식 설정 -->
<div style="width:100%; text-align:center;">
 
<!-- 세션에 저장되어있는 userid가 null이 아닐때 -->
<!-- 그러니까 로그인을 한 상태이어야만 댓글을 작성 할 수 있다.-->
<%--      <c:if test="${sessionScope.userid != null }"> --%>
     
     
         <textarea rows="5" cols="80" id="replytext"
             placeholder="댓글을 작성하세요"></textarea>
         <br>
         <!-- 댓글쓰기 버튼을 누르면 id값인 btnReply값이 넘어가서 -->
         <!-- 위쪽에 있는 스크립트 구문이 실행되고 -->
         <!-- 내가 댓글을 작성한 값이 스크립트문을 거쳐서 컨트롤러로 맵핑되게 된다. -->
       
         <button type="button" id="btnReply">댓글쓰기</button>
         
       <script type="text/javascript"> 
      	$("#btnReply").click(function(){ 
    	     var replytext=$("#replytext").val(); //댓글 내용 
    	     var boardNo=$("#boardNo").val();
    	     var param={ "replytext": replytext, "boardNo": boardNo}; 
    	     //var param="replytext="+replytext+"&bno="+bno; 
    	     $.ajax({ 
    	         type: "post", //데이터를 보낼 방식 
    	         url: "${pageContext.request.contextPath}/category/insert.do", //데이터를 보낼 url 
    	         data: param, //보낼 데이터 -->

    	         success: function(){ //데이터를 보내는것이 성공했을시 출력되는 메시지 
    	             alert("댓글이 등록되었습니다."); 
    	             listReply2(); //댓글 목록 출력 
    	         } 
    	     }); 
     	}); 
    	function listReply2(){
    	    $.ajax({
    	        type: "get",
    	        contentType: "application/json",
    	        url: "${pageContext.request.contextPath}/category/list.do?boardNo=${boardContent.boardNo}",
    	        success: function(retVal){
    	            var output="<table>";
    	            for(var i in retVal.list){                         
    	 	           	output +=   "<tr>" ;
    		            output +=   "<td>";
    	                output +=   retVal.list[i].replyer;
    	                output += '   ('+retVal.list[i].regdate+')';
    	                output +=  "<br><br>";
    	                output +=    retVal.list[i].replytext;
    	                output +=  "<br><br>";
    		        	output += "<button type='button' style='padding: 3px 6px;font-size: 13px;'>수정</button>"
    	        		output += "&nbsp;"
    		        	output += "<button type='button' style='padding: 3px 6px;font-size: 13px;'>삭제</button>"
    	                output +=    "</td>";
    			        output +=	"</tr>";                          
    	                       
    	            }                                                  
    	            output+="</table>";
    	            $("#listReply").html(output);
    	            output+="</table>";
    	            $("#listReply").html(output);
    	        }
    	    });
    	}
	
    	
    	function myFunction() {
    		  alert("ASdasd");
    		}

       </script> 
<%-- 					</c:if> --%>
</div>

</c:if>
<!-- 댓글 목록 -->
<!-- 댓글이 등록이 되면 listReply에 댓글이 쌓이게 된다 -->


	</body>
</html>