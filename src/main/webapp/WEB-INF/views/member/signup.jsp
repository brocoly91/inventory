
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!------ Include the above in your HEAD tag ---------->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!--

Copy this code in your html file.

-->

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Inventory</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous"/>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous"/>
<style>
/* Copy this code in your css file. */

html,body
{
    width: 2400px;
/*     margin: auto; */
}
.container
{
    width: 500px;
    margin: 20px auto;
}

.preview
{
    padding: 10px;
    position: relative;
}

.preview i
{
    color: white;
    font-size: 35px;
    transform: translate(50px,130px);
}

.preview-img
{
    border-radius: 100%;
    box-shadow: 0px 0px 5px 2px rgba(0,0,0,0.7);
}

.browse-button
{
    width: 200px;
    height: 200px;
    border-radius: 100%;
    position: absolute; /* Tweak the position property if the element seems to be unfit */
    top: 10px;
    left: 132px;
    background: linear-gradient(180deg, transparent, black);
    opacity: 0;
    transition: 0.3s ease;
}

.browse-button:hover
{
    opacity: 1;
}

.browse-input
{
    width: 200px;
    height: 200px;
    border-radius: 100%;
    transform: translate(-1px,-26px);
    opacity: 0;
}

.form-group
{
    width:  500px;
    margin: 10px auto;
}
.form-group2
{
    width:  300px;
    margin: 10px auto;
}
.form-group input
{
    transition: 0.3s linear;
}

.form-group input:focus
{
    border: 1px solid crimson;
    box-shadow: 0 0 0 0;
}

.Error
{
    color: crimson;
    font-size: 13px;
}

.Back
{
    font-size: 25px;
}
</style>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">

function checkId() {
	var id = $('#userId').val();
	
    if(id.length == 0 || id.length < 4){
        $('#chkMsg').html("아이디를 4글자 이상 입력해주세요");
        $("#chkMsg").css("color", "red");
        return false;
    }
	var param = {
		"userId" : id,
	};
	
    $.ajax({
        url:'${pageContext.request.contextPath}/member/idcheck.do',
        type:"post",
        data:param,
        success:function(data){
            if($.trim(data)==0){
                $('#chkMsg').html("사용가능");  
                $("#chkMsg").css("color", "rgb(5, 119, 245)");
            }else{
                $('#chkMsg').html("사용불가 (중복된 아이디 입니다.)");
                $("#chkMsg").css("color", "red");
            }
        },
        error:function(){
                alert("에러입니다");
        }
    });
    return true;
};


