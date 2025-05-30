<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.story.dao.StoryDAO" %>
<%@ page import="kr.story.vo.StoryVO" %>
<%
	Long story_num = Long.parseLong(request.getParameter("story_num"));
	StoryDAO dao = StoryDAO.getInstance();
	StoryVO storyVO = dao.getStory(story_num);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글 상세</title>
<link rel="stylesheet" href="../css/style.css" type="text/css">
</head>
<body>
<div class="page-main">
	<h1>게시판 글 상세</h1>
	<ul>
		<li>번호 : <%= storyVO.getStory_num() %></li>
		<li>제목 : <%= storyVO.getTitle() %></li>
		<li>작성자 : <%= storyVO.getId() %></li>		
	</ul>
	<hr size="1" noshade="noshade" width="100%">
	<p>
		<%= storyVO.getContent() %>
	</p>
	<div class="align-right">
		작성일 : <%= storyVO.getReg_date() %>
<%
	Long user_num = (Long)session.getAttribute("user_num");
	if(user_num!=null && user_num == storyVO.getSnum()){
	// 로그인한 회원번호와 작성자 회원번호가 일치한 경우
%>
		<input type="button" value="수정" onclick="location.href='updateForm.jsp?story_num=<%= story_num %>'">
		<input type="button" value="삭제" id="delete_btn">
		<script type="text/javascript">
			const delete_btn = document.getElementById('delete_btn');
			delete_btn.onclick=function(){
				let choice = confirm('삭제하시겠습니까?');
				if(choice){
					location.replace('delete.jsp?story_num=<%= story_num %>');
				}
			}
		</script>

<%
	}
%>
	<input type="button" value="목록" onclick="location.href='list.jsp'">
	</div>
</div>
</body>
</html>