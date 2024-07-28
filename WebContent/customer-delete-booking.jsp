<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.connection.*"%>
<%
	int movieId=Integer.parseInt(request.getParameter("movieId"));
	String movieName=request.getParameter("movieName");
	String created_at=request.getParameter("created_at");
	try{
		int deleteMovie=DatabaseConnection.insertUpdateFromSqlQuery("delete from tblmoviebooking where movie_id='"+movieId+"' and movie_name='"+movieName+"' and created_at='"+created_at+"' ");
		if(deleteMovie>0){
			String message="Movie booking deleted sucessfully.";
			session.setAttribute("delete-movie", message);
			response.sendRedirect("customer-view-own-movie-booked-list.jsp");
		}
	}catch(Exception e){
		e.printStackTrace();
	}
%>