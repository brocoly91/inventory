<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
    String ctx = request.getContextPath();    //콘텍스트명 얻어오기.
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous"> -->
		<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets/css/main.css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Write something else you want</title>
<!-- SmartEditor를 사용하기 위해서 다음 js파일을 추가 (경로 확인) -->
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/SE2/js/HuskyEZCreator.js" charset="utf-8"></script>
<!-- jQuery를 사용하기위해 jQuery라이브러리 추가 -->
<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.0.min.js"></script>

<script type="text/javascript">
var oEditors = [];
$(function(){
      nhn.husky.EZCreator.createInIFrame({
          oAppRef: oEditors,
          elPlaceHolder: "boardContens", //textarea에서 지정한 id와 일치해야 합니다. 
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
              oEditors.getById["boardContens"].exec("PASTE_HTML", ["내용을 입력하여 주세요"]);
          },
          fCreator: "createSEditor2"
      });
      
      //저장버튼 클릭시 호출 함수
      $("#btnSave").click(function(){
    	 debugger;
    	 
         var confirm_test = confirm("저장 하시겟습니까?");
         
         if ( confirm_test == false  ) {
         	return false;
         } 
         
    	 var boardCategory = $("#boardCategory").val()
    	 
    	 if(boardCategory =="000"){
    		 alert("게시판을 선택하여 주세요.");
    		 return false;
    	 }else{
    		 
    	 }
    	 
    	  var boardTitle = $("#boardTitle").val()
    	  //에디터에 내용 얻기
    	  var boardContens = oEditors.getById["boardContens"].getIR();
    	  
    	  if(boardTitle == "" || boardTitle == null || boardContens == null){
    		  alert("제목과 내용을 입력해 주세요")
    		  document.save.boardTitle.focus();
    		  return false;
    	  }
	     //작성 폼을 저장(submit)하기 앞서 해줘야할 처리 과정입니다. 
	     //에디터에 작성된 내용을 실제 서버에 전달될 텍스트박스에 업데이트 시키는 처리 부분입니다. 
	     //이 구문이 없다면 에디터에 있는 텍스트대로 저장이 되지 않을 수 있습니다.
          oEditors.getById["boardContens"].exec("UPDATE_CONTENTS_FIELD", []);

          
          $("#save").submit();
      });    
      //목록버튼 클릭시 호출 함수
      $("#btnList").click(function(){
    	  location.href="/category/boardList?n=" + 1;
       });    
});
</script>

<style>
</style>
</head>
<body>

	<section>
	 <article>
	<div class="container" role="main">
<!-- 		<form  id="save" name="save" role="form" method="get" action="/category/boardList"> -->
		<form  id="save" name="save" role="form" method="post" action="/category/boardInsert">
			<div class="mb-3">
				<select name="boardCategory" id="boardCategory">
					<option value="000">게시판을 선택하여 주세요</option>
					<option value="100">JAVA</option>
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
			<br>
			<div class="mb-3">
				<input type="hidden" id="n" name="n" value="0"/>
				<input type="text" class="form-control" name="boardTitle" id="boardTitle" placeholder="제목을 입력해 주세요">
			</div>
			<div class="mb-3">
				<label for="content" style="margin: 10px 0 1em 0;">내용</label>
				<textarea class="form-control" id="boardContens" rows="15" name="boardContens" style="width:100%";  placeholder="내용을 입력해 주세요"></textarea>
			</div>
		</form>
		<div>
			<button type="submit" id="btnSave">저장</button>
			<button id="btnList">목록</button>
		</div>
	</div>

	</article> 
 </section>
</body>
</html>


