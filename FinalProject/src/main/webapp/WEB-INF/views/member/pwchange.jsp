<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>	
      <input type="hidden" id="memberId" name="memberId" value="${login.me_user_id}">
	   <div class="row mb-3 form-row">
                <div class="col-md-3">
                    <label for="newpw">현재 비밀번호</label>
                </div>
                <div class="col-md-6">
                    <input type="email" class="form-control" id="me_pw" name="me_pw" value="" placeholder="현재 비밀번호">
                </div>
          </div>
	  
         
          <div class="row mb-3 form-row">
                <div class="col-md-3">
                    <label for="newpw">새 비밀번호</label>
                </div>
                <div class="col-md-6">
                    <input type="email" class="form-control" id="me_pw1" name="me_pw1" value="" placeholder="새 비밀번호">
                </div>
          </div>
          <div class="row mb-3 form-row">
                <div class="col-md-3">
                    <label for="newpw2">새 비밀번호 확인</label>
                </div>
                <div class="col-md-6">
                    <input type="email" class="form-control" id="me_pw1" name="me_pw1" value="" placeholder="새 비밀번호 확인">
                </div>
                <div class="col-md-6"></div>
               <button type="button" id="pwUpdate" name="pwUpdate" class="btn btn-primary">비밀번호 변경</button> <a href="/member/pwchange" class="btn btn-default">취소</a>
                </div>
                

<script type="text/javascript">
	$(document).ready(function(){
		$("#pwUpdate").on("click", function(){
		if($("#me_pw").val==""){
			alert("현재 비밀번호를 입력해주세요");
			$("#me_pw").focus();
			return false;
		}
		if($("#me_pw1").val==""){
			alert("변경비밀번호을를 입력해주세요");
			$("#me_pw1").focus();
			return false;
		}
		if($("#me_pw1").val==""){
			alert("변경비밀번호를 입력해주세요");
			$("#me_pw1").focus();
			return false;
		}
		if ($("#me_pw").val() != $("#me_pw1").val()) {
			alert("변경비밀번호가 일치하지 않습니다.");
			$("#me_pw1").focus();
			 
		
		$.ajax({
			url : "/member/pwchange",
			type : "POST",
			dataType : "json",
			data : $("#pwUpdateForm").serializeArray(),
			success: function(data){
				
				if(data==0){
					alert("패스워드가 틀렸습니다.");
					return;
				}else{
					if(confirm("변경하시겠습니까?")){
						$("#pwUpdateForm").submit();
					}
					
				}
			}
		})
		
	});
	
		
	
})
</script>

</body>
</html>