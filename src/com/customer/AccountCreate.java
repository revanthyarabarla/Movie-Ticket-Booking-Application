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
 * Servlet implementation class AccountCreate
 */
@WebServlet("/AccountCreate")
public class AccountCreate extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String customerId=request.getParameter("customerId");
		String customerName = request.getParameter("customerName");
		String emailId = request.getParameter("emailId");
		String mobile = request.getParameter("mobile");
		String uname = request.getParameter("uname");
		String upass = request.getParameter("upass");
		HttpSession hs = request.getSession();
		
		try {
			int clientAccount=DatabaseConnection.insertUpdateFromSqlQuery("insert into tblcustomer(customer_id,customer_name,email,mobile_no,uname,upass) values('"+customerId+"','"+customerName+"','"+emailId+"','"+mobile+"','"+uname+"','"+upass+"')");
			if(clientAccount>0) {
				String message="Account created successfully.";
				hs.setAttribute("success-message", message);
				response.sendRedirect("customer-register.jsp");
			}else {
				response.sendRedirect("customer-register.jsp");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}

}
