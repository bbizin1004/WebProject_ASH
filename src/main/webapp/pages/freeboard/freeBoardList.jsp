<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>


<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Mas Admin</title>
    <!-- plugins:css -->
    <link rel="stylesheet" href="../../assets/vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="../../assets/vendors/css/vendor.bundle.base.css">
    <!-- endinject -->
    <!-- Plugin css for this page -->
    <!-- End plugin css for this page -->
    <!-- inject:css -->
    <!-- endinject -->
    <!-- Layout styles -->
    <link rel="stylesheet" href="../../assets/css/style.css">
    <!-- End layout styles -->
    <link rel="shortcut icon" href="../../assets/images/favicon.png" />
  </head>
  <body>
    <div class="container-scroller">
      <!-- 사이드바 네비-->
		<%@ include file="/partials/sidebar.jsp" %>
      <div class="container-fluid page-body-wrapper">
        <!-- partial:../../partials/_navbar.html -->
        <%@ include file="/partials/navbar.jsp" %>
        <!-- partial -->
        <div class="main-panel">
          <div class="content-wrapper">
            <div class="page-header">
              <h3 class="page-title"> Basic Tables </h3>
              <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="#">Tables</a></li>
                  <li class="breadcrumb-item active" aria-current="page">Basic tables</li>
                </ol>
              </nav>
            </div>
            <div class="row">
             <div class="col-lg-12 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                    <h4 class="card-title text-warning">자유게시판</h4>
                    <div class="table-responsive">
                      <table class="table table-bordered">
                        <thead>
                          <tr>
                            <th> 번호 </th>
                            <th> 제목 </th>
                            <th> 내용 </th>
                            <th> 작성일 </th>
                            <th> 조회수 </th>
                          </tr>
                        </thead>
                        <tbody>
                        <c:choose>
						    <c:when test="${ empty boardLists }"> 
								<!-- 게시물이 없을 때 --> 
						        <tr>
						            <td colspan="5" align="center">
						                등록된 게시물이 없습니다^^*
						            </td>
						        </tr>
						    </c:when> 
						 <c:otherwise>  
						  <c:forEach items="${ boardLists }" var="row" varStatus="loop">    
                          <tr>
                            <td> ${ map.totalCount - (((map.pageNum-1) * map.pageSize) + loop.index)}
                            </td>
                            <td> <a href="../freeboard/view.do?num=${ row.num }">${ row.title }</a> </td>
                            <td>${ row.content }</td>
                            <td> ${ row.postdate } </td>
                            <td> ${ row.visitcount } </td>
                          </tr>
                           </c:forEach>  
                          </c:otherwise>      
                         </c:choose>
                        </tbody>
                            <!-- 하단 메뉴(바로가기, 글쓰기) -->
					    <table border="1" width="100%">
					        <tr align="center">
					            <td>
					                ${ map.pagingImg }
					            </td>
					            <td width="100"><button type="button"
					                onclick="location.href='../freeboard/write.do';">글쓰기</button></td>
					        </tr>
					    </table>
                            <!-- 검색 폼 -->
    					<form method="get">  
    					<table border="1" width="90%">
    					<tr>
					        <td align="center">
					        <div class="form-group">
					            <select name="searchField">
					                <option value="title">제목</option>
					                <option value="content">내용</option>
					            </select>
					            <input type="text" name="searchWord" />
					            <input type="submit" value="검색" />
					         </div>
					        </td>
					    </tr>
					    </table>
					    </form>
                      </table>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!-- content-wrapper ends -->
          <!-- partial:../../partials/_footer.html -->
          <footer class="footer">
            <div class="d-sm-flex justify-content-center justify-content-sm-between">
              <span class="text-muted d-block text-center text-sm-left d-sm-inline-block">Copyright Â© bootstrapdash.com 2020</span>
              <span class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center"> Free <a href="https://www.bootstrapdash.com/bootstrap-admin-template/" target="_blank">Bootstrap admin templates</a> from Bootstrapdash.com</span>
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
    <!-- End plugin js for this page -->
    <!-- inject:js -->
    <script src="../../assets/js/off-canvas.js"></script>
    <script src="../../assets/js/hoverable-collapse.js"></script>
    <script src="../../assets/js/misc.js"></script>
    <script src="../../assets/js/settings.js"></script>
    <script src="../../assets/js/todolist.js"></script>
    <!-- endinject -->
    <!-- Custom js for this page -->
    <!-- End custom js for this page -->
  </body>
</html>