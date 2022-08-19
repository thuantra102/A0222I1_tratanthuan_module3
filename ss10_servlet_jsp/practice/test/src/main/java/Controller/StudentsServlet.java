package Controller;

import Model.Student;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "StudentsServlet", urlPatterns = "/student")
public class StudentsServlet extends HttpServlet {
    private static List<Student> studentList = new ArrayList<>();

    @Override
    public void init() throws ServletException {
        studentList.add(new Student(1, "chanh", true, "12-12-2022", 9, "chanhtv", 1, "chanhtv@gmail.com"));
        studentList.add(new Student(2, "chanh2", false, "12-12-2022", 3, "chanhtv", 1, "chanhtv@gmail.com"));
        studentList.add(new Student(3, "chanh3", false, "12-12-2022", 8, "chanhtv", 1, "chanhtv@gmail.com"));
        studentList.add(new Student(4, "chanh4", true, "12-12-2022", 7, "chanhtv", 1, "chanhtv@gmail.com"));
        studentList.add(new Student(5, "chanh5", true, "12-12-2022", 6, "chanhtv", 1, "chanhtv@gmail.com"));
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("list.jsp");
        request.setAttribute("studentList", studentList);
        requestDispatcher.forward(request, response);
    }
}
