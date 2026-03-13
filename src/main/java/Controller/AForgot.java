package Controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.security.interfaces.RSAKey;

import Model.AdminRegister;
import Service.AdminServ;
import Service.AdminServImpl;

@WebServlet("/AForgot")
public class AForgot extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	String email =request.getParameter("email");
	System.out.println(email);
	
	AdminServ service = new AdminServImpl();
	AdminRegister a=service.getAdminByEmail(email);
	if(a!=null) {
		HttpSession session=request.getSession();
		session.setAttribute("password",a.getPassword());
		RequestDispatcher d =request.getRequestDispatcher("AshowPass.jsp");
		d.forward(request, response);
	}else {
		HttpSession session=request.getSession();
		session.setAttribute("passError","Email not found ");
		response.sendRedirect("AdminForgotPass.jsp");
	}
	

		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
