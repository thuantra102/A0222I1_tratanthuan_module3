package service.impl;

import jdk.nashorn.internal.runtime.options.Option;
import model.Product;
import repository.IProductRepository;
import repository.impl.ProductRepository;
import service.IProductService;

import java.util.List;
import java.util.Optional;

public class ProductService implements IProductService {
    IProductRepository productRepository = new ProductRepository();

    @Override
    public List<Product> findAll() {
        return productRepository.findAll();
    }

    @Override
    public void save(Product product) {
        productRepository.save(product);
    }


    @Override
    public void removeById(int id) {
        productRepository.removeById(id);
    }

    @Override
    public Optional<Product> getById(int id) {
        return productRepository.getById(id);
    }


    @Override
    public List<Product> getByName(String name) {
        return null;
    }
}
