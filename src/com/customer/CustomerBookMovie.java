package com.customer;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.DatabaseConnection;

/**
 * Servlet implementation class CustomerBookMovie
 */
@WebServlet("/CustomerBookMovie")
public class CustomerBookMovie extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id=0;
		int movieId=Integer.parseInt(request.getParameter("movieId"));
		String movieName=request.getParameter("movieName");
		String bookingDate=request.getParameter("bookingDate");
		String showTime=request.getParameter("showTime");
		int noOfPerson=Integer.parseInt(request.getParameter("noOfPerson"));
		double moviePrice=Double.parseDouble(request.getParameter("moviePrice"));
		double finalAmount=noOfPerson*moviePrice;
		HttpSession hs=request.getSession();
		hs.setAttribute("finalAmount", finalAmount);
		try{
			int i=DatabaseConnection.insertUpdateFromSqlQuery("insert into tblmoviebooking(id,customer_name,email,mobile,movie_id,movie_name,book_date,movie_show_time,no_of_Person,finalAmount)values('"+id+"','"+hs.getAttribute("customer_name")+"','"+hs.getAttribute("email")+"','"+hs.getAttribute("customer_mobile")+"','"+movieId+"','"+movieName+"','"+bookingDate+"','"+showTime+"','"+noOfPerson+"','"+finalAmount+"')");
			if(i>0) {
				response.sendRedirect("customer-proceed-payment.jsp");
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}

}
