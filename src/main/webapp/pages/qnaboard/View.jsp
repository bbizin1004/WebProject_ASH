<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>상세보기</title>
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

<script>
	//게시물 삭제를 위한 JS함수 정의 
	function deletePost() {
		var confirmed = confirm("정말로 삭제하겠습니까?");
		if (confirmed) {
			var form = document.writeFrm;
			form.method = "post";
			form.action = "./delete.do";
			form.submit();
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
						<h3 class="page-title">Q&A게시판</h3>
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="#">상세보기</a></li>
								<li class="breadcrumb-item active" aria-current="page">Q&A게시판
								</li>
							</ol>
						</nav>
					</div>

					<div class="row">
						<div class="col-12 grid-margin">
							<div class="card">
								<div class="card-body">
									<h2>Q&A게시판 - 상세 보기(View)</h2>
									<form name="writeFrm">
									<input type="hidden" name="num" value="${dto.num}">
										<table border="1" width="90%">
											<colgroup>
												<col width="15%" />
												<col width="35%" />
												<col width="15%" />
												<col width="*" />
											</colgroup>
											<tr>
												<td>번호</td>
												<td>${ dto.num }</td>
												<td>작성자</td>
												<td>${ dto.id }</td>
											</tr>
											<tr>
												<td>작성일</td>
												<td>${ dto.postdate }</td>
												<td>조회수</td>
												<td>${ dto.visitcount }</td>
											</tr>
											<tr>
												<td>제목</td>
												<td colspan="3">${ dto.title }</td>
											</tr>
											<tr>
												<td>내용</td>
												<td colspan="3" height="100">${ dto.content }</td>
											</tr>

											<!-- 버튼 -->
											<tr>
												<td colspan="4" align="center">
													<button type="button" class="btn btn-primary mr-2"
														onclick="location.href='./edit.do?num=${dto.num}';">
														수정하기</button>
													<button type="button" class="btn btn-danger mr-2"
														onclick="deletePost();">삭제하기</button>
													<button type="button" class="btn btn-secondary mr-2"
														onclick="location.href='../qnaboard/list.do';">목록
														바로가기</button>
												</td>
											</tr>
										</table>
									</form>
								</div>
							</div>
						</div>



					</div>
					<!-- content-wrapper ends -->
				</div>
				<footer class="footer">
					<div
						class="d-sm-flex justify-content-center justify-content-sm-between">
						<span
							class="text-muted d-block text-center text-sm-left d-sm-inline-block">Copyright
							© bootstrapdash.com 2020</span> <span
							class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center">
							Free <a
							href="https://www.bootstrapdash.com/bootstrap-admin-template/"
							target="_blank">Bootstrap admin templates</a> from
							Bootstrapdash.com
						</span>
					</div>
				</footer>
			</div>
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