<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
<title>Edit.jsp</title>

<!-- 부트스트랩 -->

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- IE8 에서 HTML5 요소와 미디어 쿼리를 위한 HTML5 shim 와 Respond.js -->
<!-- WARNING: Respond.js 는 당신이 file:// 을 통해 페이지를 볼 때는 동작하지 않습니다. -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<body>
	<!-- navigation bar start -->
	<jsp:include page="/Template/DataRoomTop.jsp" />
	<!-- navigation bar end -->
	<c:set var="no" value="${dto.no }" scope="request"/>

	<!-- 실제 내용시작 -->
	<div class="container">
		<!-- 점보트론(Jumbotron) -->
		<div class="jumbotron">
			<h1>
				자료실<small>등록 페이지</small>
			</h1>
		</div>

		${param.nowPage}
		<div class="row">
			<div class="col-md-12">
				<form class="form-horizontal" method="post" enctype="multipart/form-data" action="<c:url value='/DataRoom/Edit.kosmo'/>?nowPage=${param.nowPage}">
					<input type="hidden" name="no" value="${dto.no }" />
					<input type="hidden" name="originalFilename" value="${dto.attachFile }" />
					<div class="form-group">
						<!-- <div class="row">와 같다 -->
						<!-- label에 control-label도 함께:가운데 정렬 -->
						<label class="col-sm-2 control-label">작성자</label>
						<div class="col-sm-4">
							<input value="${dto.name }" type="text" class="form-control" name="name"
								placeholder="이름을 입력하세요?">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">제목</label>
						<div class="col-sm-4">
							<input value="${dto.title }"  type="text" class="form-control" name="title"
								placeholder="제목을 입력하세요?">
						</div>
					</div>

					<div class="form-group">
						<label class="col-sm-2 control-label">파일 업로드</label>
						<div class="col-sm-4">
							<input type="file" name="attachFile">
							<p class="help-block">업로드된 파일: ${dto.attachFile } </p>
						</div>
					</div>

		
					<div class="form-group">
						<label class="col-sm-2 control-label">내용</label>
						<!-- 중첩 컬럼 사용 -->
						<div class="col-sm-10">
							<div class="row">
								<div class="col-sm-8">
									<textarea class="form-control" name="content" rows="5" placeholder="내용 입력하세요">${dto.content }</textarea>
								</div>
							</div>
						</div>
					</div>
					​
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button type="submit" class="btn btn-primary">등록</button>
						</div>
					</div>

				</form>
			</div><!-- col-md-12 -->
		</div><!-- row -->



	</div>
	<!-- container -->
	<!-- 실제 내용 끝 -->

	
	
	<!-- 경고창 모달 시작 -->
	<div class="modal fade" id="small-modal" data-backdrop="static">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-body">
					<button class="close" data-dismiss="modal">
						<span>×</span>
					</button>
					<h5 class="modal-title">
						<span class="glyphicon glyphicon-bullhorn"></span>
						 경고 메시지
					</h5>
					<h6 id="warningMessage"></h6>
				</div>
			</div>
		</div>
	</div>





	<!-- footer 시작 -->
	<jsp:include page="/Template/DataRoomFooter.jsp" />
	<!-- footer 끝 -->

	<script>
		/*
		file 사이즈(바이트): 파일객체.files[0].size
		파일명: 파일객체.files[0].name
		파일 컨텐츠 타입: 파일객체.files[0].type
		*/
		
		$(function(){
			var focusObject;
			//modal 창이 닫혔을 때 발생하는 이벤트 처리- 즉 해당 입력 요소에 포커스 주기
			$('#small-modal').on('hidden.bs.modal',function(){
				focusObject.focus();
				
			});
			
			$('form').on('submit',function(){
				
				if($(this).get(0).name.value == ""){
					$('#warningMessage').html("이름을 입력하세요.");
					$('#small-modal').modal('show');
					focusObject = $(this).get(0).name;
					return false;
				}
				if($(this).get(0).title.value == ""){
					$('#warningMessage').html("제목을 입력하세요.");
					$('#small-modal').modal('show');
					focusObject = $(this).get(0).title;
					return false;
				}
				
				//파일 이름이 ""일때 확인
				if($(this).get(0).attachFile.value != "" && $(this).get(0).attachFile.files[0].size > 1500*1024){
					$('#warningMessage').html("업로드 최대용량(1500KB)을 초과했어요.");
					$('#small-modal').modal('show');
					return false;
				}
				
				if($(this).get(0).password.value == ""){
					$('#warningMessage').html("비밀번호를 입력하세요.");
					$('#small-modal').modal('show');
					focusObject = $(this).get(0).password;
					return false;
				}
				if($(this).get(0).content.value == ""){
					$('#warningMessage').html("내용을 입력하세요.");
					$('#small-modal').modal('show');
					focusObject = $(this).get(0).content;
					return false;
				}
				
			});
			
			
			
		});
	
	
	</script>





</body>
</html>