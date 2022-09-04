package controller;

import model.User;
import service.IUserService;
import service.impl.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.function.Consumer;

@WebServlet(name = "UserServlet", urlPatterns = "/userSv")
public class UserServlet extends HttpServlet {
    IUserService userService = new UserService();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // edit and add
            try {
                save(request,response);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            request.getRequestDispatcher("view/user/form.jsp").forward(request,response);
//        response.sendRedirect("/userSv");
    }
    private boolean isRemove(String deleteId) {
        if(deleteId == null) {
            return false;
        }
        return true;
    }
    private void save(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");
        
        if(isAdd(id)) {
            Map<String,String> map = userService.save(new User(name,email,country));
            validate(map,request,response);

        } else {
            //edit
            Map<String,String> map = userService.save(new User(Integer.parseInt(id),name,email,country));
            validate(map,request,response);
        }
    }
    private void validate(Map<String,String> map,HttpServletRequest request, HttpServletResponse response) {
        String mess = "Saving success";
        if(!map.isEmpty()) {
            mess = "Saving does not success";
            request.setAttribute("error",map);
        }
        request.setAttribute("mess",mess);
    }

    public boolean isAdd(String id) {
        if(id.isEmpty()) {
            return true;
        }
        return false;
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String editId = request.getParameter("editId");
        String deleteId = request.getParameter("deleteId");
        String country = request.getParameter("q");
//        String checkAction = request.getParameter("check");
//        if(checkAction == null) {
//            showList(request,response,userService.selectUsers(null));
//        } else if (checkAction.equals("sort")) {
//            showList(request,response,userService.selectUsers("sort"));
//        } else {
            if(isSearch(country)) {
                List<User> userSearch = userService.search(country);
                request.setAttribute("valueSearch",country);
                showList(request,response,userSearch);
            } else  {
                if(isRemove(deleteId)) {
                    try {
                        boolean check =  userService.deleteUser(Integer.parseInt(deleteId));
                        showList(request,response,userService.selectUsers(null));
                    } catch (SQLException throwables) {
                        throwables.printStackTrace();
                    }
                } else {
                    if(isEdit(editId)) {
                        int id = Integer.parseInt(editId);
                        Optional<User> user = userService.getById(id);
                        request.setAttribute("user", user.get());
                        request.getRequestDispatcher("view/user/form.jsp").forward(request,response);
                    } else {
                        showList(request,response,userService.selectUsers(null));
                    }
                }
            }
//        }



    }


    private boolean isSearch(String q) {
        if(q == null)  {
            return false;
        }
        return true;
    }

    private boolean isEdit(String editId) {
        if(editId == null) {
            return false;
        }
        return true;
    }
    private void showList(HttpServletRequest request, HttpServletResponse response, List<User> list) throws ServletException, IOException {
        request.setAttribute("listUser",list);
        request.getRequestDispatcher("view/user/list.jsp").forward(request,response);
    }
}
