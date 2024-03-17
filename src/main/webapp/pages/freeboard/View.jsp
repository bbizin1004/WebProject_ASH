<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>회원제 게시판 - 상세 보기(View)</h2>
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
				<button type="button"
					onclick="location.href='../freeboard/pass.do?mode=edit&num=${ param.num }';">
					수정하기</button>
				<button type="button"
					onclick="location.href='../freeboard/pass.do?mode=delete&num=${ param.num }';">
					삭제하기</button>
				<button type="button" onclick="location.href='../freeboard/list.do';">
					목록 바로가기</button>
			</td>
		</tr>
	</table>
	</form>

</body>
</html>