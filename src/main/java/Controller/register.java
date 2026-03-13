package Controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import Model.AdminRegister;
import Service.AdminServ;
import Service.AdminServImpl;
import java.io.*;

@WebServlet("/register")
public class register extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("Text/html");
		
		String name = request.getParameter("name").trim();
		String email = request.getParameter("email").trim();
		String contact = request.getParameter("contact").trim();
		String password = request.getParameter("password").trim();

		AdminRegister adminReg = new AdminRegister();
		adminReg.setName(name);
		adminReg.setEmail(email);
		adminReg.setContact(contact);
		adminReg.setPassword(password);

		AdminServ AdService = new AdminServImpl();
		if (AdService.isEmailExists(email)) {
			HttpSession session = request.getSession();

			session.setAttribute("registerMsg", "Email is duplicate. Please use another email.");
			RequestDispatcher rd = request.getRequestDispatcher("AdminRegister.jsp");

			rd.forward(request, response);
		}

		boolean b = AdService.isAddData(adminReg);
		if (b) {
			HttpSession session = request.getSession();
			session.setAttribute("Admin", name);
			session.setAttribute("registerMsg", "Registration Succsefull");
			RequestDispatcher re = request.getRequestDispatcher("AdminLogin.jsp");
			re.include(request, response);
		} else {
			HttpSession session = request.getSession();
			session.setAttribute("registerMsg", "Registration Failed");
			RequestDispatcher re = request.getRequestDispatcher("AdminRegister.jsp");
			re.forward(request, response);
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
