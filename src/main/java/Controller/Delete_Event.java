package Controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import Model.AdminEvent;
import Service.AdminEventServ;
import Service.AdminEventServImpl;

/**
 * Servlet implementation class DeleteAE
 */
@WebServlet("/DeleteAE")
public class Delete_Event extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			response.setContentType("text/html");
			PrintWriter out=response.getWriter();
			int Deleteid =Integer.parseInt( request.getParameter("id")) ;
//	        out.write("Deleted ID: " + Deleteid);
			AdminEventServ ser = new AdminEventServImpl();
			boolean b = ser.isDeleteEvent(Deleteid);
			if (b) {
				out.write(" delete event");
				request.getRequestDispatcher("AEventmanage").forward(request, response);
			  
			}
			else {
				out.write("not delete event");
				request.getRequestDispatcher("AEventmanage").forward(request, response);
			}
			
			
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("/AEventmanage");
		doGet(request, response);
	}

}
