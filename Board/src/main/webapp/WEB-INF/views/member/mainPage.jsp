<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<title>메인 페이지</title>
<style>
* {
	box-sizing: border-box;
}

/* 전체 컨테이너 */
.container {
	width: 1000px;
	height: 1000px;
	margin: auto;
}

.row {
	margin-top: 10px;
}

/* 제목 */
.title {
	margin-top: 30px;
}
</style>
</head>

<body>
	<div class="container">
		<div class="row title">
			<div class="col-12 d-flex justify-content-center">
				<h2>메인 페이지</h2>
			</div>
		</div>
		<div class="row">
			<div class="col-4 d-flex justify-content-center">
				<button type="button" id="btnLogout" class="btn btn-danger">로그아웃</button>
			</div>
			<div class="col-4 d-flex justify-content-center">
				<button type="button" id="btnBoard" class="btn btn-primary">게시판</button>
			</div>
			<div class="col-4 d-flex justify-content-center">
				<button type="button" id="btnInsertBoard" class="btn btn-warning">글쓰기</button>
			</div>
		</div>
	</div>

	<script>
		// 로그아웃 버튼 클릭
		$("#btnLogout").on("click", function() {
			location.href = "${pageContext.request.contextPath}/member/logout";
		})

		// 게시판 버튼 클릭
		$("#btnBoard").on("click",function() {
			location.href = "${pageContext.request.contextPath}/board/toBoard?currentPage=1";
		})
		
		// 글쓰기 버튼 클릭
		$("#btnInsertBoard").on("click", function(){
			location.href = "${pageContext.request.contextPath}/board/toInsertBoard";
		})
	</script>
</body>

</html>