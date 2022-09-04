package service;

import model.Product;

import java.util.List;

public interface IProductService {
    public List<Product> selectProduct(String checkSearch);
    public void save(Product product);
    public void delete(int id);
    public Product findById(int id);
}
