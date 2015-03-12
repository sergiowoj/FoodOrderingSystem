package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.CustomerDAO;


public class ProfileServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{

		PrintWriter out = response.getWriter();
		String subscribed;

		if(request.getParameter("subscribed") != null)
			subscribed = "yes";
		else
			subscribed = "no";


		
		request.getParameter("firstname");
		request.getParameter("lastname");
		request.getParameter("address1");
		request.getParameter("address2");
		request.getParameter("city");
		request.getParameter("province");
		request.getParameter("postalcode");
		request.getParameter("email");
		request.getParameter("phone");
		request.getParameter("phone2");



		if(CustomerDAO.setCustomerPwd(request.getParameter("password"), request.getSession().getAttribute("id").toString())){
			out.print("<p>Password changed successfully.</p>");    
			RequestDispatcher rd=request.getRequestDispatcher("profile.jsp");    
			rd.include(request,response); 
		} else {
			out.print("<p>Unable to change password.</p>");    
			RequestDispatcher rd=request.getRequestDispatcher("register.jsp");    
			rd.include(request,response); 
		}

	}


}
