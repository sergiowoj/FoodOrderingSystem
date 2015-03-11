package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.CustomerDAO;

public class LoginServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		response.setContentType("text/html");
        PrintWriter out = response.getWriter();    
          
        String email = request.getParameter("email");    
        String password = request.getParameter("password");
             
        HttpSession session = request.getSession(false);
  
        if(CustomerDAO.login(email, password)){
        	ArrayList<String> userInfo = CustomerDAO.getUserInfo(email);
        	if(session!=null){
	        	session.setAttribute("id", userInfo.get(0));
	        	session.setAttribute("firstname", userInfo.get(1));
	        	session.setAttribute("lastname", userInfo.get(2));
	        	session.setAttribute("email", userInfo.get(3));
        	}
        	
        	if(request.getParameter("origin").equals("menu")){
        		//System.out.println(request.getParameter("origin"));
        		//rd = request.getRequestDispatcher("menu.jsp");  
        		response.sendRedirect("menu.jsp");
            } else {
        	
            	RequestDispatcher rd = request.getRequestDispatcher("index.jsp");   
	            rd.forward(request,response);
            }
        	  
        }    
        else{    
            out.print("<p style=\"color:red\">Sorry username or password error</p>");    
            RequestDispatcher rd = request.getRequestDispatcher("login.jsp");    
            rd.include(request,response);    
        }    
  
        out.close();
	}

}
