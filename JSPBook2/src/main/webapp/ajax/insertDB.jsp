<%@page import="java.sql.SQLException"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="QueryBean" scope="page" class="db.beans.QueryBean"  />
<jsp:setProperty property="*" name="QueryBean" />

<%
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("pragma", "no-cache");
	response.setDateHeader("Expires", 0);
	
	request.setCharacterEncoding("UTF-8");
// 	String user_id = "";
// 	if(request.getParameter("user_id") == null )
// 		user_id = "";
// 	else
// 		user_id = request.getParameter("user_id").trim();
		
	String user_id = (request.getParameter("user_id") == null) ? "" : request.getParameter("user_id").trim();
	String user_name = (request.getParameter("user_name") == null) ? "" : request.getParameter("user_name").trim();
	String user_phone = (request.getParameter("user_phone") == null) ? "" : request.getParameter("user_phone").trim();
	String user_grade = (request.getParameter("user_grade") == null) ? "" : request.getParameter("user_grade").trim();
	
	QueryBean.getConnection();
	
// 	ArrayList resArr = new ArrayList();
	int res = 0;
	try {
		res = QueryBean.insertUserInfo(user_id, user_name, user_phone, user_grade);
		
	} catch (Exception e) {
		out.print(e.toString());
	} finally {
		QueryBean.closeConnection();
	}
	
	if (res == 0) {
		out.println("{\"RESULT_OK\" : \"failed\"}");
	} else {
		out.println("{\"RESULT_OK\" : \"1\"}");
	}
%>