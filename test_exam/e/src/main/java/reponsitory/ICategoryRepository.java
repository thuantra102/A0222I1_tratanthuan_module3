package reponsitory;

import model.Category;

import java.sql.SQLException;
import java.util.List;

public interface ICategoryRepository {
    public List<Category> selectAll();
}
