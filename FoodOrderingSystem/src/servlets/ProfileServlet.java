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

		String control = request.getParameter("control");
		String id = request.getSession().getAttribute("id").toString();
        System.out.println(control+"    "+id);
		if(control.equals("pwd")){
			String pwd1 = request.getParameter("password");
			String pwd2 = request.getParameter("password-conf");
			if(CustomerDAO.setCustomerPwd(pwd1, id)){
				out.print("<p>Password changed successfully.</p>");    
				RequestDispatcher rd=request.getRequestDispatcher("profile.jsp");    
				rd.include(request,response); 
			} else {
				out.print("<p>Unable to change password.</p>");    
				RequestDispatcher rd=request.getRequestDispatcher("profile.jsp");    
				rd.include(request,response);
			}
		}
		if(control.equals("profile")){
			String email = request.getParameter("email");
			String fname = request.getParameter("firstname");
			String lname = request.getParameter("lastname");
			String phone = request.getParameter("phone");
			String phone2 = request.getParameter("phone2");
			String subscribed;
			if(request.getParameter("subscribed") != null)
				subscribed = "yes";
			else
				subscribed = "no";
			if(CustomerDAO.setCustomerProfile(fname, lname, email, phone, phone2, subscribed, id)){
				out.print("<p>Profile Update was successful.</p>");    
				RequestDispatcher rd=request.getRequestDispatcher("profile.jsp");    
				rd.include(request,response); 
			} else {
				out.print("<p>Unable to update profile.</p>");    
				RequestDispatcher rd=request.getRequestDispatcher("profile.jsp");    
				rd.include(request,response); 
			}
		}
		if(control.equals("address")){
			String addr1 = request.getParameter("address1");
			String addr2 = request.getParameter("address2");
			String city = request.getParameter("city");
			String prov = request.getParameter("province");
			String cep = request.getParameter("postalcode");
			String phone = request.getParameter("phone");
			if(CustomerDAO.setCustomerAddress(addr1, addr2, city, prov, cep, phone, id)){
				out.print("<p>Address changed successfully.</p>");    
				RequestDispatcher rd=request.getRequestDispatcher("profile.jsp");    
				rd.include(request,response); 
			} else {
				out.print("<p>Unable to change address.</p>");    
				RequestDispatcher rd=request.getRequestDispatcher("profile.jsp");    
				rd.include(request,response);
			}
		

	}
}


}
