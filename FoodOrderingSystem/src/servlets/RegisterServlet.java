package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.CustomerDAO;

public class RegisterServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		
		ArrayList<String> userInfo = new ArrayList<String>();
		CustomerDAO customerDao = new CustomerDAO();
		PrintWriter out = response.getWriter(); 

		userInfo.add(0, request.getParameter("firstname"));
		userInfo.add(1, request.getParameter("lastname"));
		userInfo.add(2, request.getParameter("email"));
		userInfo.add(3, request.getParameter("password"));
		userInfo.add(4, request.getParameter("password-conf"));
		
		userInfo.add(5, request.getParameter("address1"));
		userInfo.add(6, request.getParameter("address2"));
		userInfo.add(7, request.getParameter("city"));
		userInfo.add(8, request.getParameter("province"));
		userInfo.add(9, request.getParameter("postalcode"));
		userInfo.add(10,request.getParameter("phone"));
		
		if(customerDao.register(userInfo) > 0){
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
