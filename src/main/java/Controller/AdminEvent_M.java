package Controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import com.sun.net.httpserver.Request;

import Model.AdminEvent;
import Service.AdminEventServ;
import Service.AdminEventServImpl;

@WebServlet("/AdminEvent_M")
public class AdminEvent_M extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // 🔹 When page loads
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        AdminEventServ service = new AdminEventServImpl();
     
        int totalEvent = service.showCountEvent();
        request.setAttribute("totalEvent", totalEvent);

        List<AdminEvent> eventList = service.ViewData();
        System.out.println("Event List Size: " + eventList.size());
        request.setAttribute("eventList", eventList);
        
        List<AdminEvent> studentList = service.ShowAllStudent();
        request.setAttribute("EventStudent", studentList);
        
        request.getRequestDispatcher("AdminEvent.jsp")
               .forward(request, response);
    }


    // 🔹 When Add Event form is submitted
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String date = request.getParameter("date");
        String location = request.getParameter("location");

        AdminEvent model = new AdminEvent();
        model.setName(name);
        model.setEDate(date);
        model.setLocation(location);

        AdminEventServ service = new AdminEventServImpl();
        service.isSaveData(model);
        
        String Name=request.getParameter("name");
	   	String Email=request.getParameter("email");
	    String Course=request.getParameter("course");
	    String College_Name=request.getParameter("college_name");
	   	
	    AdminEvent modelS = new AdminEvent();
	    modelS.setName(Name);
	    modelS.setS_Email(Email);
	    modelS.setS_Course(Course);
	    modelS.setSCollege_name(College_Name);
   	 
   	    AdminEventServ Serv = new AdminEventServImpl();
        Serv.isSaveStudentData(modelS);

        //response.sendRedirect("AdminEvent_M");
       response.sendRedirect(request.getContextPath() + "/AdminEvent_M");

    }

}
