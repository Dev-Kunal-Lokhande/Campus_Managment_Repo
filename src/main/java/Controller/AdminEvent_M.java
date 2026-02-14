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

@WebServlet("/AdminEvent_M")
public class AdminEvent_M extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // 🔹 When page loads
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        AdminEventServ service = new AdminEventServImpl();
        HttpSession session =request.getSession(); 
        Integer AdminId=(Integer)session.getAttribute("AdminId");
    	if(AdminId == null) {
    		response.sendRedirect("AdminLogin.jsp");
    		return;
    	}
     
        int totalEvent = service.showCountEvent(AdminId);
        request.setAttribute("totalEvent", totalEvent);
        int totalStudent = service.ShowStudentCount(AdminId);
        request.setAttribute("totalStudent", totalStudent);
        System.out.print("Student count = "+totalStudent);
        List<AdminEvent> eventList = service.ViewData(AdminId);
        
        request.setAttribute("eventList", eventList);
        
        List<AdminEvent> studentList = service.ShowAllStudent(AdminId);
        request.setAttribute("EventStudent", studentList);
        
       
       
        
      request.getRequestDispatcher("AdminEvent.jsp")
      .forward(request, response);
    }


    // 🔹 When Add Event form is submitted
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
    	String form_type=request.getParameter("formType");
    	HttpSession session =request.getSession(); //Add Register admin id!
    	if("event".equals(form_type)){
    		
    		
    	   	
            String name = request.getParameter("name");
            String date = request.getParameter("date");
            String location = request.getParameter("location");
            Integer AdminId=(Integer)session.getAttribute("AdminId");
        	if(AdminId == null) {
        		response.sendRedirect("AdminLogin.jsp");
        		return;
        	}
        	

            AdminEvent model = new AdminEvent();
            model.setName(name);
            model.setEDate(date);
            model.setLocation(location);
            model.setAdminId(AdminId);
      

            AdminEventServ service = new AdminEventServImpl();
            service.isSaveData(model);
    	}else {
    		 Integer AdminId=(Integer)session.getAttribute("AdminId");
         	if(AdminId == null) {
         		response.sendRedirect("AdminLogin.jsp");
         		return;
         	}
    		  String Name=request.getParameter("name");
    		   	String Email=request.getParameter("email");
    		    String Course=request.getParameter("course");
    		    String College_Name=request.getParameter("college_name"); 
    		   	
    		    AdminEvent modelS = new AdminEvent();
    		    modelS.setName(Name);
    		    modelS.setS_Email(Email);
    		    modelS.setS_Course(Course);
    		    modelS.setSCollege_name(College_Name);
    	   	    modelS.setAdminId(AdminId);
    	   	    AdminEventServ Serv = new AdminEventServImpl();
    	        Serv.isSaveStudentData(modelS);
    	}
    	
       //response.sendRedirect("AdminEvent_M");
       response.sendRedirect(request.getContextPath() + "/AdminEvent_M");

    }

}
