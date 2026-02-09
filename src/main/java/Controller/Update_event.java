package Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Servlet implementation class Update_event
 */
@WebServlet("/Update_event")
public class Update_event extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 		response.setContentType("text/html");
 		PrintWriter out=response.getWriter();
 		int update_EventId= Integer.parseInt(request.getParameter("id"));
 		out.write(update_EventId); 
 		String name =request.getParameter("name");
 		System.out.print("name is ="+name);
 		request.getRequestDispatcher("/AEventmanage").forward(request, response);
 		
 	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("/AEventmanage");
		doGet(request, response);
	}

}
