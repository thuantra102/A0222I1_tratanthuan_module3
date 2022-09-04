package controller;

import com.google.gson.Gson;
import model.Category;
import model.Product;
import service.ICategoryService;
import service.IProductService;
import service.impl.CategoryService;
import service.impl.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "ProductServlet", urlPatterns = "/productSv")
public class ProductServlet extends HttpServlet {
    IProductService productService = new ProductService();
    ICategoryService categoryService = new CategoryService();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action.equals("save")) {
            doPost_Save(request, response);
        } else if(action.equals("delete")) {
            doPost_Delete(request,response);
        }
    }

    private void doPost_Delete(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("deleteId"));
        productService.delete(id);
        response.sendRedirect("/productSv");
    }

    protected void doPost_Save(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("idProduct");
        String name = request.getParameter("name");
        float price = Float.parseFloat(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String color = request.getParameter("color");
        int id_category = Integer.parseInt(request.getParameter("category"));
        if (id == null) {
            productService.save(new Product(0, name, price, quantity, color, id_category));
        } else {
            productService.save(new Product(Integer.parseInt(id), name, price, quantity, color, id_category));
        }
        response.sendRedirect("/productSv");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        String valueSearch = request.getParameter("value");
        if (action == null) {
            showList(request, response,productService.selectProduct(null));
        } else if (action.equals("find")) {
            doGet_Find(request, response);
        } else if(action.equals("search")) {
            request.setAttribute("value",valueSearch);
            showList(request,response,productService.selectProduct(valueSearch));
        }
    }
    private void showList(HttpServletRequest request, HttpServletResponse response,List<Product> list) throws ServletException, IOException {
        request.setAttribute("productList", list);
        request.setAttribute("categoryList", categoryService.selectAll());
        request.getRequestDispatcher("view/product/list.jsp").forward(request, response);
    }

    private void doGet_Find(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = productService.findById(id);
        Gson gson = new Gson();
        PrintWriter writer = response.getWriter();
        writer.print(gson.toJson(product));
        writer.flush();
        writer.close();
    }
}
