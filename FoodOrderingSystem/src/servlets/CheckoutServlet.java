package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.CustomerDAO;
import beans.ShoppingCartBean;

public class CheckoutServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		
//		PrintWriter out = response.getWriter();
		
//				request.getParameter("address1"),
		
		
		ShoppingCartBean cart = (ShoppingCartBean) request.getSession().getAttribute("cart");
		cart.checkout();
		
		if(request.getParameter("saveaddress") != null){
			CustomerDAO.addAddress(
					request.getParameter("alias"),
					request.getParameter("address1"),
					request.getParameter("address2"), 
					request.getParameter("city"), 
					request.getParameter("province"), 
					request.getParameter("postalcode"), 
					request.getParameter("phone"), 
					request.getParameter("buzzer"), 
					request.getSession().getAttribute("id").toString()
					);
			
		}


	}


}