package com.customer;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.DatabaseConnection;

/**
 * Servlet implementation class AddReviews
 */
@WebServlet("/AddReviews")
public class AddReviews extends HttpServlet {
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int rid = 0;
		String customerName=request.getParameter("customerName");
		String movieName=request.getParameter("movieName");
		System.out.println("Movie Name==>>"+movieName);
		String review = request.getParameter("review");
		double rating = Double.parseDouble(request.getParameter("rating"));
		System.out.println("Ratings "+rating);
		HttpSession hs=request.getSession();
		try {
			int addQuestion = DatabaseConnection.insertUpdateFromSqlQuery("insert into tblreview(review_id,user,movie_name,content,ratings)values('"
							+ rid + "','" + customerName + "','"+movieName+"','" + review + "','" + rating + "')");
			if (addQuestion > 0) {
				String message = "Reviews submitted successfully.";
				hs.setAttribute("review", message);
				response.sendRedirect("customer-add-review.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
