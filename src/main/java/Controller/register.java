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
		PrintWriter out = response.getWriter();
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String contact = request.getParameter("contact");
			String password = request.getParameter("password");
					
			AdminRegister adminReg = new AdminRegister();
			adminReg.setName(name);
			adminReg.setEmail(email);
			adminReg.setContact(contact);
			adminReg.setPassword(password);
			
			AdminServ AdService = new AdminServImpl();
			boolean b= AdService.isAddData(adminReg);
			if(b) {
				HttpSession session = request.getSession();
				session.setAttribute("Admin", name);
				RequestDispatcher re = request.getRequestDispatcher("AdminLogin.html");
				re.include(request, response);
			}else {
				out.write("<h1> failed registration </h1>");
				RequestDispatcher re = request.getRequestDispatcher("AdminRegister.html");
				re.include(request, response);
			}
			
		}
		
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