function passwordCheckFunction(){
	checkId();
	
    var userPassword1 = $('#userPass').val();
    var userPassword2 = $('#userPassCk').val();
    var pattern1 = /[0-9]/;
    var pattern2 = /[a-zA-Z]/;
    var pattern3 = /[~!@\#$%<>^&*]/;     // 원하는 특수문자 추가 제거
    var pw_msg = "";
    
	    if(userPassword1.length == 0) {
    	   $('#passwordCheckMessageUp').html("비밀번호를 입력해주세요");
    	   $("#passwordCheckMessageUp").css("color", "red");
           return false;
        } 
	         if(!pattern1.test(userPassword1)||!pattern2.test(userPassword1)||!pattern3.test(userPassword1)||userPassword1.length<8||userPassword1.length>50){
	             $('#passwordCheckMessageUp').html("영문+숫자+특수기호 8자리 이상으로 구성하여야 합니다.");
	             $("#passwordCheckMessageUp").css("color", "red");
	             return false;
	         }else{
	             $('#passwordCheckMessageUp').html("");
	     	 }
    	 
			if(userPassword2.length == 0){
				
				$('#passwordCheckMessage').html("비밀번호를 입력해주세요");
				$("#passwordCheckMessage").css("color", "red");
				return false;
			}
			
            if( userPassword1  !=  userPassword2) {
            	  $('#passwordCheckMessage').html("비밀번호가 일치하지 않습니다.");
            	  $("#passwordCheckMessage").css("color", "red");
                  return false;
             }


    
    if(userPassword1!=userPassword2){
        $('#passwordCheckMessage').html("비밀번호가 일치하지 않습니다");
        $("#passwordCheckMessage").css("color", "red");
        return false;
    }
    else{
        $('#passwordCheckMessage').html("");
    }
    
    return true;
}

function isCellPhone() {
	var val = $('#userPhon').val();
	val = val.split('-').join('');

	var regPhone = /^((01[1|6|7|8|9])[1-9]+[0-9]{6,7})|(010[1-9][0-9]{7})$/;
	
	if(!regPhone.test(val)){
        $('#userPhoneMessage').html("휴대전화 번호를 올바르게 입력하여 주세요");
        $("#userPhoneMessage").css("color", "red");
        return false;
	}else{
		$('#userPhoneMessage').html("");
	}	
	 return true;
}




function Back()
{
    window.history.back();
}

function signUpsubmit(){
	debugger;
	if(passwordCheckFunction()){
		return true;
	}else{
		return false;
	}
	
}

var pw_passed = true;  // 추후 벨리데이션 처리시에 해당 인자값 확인을 위해

function fn_pw_check() {
	
	
	alert("123123");
    var pw = document.getElementById("userPass").value; //비밀번호

    var pw2 = document.getElementById("userPassCk").value; // 확인 비밀번호

    var id = document.getElementById("userId").value; // 아이디

    pw_passed = true;

    var pattern1 = /[0-9]/;

    var pattern2 = /[a-zA-Z]/;

    var pattern3 = /[~!@\#$%<>^&*]/;     // 원하는 특수문자 추가 제거

    var pw_msg = "";

//     if(id.length == 0 || id.length < 4) {

//            alert("아이디를 4글자 이상 입력해주세요");
//            document.userInfo.userId.focus();
//            return false;

//      } else{

//             //필요에따라 아이디 벨리데이션
//      }

    if(pw.length == 0) {
    	   $('#passwordCheckMessageUp').html("비밀번호를 입력해주세요");
//            alert("비밀번호를 입력해주세요");
           document.userInfo.userPass.focus();
           return false;

     } else {
	         if(!pattern1.test(pw)||!pattern2.test(pw)||!pattern3.test(pw)||pw.length<8||pw.length>50){
// 	             alert("영문+숫자+특수기호 8자리 이상으로 구성하여야 합니다.");
	             $('#passwordCheckMessage').html("영문+숫자+특수기호 8자리 이상으로 구성하여야 합니다.");
	             return false;
	         }
    	 
			if(pw2.length == 0){
				
// 				alert("비밀번호확인를 입력해주세요");
				$('#passwordCheckMessage').html("비밀번호를 입력해주세요");
				document.userInfo.userPassCk.focus();
				return false;
			}
			
            if( pw  !=  pw2) {
            	  $('#passwordCheckMessage').html("비밀번호가 일치하지 않습니다.");
//                   alert("비밀번호가 일치하지 않습니다.");
                  document.userInfo.userPass.focus();
                  return false;
             }

     }


    if(pw.indexOf(id) > -1) {
    	 $('#passwordCheckMessage').html("비밀번호는 ID를 포함할 수 없습니다.");
//         alert("비밀번호는 ID를 포함할 수 없습니다.");

        return false;

    }

    var SamePass_0 = 0; //동일문자 카운트
    var SamePass_1 = 0; //연속성(+) 카운드
    var SamePass_2 = 0; //연속성(-) 카운드

    for(var i=0; i < pw.length; i++) {

         var chr_pass_0;
         var chr_pass_1;
         var chr_pass_2;

         if(i >= 2) {

             chr_pass_0 = pw.charCodeAt(i-2);
             chr_pass_1 = pw.charCodeAt(i-1);
             chr_pass_2 = pw.charCodeAt(i);

              //동일문자 카운트

             if((chr_pass_0 == chr_pass_1) && (chr_pass_1 == chr_pass_2)) {

                SamePass_0++;

              } else {

               SamePass_0 = 0;

               }

              //연속성(+) 카운드

             if(chr_pass_0 - chr_pass_1 == 1 && chr_pass_1 - chr_pass_2 == 1) {

                 SamePass_1++;

              } else {

               SamePass_1 = 0;

              }

              //연속성(-) 카운드

             if(chr_pass_0 - chr_pass_1 == -1 && chr_pass_1 - chr_pass_2 == -1) {

                 SamePass_2++;

              } else {

               SamePass_2 = 0;

              }  

         }     
          
        if(SamePass_0 > 0) {

//            alert("동일문자를 3자 이상 연속 입력할 수 없습니다.");
			
//            pw_passed=false;

         }

        if(SamePass_1 > 0 || SamePass_2 > 0 ) {

//            alert("영문, 숫자는 3자 이상 연속 입력할 수 없습니다.");

//            pw_passed=false;

         } 

         if(!pw_passed) {             

//               return false;

//               break;
        }
    }
    return true;
}
// function checkId(){
	
//     var id = $('#userId').val();
// 	var param = {
// 			"userId" : id,
// 		};
//     $.ajax({
//         url:'/member/idcheck.do',
//         type:'post',
//         data:param,
//         success:function(data){
//             if($.trim(data)==0){
//                 $('#chkMsg').html("사용가능");                
//             }else{
//                 $('#chkMsg').html("사용불가");
//             }
//         },
//         error:function(){
//                 alert("에러입니다");
//         }
//     });
// };



</script> 
</head>
<body>
    <div class="container">
       <div class="Back">
            <i class="fa fa-arrow-left" style="cursor: pointer;" onclick="Back()"></i>
        </div>
        <p class="h2 text-center"></p>
        <form  action="/member/signup.do"  name="userInfo" method="post" onSubmit="return signUpsubmit()">
            <div class="preview text-center" >
                <img class="preview-img" src="http://simpleicon.com/wp-content/uploads/account.png" alt="Preview Image" width="200" height="200" />
                <div class="browse-button" >
                    <i class="fa fa-pencil-alt"></i>
                    <input class="browse-input" type="file" name="UploadedFile" id="UploadedFile"/>
                </div>
                <span class="Error"></span>
            </div>
            
            <div class="form-group">
                <label style="color:red;">*</label><label>아이디:</label>
                <input class="form-control" type="text" id="userId" name="userId" oninput = "checkId()"  placeholder="Enter Your ID"/>
				<span id = "chkMsg"></span> 
                <span class="Error"></span>
            </div>
            <div class="form-group">
                <label style="color:red;">*</label><label>비밀번호:</label>
                <input class="form-control" type="password" id="userPass" name="userPass" onkeyup="passwordCheckFunction();" placeholder="Enter Password"/>
                <span id = "passwordCheckMessageUp"></span>
                <span class="Error"></span>
            </div>
            <div class="form-group">
                <label style="color:red;">*</label><label>비밀번호 확인:</label>
                <input class="form-control" type="password" id="userPassCk" name="userPassCk" onkeyup="passwordCheckFunction();" placeholder="Enter Password Check"/>
                <span id = "passwordCheckMessage"></span> 
                <span class="Error"></span>
            </div>
            <div class="form-group">
                <label>휴대전화:</label>
                <input class="form-control" type="tel" id="userPhon" name="userPhon"  onkeyup="isCellPhone();" placeholder="Enter Your HP"/>
                <span id = "userPhoneMessage"></span>
                <span class="Error"></span>
            </div>
            <div class="form-group">
                <label>이메일:</label>
                <input class="form-control" type="email" id="userEmail" name="userEmail"  placeholder="Enter Your Email"/>
                <span class="Error"></span>
            </div>
            <div class="form-group">
                <label>Position:</label>
                <input class="form-control" type="text" id="userPosition" name="userPosition"  placeholder="Enter Your Positionl"/>
                <span class="Error"></span>
            </div>
            <div class="form-group">
                <label>개발경력:</label>
                <input class="form-control" type="text" id="userCareer" name="userCareer"  placeholder="Enter Your Career"/>
                <span class="Error"></span>
            </div>
            <div class="form-group">
                <label>Gender:</label><br/>
                <label><input type="radio" id="userGender" name="userGender"  value="Male" checked /> Male</label>
                <label><input type="radio" id="userGender" name="userGender"  value="Female" /> Female</label>
<!--                 <label><input type="radio" id="userGender" name="userGender"  value="Other" /> Other</label> -->
                <span class="Error"></span>
            </div>
            <div class="form-group">
                <input class="btn btn-primary btn-block" type="submit" value="제출하기"/>
            </div>
        </form>
    </div>
<!--     <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script> -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>