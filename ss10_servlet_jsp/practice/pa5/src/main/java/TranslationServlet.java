import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

@WebServlet(name = "TranslationServlet", urlPatterns = "/translate")
public class TranslationServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Map<String, String> dictionary = new HashMap<>();
        dictionary.put("hello", "Xin chào");
        dictionary.put("how", "Thế nào");
        dictionary.put("book", "Quyển vở");
        dictionary.put("computer", "Máy tính");
        String search = request.getParameter("txtSearch");
        String vietnamese = dictionary.get(search);
//        for (Map.Entry<String, String> s: dictionary.entrySet()) {
//            if (s.getKey().equalsIgnoreCase(search)) {
//                vietnamese = s.getValue();
//            } else  {
//                vietnamese = "Not Exist On This Dictionary";
//            }
//        }
//        Set<String> keySet = dictionary.keySet();
//        for (String i: keySet) {
//            vietnamese = "Not Exist On This Dictionary";
//            if(i.equalsIgnoreCase(search)) {
//                vietnamese = dictionary.get(i);
//            }
//        }
        if(vietnamese != null) {
            request.setAttribute("vn", vietnamese);
        } else {
            request.setAttribute("vn", "None Exist");
        }

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("index.jsp");
        requestDispatcher.forward(request,response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
