<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채팅 상세</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout.css" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
$(function(){
	// 웹소켓 시작
	const message_socket = new WebSocket("ws://localhost:8080/mvcPage/webSocket");
	message_socket.onopen = function(evt){
		message_socket.send("board:"); // board:(:앞)는 카테고리, (:뒤)는 채팅이 동시에 일어날 때 그룹을 분류하여 함. db에 데이터를 넣지 않으면 :뒤에 값을 입력함. 우리는 db에 데이터가 있기 때문에 board: 까지만 입력
	}
	// 서버로부터 메시지를 받으면 호출되는 함수 지정
	message_socket.onmessage = function(evt){
		// 메시지 알림
		let data = evt.data;
		if(data.substring(0,6) == 'board:'){
			console.log('데이터 처리');
			selectData();
		}
	}
	message_socket.onclose = function(evt){
		// 소켓이 종료된 후 부과적인 작업없이 있을 경우 명시
		console.log('chat close');
	}
	// 웹소켓 끝
	
	// 채팅 메시지 전송을 위한 enter key 처리
	$('#message').keydown(function(event){
		if(event.keyCode == 13 && !event.shiftKey){ // shift+enter는 줄바꿈 처리하도록하기 위해 shift는 제외
			// trigger : 이벤트 발생
			$('#chatting_form').trigger('submit');
		}
	});
	
	// 채팅 메시지 표시
	function selectData(){
		// 서버와 통신
		$.ajax({
			url:'chatMessageList.do',
			type:'post',
			data:{chatroom_num:$('#chatroom_num').val()},
			dataType:'json',
			success:function(param){
				if(param.result == 'logout'){
					alert('로그인 후 사용하세요!');
					message_socket.close();
				}else if(param.result == 'success'){
						
				$('#chatting_message').empty();
				
				let chat_date='';
				$(param.list).each(function(index,item){
					let output = '';
					// 날짜 추출
					if(chat_date != item.chat_date.split(' ')[0]){ // 초기값(빈문자열)이면 날짜 생성
						chat_date = item.chat_date.split(' ')[0];
						output += '<div class="date-position"><span>'+chat_date+'</span></div>';
					}
					// 채팅 메시지 작성자 회원번호와 로그인한 회원번호 일치 여부 체크
					if(item.mem_num == ${user_num}){ // 일치
						output += '<div class="from-position">' + item.id;
					}else{ // 불일치
						output += '<div class="to-position">' + item.id;						
					}
					output += '<div class="item">';
					output += (item.read_check != 0 ? '<b>①</b>' : '') + ' <span>' + item.message + '</span>'; // ㅇ+한자로 원문자
					// 시간 표시
					output += '<div class="align-right">' + item.chat_date.split(' ')[1] + '</div>';
					output += '</div>';
					output += '</div>';
					
					// 문서 객체에 추가
					$('#chatting_message').append(output);
					// 스크롤을 하단으로 위치
					$('#chatting_message').scrollTop($('#chatting_message')[0].scrollHeight);
				});
				
				}else{
					alert('채팅 메시지 호출 오류');
					message_socket.close();
				}
			},
			error:function(){
				alert('네트워크 오류 발생');
				message_socket.close();
			}
		});
	}
	// 채팅 등록
	$('#chatting_form').submit(function(event){
		if($('#message').val().trim()==''){
			alert('내용을 입력하세요');
			$('#message').val('').focus();
			return false;
		}
		
		let form_data = $(this).serialize();
		// 서버와 통신
		$.ajax({
			url:'chatWrite.do',
			type:'post',
			data:form_data,
			dataType:'json',
			success:function(param){
				if(param.result == 'logout'){
					alert('로그인해야 작성할 수 있습니다.');
					message_socket.close();
				}else if(param.result == 'success'){
					// 폼 초기화
					$('#message').val('').focus();
					// 채팅 메시지 목록 호출
					// selectData(); -> 기존 코드에는 호출에서 웹소켓하면서 아래처럼 변경
					message_socket.send('board:');
				}else{
					alert('메시지 등록 오류 발생');
					message_socket.close();
				}
			},
			error:function(){
				alert('네트워크 오류 발생');
				message_socket.close();
			}
		});
		// 기본 이벤트 제거
		event.preventDefault();
	});
	// 초기 채팅 메시지 호출
	// selectData();
});
</script>
</head>
<body>
<div class="page-main">
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div class="content-main">
		<c:if test="${user_num == boardChatRoomVO.reader_num}">
			<h2>
				[${boardChatRoomVO.title}]의 
				등록자 <small>${boardChatRoomVO.writer_id}</small>님과 채팅
			</h2>
		</c:if>
		<c:if test="${user_num == boardChatRoomVO.writer_num}">
			<h2>
				[${boardChatRoomVO.title}]에 관심이 있는
				사용자 <small>${boardChatRoomVO.reader_id}</small>님과 채팅
			</h2>
		</c:if>
		<div id="chatting_message"></div>
		<form id="chatting_form">
			<input type="hidden" name="chatroom_num" value="${boardChatRoomVO.chatroom_num}" id="chatroom_num">
			<ul>
				<li>
					<label for="message">내용</label>
					<textarea rows="5" cols="40" name="message" id="message"></textarea>
					<input type="submit" value="전송">
				</li>
			</ul>
		</form>
	</div>
</div>
</body>
</html>