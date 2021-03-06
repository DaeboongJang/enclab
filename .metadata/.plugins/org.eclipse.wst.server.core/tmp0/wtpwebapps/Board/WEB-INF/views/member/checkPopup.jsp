
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>아이디 중복 확인</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"
        integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
        integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"
        crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.js"
        integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>

</head>

<body>
    <form action="" method="post" id="checkForm">
        <div class="idCheckPopupContainer">
            <div class="row p-4">
                <div class="col-8 mb-4">
                    <input type="text" id="id" class="form-control"
                        placeholder="id를 입력하세요." name="id">
                </div>
                <div class="col-4 mb-4">
                    <button type="submit" id="btnCheck" class="btn btn-warning">아이디 확인</button>
                </div>
            </div>
            <div class="row p-4">
                <div class="col mb-4">
                    <h4>확인 결과 :</h4>
                </div>
            </div>
            <div class="row p-4">
                <div class="col mb-4">
                    <div id="rs"></div>
                </div>
            </div>
            <div class="row p-4 justify-content-center">
                <div class="col-4 d-flex justify-content-end">
                    <button type="button" id="btnCancel" class="btn btn-secondary">창닫기</button>
                </div>
                <div class="col-4 d-flex justify-content-start">
                    <button type="button" id="btnSubmit" class="btn btn-primary">사용</button>
                </div>
            </div>
        </div>
    </form>
    
    <script>
        let rs = document.getElementById("rs");
        let btnSubmit = document.getElementById("btnSubmit"); 
        let btnCancel = document.getElementById("btnCancel");
        let id = document.getElementById("id");
        let btnCheck = document.getElementById("btnCheck");
       
        
        /*
        // 아이디 확인 버튼을 눌렀을 때 submit 에 대한 이벤트 처리
        btnCheck.addEventListener("click", function() {
            // 아이디 정규식 추가
            let regexId = /[a-zA-Z][a-zA-Z0-9]{5,11}/;   // 앞자리가 빠지기 때문에 수량이 5,11 이 됨
            if(!regexId.test(idInput.value || idInput.value == "")) {
                alert("아이디를 형식에 맞게 입력하세요. 영문자, 숫자 사용 가능(반드시 영문자로 시작)");
                return; // return을 시켜줘야 함.
            }
            document.getElementById("checkForm").submit();
        });
          */
          
          function RegexId() {
        	let regexId = /[a-zA-Z][a-zA-Z0-9]{5,11}/;   // 앞자리가 빠지기 때문에 수량이 5,11 이 됨
          	console.log("regexID " + id.value);
          	console.log(regexId.test(id.value));
  			return regexId.test(id.value); //	ID의 값을 RegexID 정규식을 통해 통과면 true, 불통과면 false
  		}  
        
        
        // 중복 확인 버튼 클릭
		$("#btnCheck").on("click", function(){
			 console.log("aaaaaaaaaaaaaa");
				if (RegexId()) {
					$.ajax({
						url : "${pageContext.request.contextPath}/member/checkId",
						type : "post",
						data : {id : id.value}
					}).done(function(res) { //	res : result
						if (res == "available") {
							rs.html = "사용 가능한 아이디입니다.";
							resultID.append(
							rs.css({
								"font-size" : "10px",
								"color" : "green"
							});
							console.log(id.value);
							
						} else if (res == "unavailable") {
							rs.html("이미 사용중인 아이디입니다.");
							rs.css({
								"font-size" : "10px",
								"color" : "red"
							});
						}
					}).fail(function(e) {
						console.log(e);
					});
					
				}
		})
      
        
        
        
        
        
        
        
        btnCancel.addEventListener("click", function(){
            self.close(); // 현재 팝업창을 닫겠다.
        });
        
        btnSubmit.addEventListener("click", function(){
            // opener.document.signupForm.signupId.value = idInput.value;
            opener.document.getElementById("signupId").value = id.value;
            self.close();
        });
        
        if(rs.innerHTML == "사용 가능한 아이디입니다.") {
            rs.style.color = "green";
        } else {
            rs.style.color = "red";
            btnSubmit.disabled = true;
        }
    </script>
</body>

</html>