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

@WebServlet("/StudentManage")
public class StudentManage extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // 🔹 When page loads
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        AdminEventServ service = new AdminEventServImpl();
     
        HttpSession session=request.getSession();
        Integer AdminId=(Integer)session.getAttribute("AdminId");
        List<AdminEvent> studentList = service.ShowAllStudent(AdminId);
        request.setAttribute("EventStudent", studentList);
        
      request.getRequestDispatcher("AStudentMan.jsp")
      .forward(request, response);
    }


    // 🔹 When Add Event form is submitted
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String Name=request.getParameter("name");
	   	String Email=request.getParameter("email");
	    String Course=request.getParameter("course");
	    String College_Name=request.getParameter("college_name");
	    HttpSession session=request.getSession();
        Integer AdminId=(Integer)session.getAttribute("AdminId");
	   	
	    AdminEvent modelS = new AdminEvent();
	    modelS.setName(Name);
	    modelS.setS_Email(Email);
	    modelS.setS_Course(Course);
	    modelS.setSCollege_name(College_Name);
	    modelS.setAdminId(AdminId);
   	 
   	    AdminEventServ Serv = new AdminEventServImpl();
        Serv.isSaveStudentData(modelS);

        //response.sendRedirect("AdminEvent_M");
       response.sendRedirect(request.getContextPath() + "/StudentManage");

    }

}
