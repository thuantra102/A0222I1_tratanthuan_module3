package service.impl;

import model.Category;
import reponsitory.ICategoryRepository;
import reponsitory.impl.CategoryRepository;
import service.ICategoryService;

import java.sql.SQLException;
import java.util.List;

public class CategoryService implements ICategoryService {
    ICategoryRepository categoryRepository = new CategoryRepository();
    @Override
    public List<Category> selectAll() {
        return categoryRepository.selectAll();
    }
}
