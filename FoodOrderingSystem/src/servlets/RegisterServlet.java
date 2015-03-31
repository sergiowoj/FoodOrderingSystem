package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.CustomerDAO;
import beans.CustomerBean;

public class RegisterServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		
		CustomerBean customer;
		PrintWriter out = response.getWriter();
		String subscribed;
		
		if(request.getParameter("subscribed") != null)
			subscribed = "yes";
		else
			subscribed = "no";
		
		customer = new CustomerBean(
				request.getParameter("firstname"),
				request.getParameter("lastname"),
				request.getParameter("email"),
				request.getParameter("phone"),
				request.getParameter("phone2"),
				subscribed
				);
		
		if(CustomerDAO.register(customer) > 0){
			out.print("<p>Register successfully. You can sign in now.</p>");    
            RequestDispatcher rd=request.getRequestDispatcher("index.jsp");    
            rd.include(request,response); 
		} else {
			out.print("<p>Unable to register.</p>");    
            RequestDispatcher rd=request.getRequestDispatcher("register.jsp");    
            rd.include(request,response); 
		}

	}


}
