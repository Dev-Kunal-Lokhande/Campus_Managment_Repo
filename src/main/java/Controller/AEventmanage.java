package Controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import com.sun.net.httpserver.Request;

import Model.AdminEvent;
import Service.AdminEventServ;
import Service.AdminEventServImpl;

@WebServlet("/AEventmanage")
public class AEventmanage extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // 🔹 When page loads
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
    	AdminEventServ service = new AdminEventServImpl();
    	HttpSession session =request.getSession();
    	Integer AdminId=(Integer)session.getAttribute("AdminId");
    	
        List<AdminEvent> eventList = service.ViewData(AdminId);
        System.out.println("Event List Size: " + eventList.size());
        request.setAttribute("eventList", eventList);
        

        
      request.getRequestDispatcher("AdminEventManag.jsp")
      .forward(request, response);
    }


    // 🔹 When Add Event form is submitted
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String date = request.getParameter("date");
        String location = request.getParameter("location");
        HttpSession session =request.getSession();
    	Integer AdminId=(Integer)session.getAttribute("AdminId");
        AdminEvent model = new AdminEvent();
        model.setName(name);
        model.setEDate(date);
        model.setLocation(location);
        model.setAdminId(AdminId);

        AdminEventServ service = new AdminEventServImpl();
        service.isSaveData(model);
        
       response.sendRedirect(request.getContextPath() + "/AEventmanage");

    }

}
