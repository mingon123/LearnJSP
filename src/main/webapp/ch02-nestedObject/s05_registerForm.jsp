<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[실습]회원가입</title>
<script type="text/javascript">
	window.onload=function(){
		const myForm = document.getElementById('myForm');
		// 이벤트 연결
		myForm.onsubmit=function(){
			// const items = document.querySelectorAll('input[type="text"],input[type="password"],textarea');
			const items = document.querySelectorAll('.input-check'); // 클래스 명시 하면 이렇게 바뀜
			for(let i=0;i<items.length;i++){
				if(items[i].value.trim()==''){
					const label = document.querySelector('label[for="'+items[i].id+'"]');
					alert(label.textContent + '필수 입력');
					items[i].value = '';
					items[i].focus();
					return false;
				} // end of if
				
				if(items[i].id == 'id' && !/^[A-Za-z0-9]{4,12}$/.test(items[i].value)){
					alert('영문 또는 숫자 사용(4~12자)');
					items[i].value = '';
					items[i].focus();
					return false;
				}
			}
		}
	}
</script>
</head>
<body>
<form action="s06_register.jsp" method="post" id="myForm">

	<ul>
		<li>
			<label for="name">이름</label>
			<input type="text" name="name" id="name" class="input-check"><%-- name: 서버에 전송됨. parameterName의 약자, id: 서버에 전송되지 않음. CSS style or JS에서 쓰기 위해 --%>
		</li>
		<li>
			<label for="id">아이디</label>
			<input type="text" name="id" id="id" class="input-check">
		</li>
		<li>
			<label for="password">비밀번호</label>
			<input type="text" name="password" id="password" class="input-check">
		</li>
		<li>
			<label for="phone">전화번호</label>
			<input type="text" name="phone" id="phone" class="input-check">
		</li>
		<li>
			<label>취미</label>
			<input type="checkbox" name="hobby" value="영화보기">영화보기
			<input type="checkbox" name="hobby" value="음악감상">음악감상
			<input type="checkbox" name="hobby" value="등산">등산
			<input type="checkbox" name="hobby" value="춤">춤
		</li>
		<li>
			<label for="content">자기소개</label>
			<textarea rows="5" cols="60" name="content" id="content" class="input-check"></textarea>
		</li>		
	</ul>
	<input type="submit" value="전송">
</form>
</body>
</html>