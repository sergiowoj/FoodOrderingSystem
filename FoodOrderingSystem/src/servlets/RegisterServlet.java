package servlets;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.CustomerDAO;
import model.PasswordEncryptionService;
import beans.CustomerBean;

public class RegisterServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private PasswordEncryptionService pw = new PasswordEncryptionService();

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		
		CustomerBean customer;
		String subscribed;
		
		if(request.getParameter("subscribed") != null)
			subscribed = "yes";
		else
			subscribed = "no";
		
		String password = request.getParameter("password");
		byte[] encryptedPwd = null;
        byte[] salt = null;
        
		try {
			salt = pw.generateSalt();
			encryptedPwd = pw.getEncryptedPassword(password, salt);
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvalidKeySpecException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		
		
		
		customer = new CustomerBean(
				encryptedPwd,
				salt,
				request.getParameter("firstname"),
				request.getParameter("lastname"),
				request.getParameter("email"),
				request.getParameter("phone"),
				request.getParameter("phone2"),
				subscribed
				);
		
		if(CustomerDAO.register(customer) > 0){
			request.setAttribute("successMessage", "Registration successful. You can sign in now.");
            RequestDispatcher rd=request.getRequestDispatcher("login.jsp");    
            rd.include(request,response); 
		} else {
			request.setAttribute("errorMessage", "Unable to register. Please check your info and try submitting again.");   
            RequestDispatcher rd=request.getRequestDispatcher("register.jsp");    
            rd.include(request,response); 
		}

	}


}
