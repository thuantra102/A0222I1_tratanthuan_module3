package service;

import model.Product;

import java.util.List;
import java.util.Optional;

public interface IProductService {
    List<Product> findAll();
    void save(Product product);
    void removeById(int id);
    Optional<Product> getById(int id);
    List<Product> getByName(String name);
}
