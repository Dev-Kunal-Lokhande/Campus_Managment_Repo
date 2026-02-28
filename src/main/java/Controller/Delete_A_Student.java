package Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import Service.AdminEventServ;
import Service.AdminEventServImpl;

@WebServlet("/Delete_A_Student")
public class Delete_A_Student extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int Deleteid=Integer.parseInt(request.getParameter("id"));
		AdminEventServ ser=new AdminEventServImpl();
		boolean s=ser.isdeleteASTudent(Deleteid);
		if (s) {
			
			request.getRequestDispatcher("StudentManage").forward(request, response);
		  
		}
		else {
		
			request.getRequestDispatcher("StudentManage").forward(request, response);
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("/StudentManage");
		doGet(request, response);
	}

}
