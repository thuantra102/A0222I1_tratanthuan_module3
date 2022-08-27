package controller;

import model.Product;
import service.IProductService;
import service.impl.ProductService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Collections;
import java.util.Optional;
import java.util.stream.Collectors;

import static com.sun.javafx.fxml.expression.Expression.add;

@WebServlet(name = "ProductServlet", urlPatterns = "/productSv")
public class ProductServlet extends HttpServlet {
    IProductService productService = new ProductService();
     protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        if(isRemove(name)) {
            productService.removeById(id);
            showListProduct(request,response);
        } else {
            // save
            double price = Double.parseDouble(request.getParameter("price"));
            String des = request.getParameter("description");
            String manufacture = request.getParameter("manufacture");
            productService.save(new Product(id, name, price, des, manufacture));
            request.getRequestDispatcher("view/product/form.jsp").forward(request,response);
        }
    }

    private boolean isRemove(String name) {
         if(name == null) {
             return true;
         }
         return false;
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String q = request.getParameter("q");
        if(!isSearch(q)) {
            if (isEdit(id)) {
                // show edit
                Optional<Product> optionalProduct = productService.getById(Integer.parseInt(id));
                if (optionalProduct.isPresent()) {
                    request.setAttribute("product", optionalProduct.get());
                    request.getRequestDispatcher("/view/product/form.jsp").forward(request, response);
                }
            } else {
                // show list
                showListProduct(request, response);
            }
        } else {
            Optional<Product> searchingProduct = productService.getById(Integer.parseInt(q));
            if(searchingProduct.isPresent()) {
                request.setAttribute("listProduct", Collections.singletonList(searchingProduct.get()));
            } else {
                request.setAttribute("error","Id does not exist");
            }
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/product/list.jsp");
            requestDispatcher.forward(request, response);
        }
    }

    private boolean isEdit(String id) {
         if(id == null) {
             return false;
         }
         return true;
    }

    private boolean isSearch(String q) {
         if(q == null) {
             return false;
         }
         return true;
    }

    private void showListProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("listProduct", this.productService.findAll());
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/product/list.jsp");
        requestDispatcher.forward(request, response);
    }


}
