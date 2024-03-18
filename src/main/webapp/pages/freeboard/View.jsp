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
		<%@ include file="/partials/sidebar.jsp"%>
		<div class="container-fluid page-body-wrapper">
			<%@ include file="/partials/navbar.jsp"%>
			<div class="main-panel">
				<div class="content-wrapper">
					<div class="page-header">
						<h3 class="page-title">자유게시판</h3>
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="#">상세보기</a></li>
								<li class="breadcrumb-item active" aria-current="page">자유게시판
								</li>
							</ol>
						</nav>
					</div>

					<div class="row">
						<div class="col-12 grid-margin">
							<div class="card">
								<div class="card-body">
									<h2>자유게시판 - 상세 보기(View)</h2>

									<form name="writeFrm">
										<!-- 게시물의 일련번호를 서버로 전송하기 위해 hidden타입의 입력상자가 반드시
											필요하다. 이 부분이 추가되지 않으면 게시물은 수정되지 않는다. -->
										<input type='hidden' name='num' value='${ param.num }'>
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
														onclick="location.href='./edit.do?num=${ param.num }';">
														수정하기</button>
													<button type="button" class="btn btn-danger mr-2"
														onclick="deletePost();">삭제하기</button>
													<button type="button" class="btn btn-secondary mr-2"
														onclick="location.href='../freeboard/freeBoard.do';">목록
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
	</div>
</body>
</html>