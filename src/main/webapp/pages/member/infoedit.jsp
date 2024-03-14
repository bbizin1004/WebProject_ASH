<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- 이걸 mvc 패턴으로 하려면 서블릿으로 작성한걸 여기서 어떻게 쓰는지? -->
<%@ include file="./IsLoggedIn.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>회원 정보 수정</title>
<link rel="stylesheet"
	href="../../assets/vendors/mdi/css/materialdesignicons.min.css">
<link rel="stylesheet"
	href="../../assets/vendors/css/vendor.bundle.base.css">
<link rel="stylesheet" href="../../assets/css/style.css">
<link rel="shortcut icon" href="../../assets/images/favicon.png" />

<script type="text/javascript">
	function validateForm(form) { 
		if (form.id.value == "") {
			alert("아이디를 입력하세요.");
			form.id.focus();
			return false;
		}
		if (form.pass.value == "") {
			alert("비밀번호를 입력하세요.");
			form.pass.focus();
			return false;
		}
		if (form.name.value == "") {
			alert("이름을 입력하세요.");
			form.name.focus();
			return false;
		}
		if (form.phone.value == "") {
			alert("연락처를 입력하세요.");
			form.phone.focus();
			return false;
		}
		if (form.mail.value == "") {
			alert("Email을 입력하세요.");
			form.mail.focus();
			return false;
		}
	}
</script>

</head>
<body>
	<div class="container-scroller">
		<div class="container-fluid page-body-wrapper full-page-wrapper">
			<div class="row w-100 m-0">
				<div class="content-wrapper full-page-wrapper d-flex align-items-center auth login-bg">
					<div class="card col-lg-4 mx-auto">
						<div class="card-body px-5 py-5">
							<h3 class="card-title text-left mb-3">회원가입</h3>
							<!-- 회원가입 폼 -->
							<form method="post" action="register.do"
									onsubmit="return validateForm(this);">
								<div class="form-group">
									<label>아이디</label> <input type="text" name="id"
										class="form-control p_input">
								</div>
								<div class="form-group">
									<label>비밀번호</label> <input type="password"
										name="pass" class="form-control p_input">
								</div>
								<div class="form-group">
									<label>이름</label> <input type="text"
										name="name" class="form-control p_input">
								</div>
								<div class="form-group">
									<label>Tel</label> <input type="tel"
										name="tel" class="form-control p_input">
								</div>
								<div class="form-group">
									<label>Email</label> <input type="email"
										name="email" class="form-control p_input">
								</div>
								<div
									class="form-group d-flex align-items-center justify-content-between">
									<div class="form-check">
										<label class="form-check-label"> <input
											type="checkbox" class="form-check-input"> 로그인 상태 유지
										</label>
									</div>
									<a href="#" class="forgot-pass">비밀번호 찾기</a>
								</div>
								<div class="text-center">
									<button type="submit"
										class="btn btn-primary btn-block enter-btn">회원 가입하기</button>
								</div>
								<div class="d-flex">
									<button class="btn btn-facebook col mr-2">
										<i class="mdi mdi-facebook"></i> Facebook
									</button>
									<button class="btn btn-google col">
										<i class="mdi mdi-google-plus"></i> Google plus
									</button>
								</div>
								<p class="sign-up text-center">
									아직 회원이 아니십니까? 그럼 지금 당장 가입하세요! <a href="#"> 회원 가입</a>
								</p>
								<p class="terms">
									회원가입은 약관에 동의함을 의미합니다. <a href="#"> Terms & Conditions</a>
								</p>
							</form>
						</div>
					</div>
				</div>
				<!-- content-wrapper ends -->
			</div>
			<!-- row ends -->
		</div>
		<!-- page-body-wrapper ends -->
	</div>
	<!-- container-scroller -->
	<!-- plugins:js -->  
	<script src="../../assets/vendors/js/vendor.bundle.base.js"></script>
	<!-- endinject -->
	<!-- Plugin js for this page -->
	<!-- End plugin js for this page -->
	<!-- inject:js -->
	<script src="../../assets/js/off-canvas.js"></script>
	<script src="../../assets/js/hoverable-collapse.js"></script>
	<script src="../../assets/js/misc.js"></script>
	<script src="../../assets/js/settings.js"></script>
	<script src="../../assets/js/todolist.js"></script>
	<!-- endinject -->
</body>
</html>