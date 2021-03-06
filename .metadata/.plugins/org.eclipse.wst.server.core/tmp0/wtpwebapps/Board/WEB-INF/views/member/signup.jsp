<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<title>회원 가입</title>
<style>
* {
	box-sizing: border-box;
}

/* 전체 컨테이너 */
.container {
	width: 2000px;
	height: auto;
	margin: auto;
}

/* 재목 */
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
	<form action="${pageContext.request.contextPath}/member/signup"
		method="post">
		<div class="container">
			<div class="row d-flex justify-content-center">
				<div class="col-7">
					<h2>회원 가입</h2>
				</div>
			</div>

			<!-- 아이디 영역 -->
			<div class="row d-flex justify-content-center">
				<div class="col-1">
					<label>아이디</label>
				</div>
				<div class="col-5">
					<input type="text" id="id" name="id" class="form-control"
						placeholder="ID를 입력 해주세요">
				</div>
				<div class="col-2">
					<button type="button" id="btnCheckId" class="btn btn-primary">중복검사</button>
				</div>
				<div class="col-8" id="resId"></div>
			</div>

			<!-- 비밀번호 영역 -->
			<div class="row d-flex justify-content-center">
				<div class="col-1">
					<label>비밀번호</label>
				</div>
				<div class="col-5">
					<input type="password" id="pw" name="pw" class="form-control"
						placeholder="비밀번호를 입려 해주세요">
				</div>
				<div class="col-2"></div>
			</div>

			<!-- 비밀번호 확인 영역 -->
			<div class="row d-flex justify-content-center">
				<div class="col-1"></div>
				<div class="col-5">
					<input type="password" id="checkPw" class="form-control"
						placeholder="비밀번호 확인">
				</div>
				<div class="col-2"></div>
			</div>
		</div>

		<!-- 버튼 영역 -->
		<div class="row">
			<div class="col-6 d-flex justify-content-end">
				<button type="button" id="btnSignup" class="btn btn-primary">회원가입</button>
			</div>
			<div class="col-6 d-flex justify-content-start">
				<button type="button" id="btnCancel" class="btn btn-danger">취소</button>
			</div>
		</div>

	</form>

	<script>
  		// 변수 설정
        let id = $("#id"); // 아이디
		let btnCheckId = $("#btnCheckId"); // 아이디 중복확인
		let ResID = $("#resId"); // 아이디 검사
        let pw = $("#pw"); // 비밀번호
        let checkPw = $("#checkPw"); // 비밀번호 확인
        
        
		// regexID (통과하면 true, 실패면 false)
		function regexID() {
        	const RegexID = /^[a-z0-9]{5,19}$/; //	ID는 영문 소문자, 숫자로 시작하며 6~20자 이내로 (영문 대문자 시작 불가능)
        	console.log("regexID " + id.val());
        	console.log(RegexID.test(id.val()));
			return RegexID.test(id.val()); //	ID의 값을 RegexID 정규식을 통해 통과면 true, 불통과면 false
		}    

        // ID 입력창을 벗어날 때 regex검사
		id.onchange = function(e) {
			if (!regexID()) { //	RegexID에 위배되면 ID 결과창에 아래처럼 출력
				ResID.html("6~20자의 영문 소문자, 숫자만 사용가능 합니다.");
				ResID.css({
					"font-size" : "10px",
					"color" : "red"
				});
				console.log("id 비워줌  " + id.val());
				id.empty(); //	입력값 지움
			}
		}

        /* 중복 확인 버튼 클릭
		$("#btnCheckId").on("click", function(){
			 console.log("aaaaaaaaaaaaaa");
				if (regexID()) {
					$.ajax({
						url : "${pageContext.request.contextPath}/member/checkId",
						type : "post",
						data : {id : id.val()}
					}).done(function(res) { //	res : result
						if (res == "Available") {
							ResID.html("사용 가능한 ID 입니다");
							ResID.css({
								"font-size" : "10px",
								"color" : "green"
							});
							console.log(id.val());
							
							id.attr("readonly", true);	//	잠금
							
						} else if (res == "Unavailable") {
							ResID.html("이미 사용중인 아이디입니다.");
							ResID.css({
								"font-size" : "10px",
								"color" : "red"
							});
						}
					}).fail(function(e) {
						console.log(e);
					});
					
				}
		})
		*/
		
		$("#btnCheckId").on("click", function(){
			let url = "${pageContext.request.contextPath}/member/idCheckPopup";
			let name = "아이디 중복 검사";
			let option = "width=600, height=500, top=300";
			window.open(url, name, option);
		})
       
		// 회원 가입 버튼 클릭
		$("#btnSignup").on("click", function(e){
			if(id.val() == "" || !regexID()) {
				alert("아이디를 입력 해주세요.");
				return;
			} else if (!regexID()) {
				alert("아이디를 다시 입력 해주세요.");
				return;
			} else if (pw.val() == "") {
				alert("비밀번호를 입력 해주세요.");
				return;
			} else if (pw.val() !== checkPw.val()) {
				alert("비밀번호가 일치 하지 않습니다.");
				return;
			}
		})

		// 취소 버튼 클릭 
		$("#btnCancel").on("click", function(){
			location.href = "${pageContext.request.contextPath}/";
		})
</script>
</body>
</html>