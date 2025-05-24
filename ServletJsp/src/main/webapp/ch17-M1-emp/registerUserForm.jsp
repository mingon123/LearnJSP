<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원 등록</title>
<link rel="stylesheet" href="../css/style.css" type="text/css">
<script type="text/javascript" src="../js/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		let count = 0;
		$('#confirm_id').click(function(){
			if($('#id').val().trim()==''){
				alert('아이디를 입력하세요!');
				$('#id').val('').focus();
				return;
			}
			$.ajax({
				url:'confirmId.jsp',
				type:'post',
				data:{id:$('#id').val()},
				dataType:'json',
				success:function(param){
					if(param.result == 'idDuplicated'){
						count = 0;
						$('#id_signed').text('아이디 중복').css('color','red');
						$('#id').val('').focus();
					}else if(param.result == 'idNotFound'){
						count = 1;
						$('#id_signed').text('사용 가능 아이디').css('color','black');
					}else{
						count = 0;
						alert('아이디 중복 체크 오류');
					}
				},
				error:function(){
					count = 0;
					alert('네트워크 오류 발생');
				}
			});
		}); // end of click
		
		$('#id').keydown(function(){
			count = 0;
			$('#id_signed').text('');
		});
		
		$('#register_form').submit(function(){
			const items = document.querySelectorAll('.input-check');
			for(let i=0;i<items.length;i++){
				if(items[i].value.trim()==''){
					const label = document.querySelector('label[for="'+items[i].id+'"]');
					alert(label.textContent + ' 입력 필수');
					items[i].value = '';
					items[i].focus();
					return false;
				}
				
				if(items[i].id == 'id' && count == 0){
					alert('아이디 중복체크 필수');
					return false;
				}
			}
		});
	});
</script>
</head>
<body>
<div class="page-main">
	<h1>사원등록</h1>
	<form action="registerUser.jsp" method="post" id="register_form">
		<ul>
			<li>
				<label for="id">아이디</label>
				<input type="text" name="id" id="id" size="7" maxlength="12" autocomplete="off" class="input-check">
				<input type="button" id="confirm_id" value="ID중복확인">
				<span id="id_signed"></span>
			</li>
			<li>
				<label for="name">이름</label>
				<input type="text" name="name" id="name" class="input-check" maxlength="3">
			</li>
			<li>
				<label for="passwd">비밀번호</label>
				<input type="password" name="passwd" id="passwd" class="input-check" maxlength="12">
			</li>
			<li>
				<label for="salary">급여</label>
				<input type="number" name="salary" id="salary" class="input-check" maxlength="8" min="0" max="99999999">
			</li>
			<li>
				<label for="job">업무</label>
				<input type="text" name="job" id="job" class="input-check" maxlength="30">
			</li>
		</ul>
		<div class="align-center">
			<input type="submit" value="등록">
			<input type="button" value="홈으로" onclick="location.href='main.jsp'">
		</div>
	</form>
</div>
</body>
</html>