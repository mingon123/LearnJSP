<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>뉴스 수정</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout.css" type="text/css">
<script type="text/javascript">
	window.onload=function(){
		const myForm = document.getElementById('modify_form');
		myForm.onsubmit=function(){
			const items = document.querySelectorAll('.input-check');
			for(let i=0;i<items.length;i++){
				if(items[i].value.trim()==''){
					const label = document.querySelector('label[for="'+items[i].id+'"]');
					alert(label.textContent + ' 입력 필수');
					items[i].value = '';
					items[i].focus();
					return false;
				} // end of if
			} // end of for
		};
	};
</script>
</head>
<body>
<div class="page-main">
	<h2>뉴스 수정</h2>
	<form id="modify_form" action="modify.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="num" value="${vo.num}">
		<ul>
			<li>
				<label for="title">제목</label>
				<input type="text" name="title" id="title" value="${vo.title}" size="30" maxlength="150" class="input-check">
			</li>
			<li>
				<label for="writer">작성자</label>
				<input type="text" name="writer" id="writer" value="${vo.writer}" size="10" maxlength="30" class="input-check"> 
			</li>
			<li>
				<label for="passwd">비밀번호</label>
				<input type="password" name="passwd" id="passwd" placeholder="*등록시 비밀번호 입력" size="20" maxlength="12" class="input-check"> 
			</li>
			<li>
				<label for="email">이메일</label>
				<input type="email" name="email" id="email" value="${vo.email}" size="20" maxlength="50" class="input-check"> 
			</li>
			<li>
				<label for="article">내용</label>
				<textarea rows="5" cols="40" name="article" id="article" class="input-check">${vo.article}</textarea>
			</li>
			<li>
				<label for="filename">이미지</label>
				<input type="file" name="filename" id="filename" accept="image/gif,image/png,image/jpeg">
				<c:if test="${!empty vo.filename}">
					<br>
					<img src="${pageContext.request.contextPath}/upload/${vo.filename}" width="100" style="margin-left:100px;">
				</c:if>
			</li>
		</ul>
		<div class="align-center">
			<input type="submit" value="수정">
			<input type="button" value="목록" onclick="location.href='list.do'">
		</div>
	</form>
</div>
</body>
</html>