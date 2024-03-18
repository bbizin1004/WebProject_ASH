<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<nav class="sidebar sidebar-offcanvas" id="sidebar">
        <div class="sidebar-brand-wrapper d-none d-lg-flex align-items-center justify-content-center fixed-top">
          <a class="sidebar-brand brand-logo" href="/WebProject_ASH/index.do""><img src="/WebProject_ASH/assets/images/logo.svg" alt="logo" /></a>
          <a class="sidebar-brand brand-logo-mini" href="/WebProject_ASH/index.do"><img src="/WebProject_ASH/assets/images/logo-mini.svg" alt="logo" /></a>
        </div>
        <ul class="nav">
          <li class="nav-item profile">
            <div class="profile-desc">
              <div class="profile-pic">
                <div class="count-indicator">
                  <img class="img-xs rounded-circle " src="/WebProject_ASH/assets/images/faces/face15.jpg" alt="">
                  <span class="count bg-success"></span>
                </div>
                <div class="profile-name">
                  <h5 class="mb-0 font-weight-normal">안성현</h5>
                  <span>최고 관리자</span>
                </div>
              </div>
              <a href="#" id="profile-dropdown" data-toggle="dropdown"><i class="mdi mdi-dots-vertical"></i></a>
              <div class="dropdown-menu dropdown-menu-right sidebar-dropdown preview-list" aria-labelledby="profile-dropdown">
                <a href="#" class="dropdown-item preview-item">
                  <div class="preview-thumbnail">
                    <div class="preview-icon bg-dark rounded-circle">
                      <i class="mdi mdi-settings text-primary"></i>
                    </div>
                  </div>
                  <div class="preview-item-content">
                    <p class="preview-subject ellipsis mb-1 text-small">계정 관리</p>
                  </div>
                </a>
                <div class="dropdown-divider"></div>
                <a href="#" class="dropdown-item preview-item">
                  <div class="preview-thumbnail">
                    <div class="preview-icon bg-dark rounded-circle">
                      <i class="mdi mdi-onepassword  text-info"></i>
                    </div>
                  </div>
                  <div class="preview-item-content">
                    <p class="preview-subject ellipsis mb-1 text-small">비밀번호 변경</p>
                  </div>
                </a>
                <div class="dropdown-divider"></div>
                <a href="#" class="dropdown-item preview-item">
                  <div class="preview-thumbnail">
                    <div class="preview-icon bg-dark rounded-circle">
                      <i class="mdi mdi-calendar-today text-success"></i>
                    </div>
                  </div>
                  <div class="preview-item-content">
                    <p class="preview-subject ellipsis mb-1 text-small">할일 목록</p>
                  </div>
                </a>
              </div>
            </div>
          </li>
          <li class="nav-item nav-category">
            <span class="nav-link">메뉴</span>
          </li>
          <li class="nav-item menu-items">
            <a class="nav-link" href="/WebProject_ASH/index.do">
              <span class="menu-icon">
                <i class="mdi mdi-speedometer"></i>
              </span>
              <span class="menu-title">대쉬보드</span>
            </a>
          </li>
          
          <!-- 게시판  -->
          <li class="nav-item menu-items">
          <!-- 메뉴 토글되는 부분 href 부분과 토글되는 div에 id를 동일하게 맞추면 된다. -->
            <a class="nav-link" data-toggle="collapse" href="#board" aria-expanded="false"
            	 aria-controls="board">
              <span class="menu-icon">
                <i class="mdi mdi-laptop"></i>
              </span>
              <span class="menu-title">게시판</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="board">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item">
                 	<a class="nav-link" 
                 		href="/WebProject_ASH/pages/freeboard/freeBoard.do">자유게시판</a></li>
                <li class="nav-item">
                 	<a class="nav-link" 
                 		href="/WebProject_ASH/pages/board/qnaBoard.do">Q&A 게시판</a></li>
                <li class="nav-item"> 
                	<a class="nav-link" 
                		href="/WebProject_ASH/pages/board/fileBoard.do">자료실 게시판</a></li>
              </ul>
            </div>
          </li>
          
          
           <!-- 회원관리 -->
          <li class="nav-item menu-items">
            <a class="nav-link" data-toggle="collapse" href="#membership"
            	 aria-expanded="false" aria-controls="membership">
              <span class="menu-icon">
                <i class="mdi mdi-security"></i>
              </span>
              <span class="menu-title">회원관리</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="membership">
              <ul class="nav flex-column sub-menu">
              
              <!-- 로그인 하면 변화되는 부분 -->
                <c:if test="${sessionScope.id eq null}">
                <li class="nav-item"> <a class="nav-link" 
                	href="/WebProject_ASH/pages/member/login.do"> 로그인 </a></li>
                <li class="nav-item"> <a class="nav-link" 
                	href="/WebProject_ASH/pages/member/register.do"> 회원가입 </a></li>
    			</c:if>
    			<!-- 여기서는 로그아웃 버튼을 클릭하면  경로가 로그아웃 서블릿이 있는
    			 패키지로 이동한것 인지? 아니면 현재 wabapp 바로 밑에 있는 건지?
    					서블릿으로 실행후 경로 지정할때 감이 안잡힘-->
               <c:if test="${sessionScope.id ne null}">
                <li class="nav-item"> <a class="nav-link" 
                	href="/WebProject_ASH/pages/member/MemberEdit.do"> 정보수정 </a></li>
                <li class="nav-item"> <a class="nav-link" 
                	href="/WebProject_ASH/logout.do"> 로그아웃 </a></li>
               </c:if>
                	
              </ul>
            </div>
          </li>
        </ul>
      </nav>