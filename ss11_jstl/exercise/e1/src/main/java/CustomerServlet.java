import Model.Customer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomerServlet", urlPatterns = "/customer")
public class CustomerServlet extends HttpServlet {
    List<Customer> customerList = new ArrayList<>();

    @Override
    public void init() throws ServletException {
        customerList.add(new Customer("Thuan","11-11-2002","QuangNam","Images/avatar.jfif"));
        customerList.add(new Customer("Thuan 1","11-11-2002","QuangNam","Images/avatar.jfif"));
        customerList.add(new Customer("Thuan 2","11-11-2002","QuangNam","Images/avatar.jfif"));
        customerList.add(new Customer("Thuan 3","11-11-2002","QuangNam","Images/avatar.jfif"));
        customerList.add(new Customer("Thuan 4","11-11-2002","QuangNam","Images/avatar.jfif"));

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("customerList", customerList);
        request.getRequestDispatcher("customers.jsp").forward(request,response);
    }
}
