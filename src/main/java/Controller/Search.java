package Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.*;
import java.util.List;

import Model.AdminEvent;
import Service.AdminEventServ;
import Service.AdminEventServImpl;

@WebServlet("/Search")
public class Search extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("application/json");
		HttpSession session = request.getSession();
		Integer adminId = (Integer) session.getAttribute("AdminId");

		PrintWriter out = response.getWriter();

		String Name = request.getParameter("name");

		try {

			AdminEventServ ser = new AdminEventServImpl();
			List<AdminEvent> list = ser.getSearchEventbyName(Name,adminId);

			String json = "[";

			for (int i = 0; i < list.size(); i++) {

				AdminEvent a = list.get(i);

				json += "{";
				json += "\"id\":\"" + a.getId() + "\",";
				json += "\"name\":\"" + a.getName() + "\",";
				json += "\"date\":\"" + a.getEDate() + "\",";
				json += "\"location\":\"" + a.getLocation() + "\"";

				json += "}";

				if (i < list.size() - 1) {
					json += ",";
				}
			}

			json += "]";

			out.print(json);

		} catch (Exception e) {

			e.printStackTrace();

		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
