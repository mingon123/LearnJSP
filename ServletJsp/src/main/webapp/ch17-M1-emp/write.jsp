<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.story.dao.StoryDAO" %>
<%
	Long user_num = (Long)session.getAttribute("user_num");
	if(user_num==null){
		response.sendRedirect("loginForm.jsp");
	}else{
%>
<jsp:useBean id="story" class="kr.story.vo.StoryVO"/>
<jsp:setProperty property="*" name="story"/>
<%
	story.setSnum(user_num);
	story.setIp(request.getRemoteAddr());
	
	StoryDAO dao = StoryDAO.getInstance();
	dao.insertStory(story);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기 완료</title>
<link rel="stylesheet" href="../css/style.css" type="text/css">
</head>
<body>
<div class="page-main">
	<h1>글쓰기 완료</h1>
	<div class="result-display">
		<div class="align-center">
			게시판에 글을 등록했습니다.<p>
			<button onclick="location.href='list.jsp'">목록</button>
		</div>
	</div>
</div>
</body>
</html>
<%
	}
%>