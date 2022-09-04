package reponsitory;

import model.Product;

import java.util.List;

public interface IProductRepository {
    public List<Product> selectProduct(String checkSearch);
    public void save(Product product);
    public void delete(int id);
    public Product findById(int id);
}
