import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "LoginServlet", value = "/login")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        PrintWriter writer = response.getWriter();
        response.setContentType("html/text");

        if ("admin".equals(username) && "admin".equals(password)) {
            username = "Welcome";
            request.setAttribute("username",username);
            request.setAttribute("password",password);
            request.getRequestDispatcher("loginUser.jsp").forward(request,response);


        } else {
            username = "Wrong";
            request.setAttribute("username", username);
            request.getRequestDispatcher("loginUser.jsp").forward(request,response);

        }


    }
}
