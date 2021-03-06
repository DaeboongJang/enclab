<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	language="java"%>
<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"
	integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
	integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<title>로그인 페이지</title>
<style>
* {
	box-sizing: border-box;
}

/* 전체 컨테이너 */
.container {
	width: 2500px;
	height: auto;
	margin: auto;
}

/* 제목 */
h2 {
	text-align: center;
}

/* 전체 row */
.row {
	margin-top: 10px;
}
</style>
</head>

<body>
	<form id="loginForm" action="" method="post">
		<div class="container">
			<!-- 제목 영역 -->
			<div class="row mt-5 d-flex justify-content-center">
				<div class="col-7">
					<h2>로그인</h2>
				</div>
			</div>

			<!-- 아이디 영역 -->
			<div class="row d-flex justify-content-center">
				<div class="col-2">
					<label>아이디</label>
				</div>
				<div class="col-5">
					<input type="text" id="id" name="id" class="form-control" placeholder="Id 입력">
				</div>
			</div>


			<!-- 비밀번호 영역 -->
			<div class="row d-flex justify-content-center">
				<div class="col-2">
					<label>비밀번호</label>
				</div>
				<div class="col-5">
					<input type="password" id="pw" class="form-control" name="pw"
						placeholder="Pw 입력">
				</div>
			</div>

			<!-- 버튼 영역 -->
			<div class="row d-flex justify-content-center">
				<div class="col-6 d-flex justify-content-end">
					<button id="btnLogin" type="button" class="btn btn-primary">로그인</button>
				</div>
				<div class="col-6 d-flex justify-content-start">
					<button id="btnSignup" type="button" class="btn btn-warning">회원가입</button>
				</div>
			</div>
		</div>
	</form>

	<script>
    	// 회원 가입 버튼 클릭시
    	$("#btnSignup").on("click", function(){
    		location.href = "${pageContext.request.contextPath}/member/toSignup";
    	})
    	
    	// 로그인
    	
    	function login() {
         let data = $("#loginForm").serialize();
         $.ajax({
             url : "${pageContext.request.contextPath}/member/login",
             type : "post",
             data : data
          }).done(
                function(rs) {
                   if (rs == "성공") {
                      location.href = "${pageContext.request.contextPath}/member/toMainPage";
                   }  else if (rs == "실패") {
                      alert("아이디 혹은 비밀번호가 일치하지 않습니다.");
                      document.getElementById("pw").value = "";
                   }
                }).fail(function(e) {
             console.log(e);
          })
      }
    	
        $("#btnLogin").on("click", function() {
        	console.log("aaaaaaaa");
            login();
         })
    </script>
</body>

</html>