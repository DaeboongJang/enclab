<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
    <title>게시글 상세조회</title>
    <style>
        * {
            box-sizing: border-box;
        }

        /* 전체 컨테이너 */
        .container {
            width: 1000px;
            margin: auto;
        }

        /* 제목 */
        h2 {
            margin-top: 30px;
            text-align: center;
        }

        /* 전체 row */
        .row {
            margin-top: 10px;
        }
        
        /* 내용 */
        /* 게시글 내용 */
         #content {
             width: 100%;
             height: 300px;
             resize: none;
         }
    </style>
</head>

<body>
    <div class="container">
        <form id="modifyForm" action="${pageContext.request.contextPath}/board/modify" method="post">
            <!-- 제목 -->
            <div class="row">
                <div class="col-12">
                    <h2>게시글 상세조회</h2>
                </div>
            </div>

            <!-- 제목 -->
            <div class="row">
                <div class="col-2">
                    <label>제목</label>
                </div>
                <div class="col-10">
                    <input type="text" class="form-control" id="title" name="board_title" value="${dto.board_title}" readonly>
                </div>
            </div>

            <!-- 글쓴이 -->
            <div class="row">
                <div class="col-2">
                    <label>글쓴이</label>
                </div>
                <div class="col-10">
                    <input type="text" class="form-control" id="writer" name="board_writer" value="${dto.board_writer}" readonly>
                </div>
            </div>

            <!-- 등록일 -->
            <div class="row">
                <div class="col-2">
                    <label>등록일</label>
                </div>
                <div class="col-10">
                    <input type="text" class="form-control" id="written_date" value="${dto.board_written_date}" readonly>
                </div>
            </div>

            <!-- 내용 -->
            <div class="row">
                <div class="col-2">
                    <label>내용</label>
                </div>
                <div class="col-10">
                    <textarea id="content" class="form-control" name="board_content" readonly>${dto.board_content}</textarea>
                </div>
            </div>

            <!-- 버튼 영역 -->
            <div class="row">
            	<c:if test="${loginSession.id eq dto.board_writer}">
                <div class="col-4 d-flex justify-content-end">
                    <button type="button" id="btnModify" class="btn btn-primary">수정</button>
                    <button type="button" id="btnConfirm" class="btn btn-primary" style="display:none;">확인</button>
                </div>
                <div class="col-4 d-flex justify-content-center">
                    <button type="button" id="btnDelete" class="btn btn-danger">삭제</button>
                    <button type="button" id="btnCancel" class="btn btn-danger" style="display:none;">취소</button>
                </div>
                </c:if>
                
                <div class="col-4 d-flex justify-content-end">
                    <button type="button" id="btnToBoard" class="btn btn-secondary">목록으로</button>
                </div>
            </div>

        </form>
    </div>
    
    <script>
    // 확인 버튼 클릭 
    $("#btnConfirm").on("click", function(){
    	$("#modifyForm").submit();
    })
    
    // 수정 버튼 클릭
    $("#btnModify").on("click", function(){
    	$("#title").attr("readonly", false);
    	$("#content").attr("readonly", false);
    	
    	// 확인 , 취소 버튼 활성
    	$("#btnConfirm").show();
    	$("#btnCancel").show();
    	
    	// 수정, 삭제 버튼 비활성
    	$("#btnModify").hide();
    	$("#btnDelete").hide();
    	
    })
    
    // 취소 버튼 클릭
    $("#btnCancel").on("click", function(){
    	$("#title").attr("readonly", true);
    	$("#content").attr("readonly", true);
    	
    	// 확인 , 취소 버튼 비활성
    	$("#btnConfirm").hide();
    	$("#btnCancel").hide();
    	
    	// 수정, 삭제 버튼 활성
    	$("#btnModify").show();
    	$("#btnDelete").show();
    })
    
    // 목록으로 버튼 클릭
    	$("#btnToBoard").on("click", function(){
    		location.href = "${pageContext.request.contextPath}/board/toBoard?currentPage=1";
    	})
    	
    	
    </script>
</body>

</html>