package Controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.*;

import Model.AdminRegister;
import Service.AdminLog;
import Service.AdminLogImpl;

import java.sql.*;
import java.io.*;
@WebServlet("/AdminLogin")
public class AdminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		String name = request.getParameter("name");
		String pass = request.getParameter("password");
		Model.AdminLogin log = new Model.AdminLogin();
		log.setName(name);
		log.setPassword(pass);
		
		AdminLog logServ= new AdminLogImpl();		
		AdminRegister adminObj = logServ.isVerify(log);
       
		if(adminObj != null) {
			 System.out.print(adminObj.getEmail());
			 System.out.print(adminObj.getPassword());
		    HttpSession session = request.getSession();
		    session.setAttribute("Admin", adminObj.getName());
		    session.setAttribute("AdminId", adminObj.getAdmin_id());
		    
		    session.setAttribute("loginMsg", "Login Successful");
		    
		    response.sendRedirect("AdminEvent_M");

		} else {
			HttpSession session=request.getSession();
			session.setAttribute("loginError", "Loging faild");
		    request.getRequestDispatcher("AdminLogin.jsp")
		           .forward(request, response);
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
