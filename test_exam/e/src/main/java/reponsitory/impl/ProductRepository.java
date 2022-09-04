package reponsitory.impl;

import model.Product;
import reponsitory.BaseRepository;
import reponsitory.IProductRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.PrimitiveIterator;

public class ProductRepository implements IProductRepository {
    public final static String SELECT_PRODUCT = "select * from product";
    public final static String CREATE_PRODUCT = "insert into product (product_name,price,quantity,color,category_id)\n" +
            "values (?,?,?,?,?);";
    public final static String EDIT_PRODUCT = "update product set \n" +
            "product_name = ?,\n" +
            "price = ?,\n" +
            "quantity = ?,\n" +
            "color = ?,\n" +
            "category_id = ?\n" +
            "where id = ?;";
    public final static String DELETE_PRODUCT = "DELETE FROM `product` WHERE (`id` = ?);";
//    public final static String SEARCH_PRODUCT = "where product_name like concat(%,?,%);";

    @Override
    public List<Product> selectProduct(String checkSearch) {
        List<Product> productList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_PRODUCT + (checkSearch== null ? "" : " where product_name like concat('%',?,'%');"));
            if(checkSearch != null) {
                preparedStatement.setString(1,checkSearch);
            }
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String productName = resultSet.getString("product_name");
                float price = resultSet.getFloat("price");
                int quantity = resultSet.getInt("quantity");
                String color = resultSet.getString("color");
                int category_id = resultSet.getInt("category_id");
                productList.add(new Product(id,productName,price,quantity,color,category_id));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return productList;
    }

    @Override
    public void save(Product product) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement =connection.prepareStatement(product.getId() > 0 ? EDIT_PRODUCT : CREATE_PRODUCT);
            preparedStatement.setString(1,product.getProductName());
            preparedStatement.setFloat(2,product.getPrice());
            preparedStatement.setInt(3,product.getQuantity());
            preparedStatement.setString(4,product.getColor());
            preparedStatement.setInt(5,product.getId_category());
            if(product.getId() > 0) {
                preparedStatement.setInt(6,product.getId());
            }
            preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public void delete(int id) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_PRODUCT);
            preparedStatement.setInt(1,id);
            preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

    }

    @Override
    public Product findById(int id) {
        List<Product> productList = selectProduct(null);
        Product product = null;
        for (Product p:productList) {
            if(p.getId()==id) {
                product = p;
            }
        }
        return product;
//        return (Product) productList.stream().filter(product -> product.getId()==id);
    }


}
