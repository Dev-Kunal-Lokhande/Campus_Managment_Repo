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
//		boolean b =logServ.isVerify(log);
//		if(b) {
////			HttpSession session = request.getSession();
////			session.setAttribute("Admin", log.getName());
////			response.sendRedirect("AdminEvent_M");
//			RequestDispatcher re = request.getRequestDispatcher("AdminEvent_M");
//			re.include(request, response);
//		}else {
//			out.print("log in faild");
//			RequestDispatcher r = request.getRequestDispatcher("AdminLogin.html");
//			r.include(request, response);
//			
//			
//		}
		
		AdminRegister adminObj = logServ.isVerify(log);

		if(adminObj != null) {

		    HttpSession session = request.getSession();
		    session.setAttribute("Admin", adminObj.getName()); // 👈 NAME store karto

		    response.sendRedirect("AdminEvent_M");

		} else {

		    request.getRequestDispatcher("AdminLogin.html")
		           .forward(request, response);
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
