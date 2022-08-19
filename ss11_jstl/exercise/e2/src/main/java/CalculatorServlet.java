import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "CalculatorServlet", urlPatterns = "/calculate")
public class CalculatorServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String operator = request.getParameter("operator");
        double fo = Double.parseDouble(request.getParameter("firstOperator"));
        double so = Double.parseDouble(request.getParameter("secondOperator"));
        double result = 0;
        String exception = null;
        try {
            result = Calculator.calculator(fo,operator,so);
        }catch (DivisionException e) {
            exception = "Can not divide to 0";
        }
        request.setAttribute("result", result);
        request.setAttribute("exception", exception);
        request.getRequestDispatcher("result.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
