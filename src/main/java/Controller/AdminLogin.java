package Controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.*;

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
		boolean b =logServ.isVerify(log);
		if(b) {
			RequestDispatcher r = request.getRequestDispatcher("AdminEvent.jsp");
			r.include(request, response);
			
		}else {
			out.print("log in faild");
			RequestDispatcher r = request.getRequestDispatcher("AdminLogin.html");
			r.include(request, response);
			
			
		}
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
