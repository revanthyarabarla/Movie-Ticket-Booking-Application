<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.connection.*"%>
<%
	int movieId=Integer.parseInt(request.getParameter("movieId"));
	try{
		int deleteMovie=DatabaseConnection.insertUpdateFromSqlQuery("delete from tblmovie where movie_id='"+movieId+"'");
		if(deleteMovie>0){
			String message="Movie deleted sucessfully.";
			session.setAttribute("delete-movie", message);
			response.sendRedirect("admin-view-movie-list.jsp");
		}
	}catch(Exception e){
		e.printStackTrace();
	}
%>