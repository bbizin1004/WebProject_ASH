<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>자유게시판 수정하기</title>
<link rel="stylesheet"
	href="../../assets/vendors/mdi/css/materialdesignicons.min.css">
<link rel="stylesheet"
	href="../../assets/vendors/css/vendor.bundle.base.css">
<link rel="stylesheet"
	href="../../assets/vendors/select2/select2.min.css">
<link rel="stylesheet"
	href="../../assets/vendors/select2-bootstrap-theme/select2-bootstrap.min.css">
<link rel="stylesheet" href="../../assets/css/style.css">
<link rel="shortcut icon" href="../../assets/images/favicon.png" />
<script type="text/javascript">
	function validateForm(form) { // 필수 항목 입력 확인
		if (form.title.value == "") {
			alert("제목을 입력하세요.");
			form.title.focus();
			return false;
		}
		if (form.content.value == "") {
			alert("내용을 입력하세요.");
			form.content.focus();
			return false;
		}
	}
</script>
</head>
<body>
	<div class="container-scroller">
		<!-- partial:../../partials/_sidebar.html -->
		<%@ include file="/partials/sidebar.jsp"%>
		<!-- partial -->
		<div class="container-fluid page-body-wrapper">
			<!-- partial:../../partials/_navbar.html -->
			<%@ include file="/partials/navbar.jsp"%>
			<!-- partial -->
			<div class="main-panel">
				<div class="content-wrapper">
					<div class="page-header">
						<h3 class="page-title">자유게시판 - 수정하기</h3>
						<nav aria-label="breadcrumb"></nav>
					</div>
					<div class="row">
						<div class="col-12 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">자유게시판 - 수정하기</h4>
									<form name="writeFrm" method="post" action="./edit.do"
										class="forms-sample" onsubmit="return validateForm(this);">
										<!-- 수정할 게시물의 일련번호 -->
										<input type="hidden" name="num" value="${ dto.num }" />
										<div class="form-group">
											<label for="exampleInputName1">아이디</label>
											<p name="id" class="card-description text-success">${ sessionScope.id }</p>
										</div>
										<div class="form-group">
											<label for="exampleInputName1">제목</label> <input type="text"
												name="title" class="form-control" id="exampleInputName1"
												value="${ dto.title }">
										</div>
										<div class="form-group">
											<label for="exampleTextarea1">내용</label>
											<textarea name="content" class="form-control"
												id="exampleTextarea1" rows="15"> ${ dto.content } </textarea>
										</div>
										<button type="submit" class="btn btn-primary mr-2">수정하기</button>
										<button type="button" class="btn btn-dark"
											onclick="location.href='./freeBoard.do';">목록으로 돌아가기</button>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- content-wrapper ends -->
				<!-- partial:../../partials/_footer.html -->
				<footer class="footer">
					<div
						class="d-sm-flex justify-content-center justify-content-sm-between">
						<span
							class="text-muted d-block text-center text-sm-left d-sm-inline-block">Copyright
							Â© bootstrapdash.com 2020</span> <span
							class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center">
							Free <a
							href="https://www.bootstrapdash.com/bootstrap-admin-template/"
							target="_blank">Bootstrap admin templates</a> from
							Bootstrapdash.com
						</span>
					</div>
				</footer>
				<!-- partial -->
			</div>
			<!-- main-panel ends -->
		</div>
		<!-- page-body-wrapper ends -->
	</div>
	<!-- container-scroller -->
	<!-- plugins:js -->
	<script src="../../assets/vendors/js/vendor.bundle.base.js"></script>
	<!-- endinject -->
	<!-- Plugin js for this page -->
	<script src="../../assets/vendors/select2/select2.min.js"></script>
	<script src="../../assets/vendors/typeahead.js/typeahead.bundle.min.js"></script>
	<!-- End plugin js for this page -->
	<!-- inject:js -->
	<script src="../../assets/js/off-canvas.js"></script>
	<script src="../../assets/js/hoverable-collapse.js"></script>
	<script src="../../assets/js/misc.js"></script>
	<script src="../../assets/js/settings.js"></script>
	<script src="../../assets/js/todolist.js"></script>
	<!-- endinject -->
	<!-- Custom js for this page -->
	<script src="../../assets/js/file-upload.js"></script>
	<script src="../../assets/js/typeahead.js"></script>
	<script src="../../assets/js/select2.js"></script>
	<!-- End custom js for this page -->
</body>
</html>