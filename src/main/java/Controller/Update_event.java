package Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import Model.AdminEvent;
import Service.AdminEventServ;
import Service.AdminEventServImpl;

@WebServlet("/Update_event")
public class Update_event extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.sendRedirect("AEventmanage");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {

            int id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");
            String date = request.getParameter("date");
            String location = request.getParameter("location");
            int adminId = Integer.parseInt(request.getParameter("adminId"));
            
//            System.out.println("ID: " + request.getParameter("id"));
//            System.out.println("AdminId: " + request.getParameter("adminId"));


            AdminEvent model = new AdminEvent();
            model.setId(id);
            model.setName(name);
            model.setEDate(date);
            model.setLocation(location);
            model.setAdminId(adminId);

            AdminEventServ service = new AdminEventServImpl();
            boolean result = service.isUpdateEvent(model);

            if (result) {
                response.sendRedirect("AEventmanage");
            } else {
                response.getWriter().println("Update Failed");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error Occurred");
        }
    }
}
