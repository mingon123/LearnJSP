<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.employee.dao.EmployeeDAO" %>
<%@ page import="kr.employee.vo.EmployeeVO" %>
<%
	String id = request.getParameter("id");

	EmployeeDAO dao = EmployeeDAO.getInstance();
	EmployeeVO vo = dao.checkEmployee(id);
	if(vo!=null){
%>
		{"result":"idDuplicated"}
<%
	}else{
%>
		{"result":"idNotFound"}
<%
	}
%>