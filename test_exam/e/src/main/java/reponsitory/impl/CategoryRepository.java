package reponsitory.impl;

import model.Category;
import model.Product;
import reponsitory.BaseRepository;
import reponsitory.ICategoryRepository;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CategoryRepository implements ICategoryRepository {
    public static final String SELECT_CATEGORY = "select * from category;";

    @Override
    public List<Category> selectAll() {
        List<Category> categoryList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            ResultSet resultSet = connection.prepareStatement(SELECT_CATEGORY).executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
               categoryList.add(new Category(id,name));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return categoryList;
    }
}
