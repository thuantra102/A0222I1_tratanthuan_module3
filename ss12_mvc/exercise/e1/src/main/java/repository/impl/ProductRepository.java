package repository.impl;

import model.Product;
import repository.IProductRepository;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class ProductRepository implements IProductRepository {
    private static List<Product> products = new ArrayList<>();
    static {
      products.add(new Product(1,"sua",29,"ko","th-trueMilk"));
      products.add(new Product(2,"sua",29,"ko","th-trueMilk"));
      products.add(new Product(3,"sua",29,"ko","th-trueMilk"));
      products.add(new Product(4,"sua",29,"ko","th-trueMilk"));
      products.add(new Product(5,"sua",29,"ko","th-trueMilk"));
    }

    @Override
    public List<Product> findAll() {
        return products;
    }

    @Override
    public void save(Product product) {
        // edit
        if(product.getId() > 0){
            int index = products.indexOf(product);
           products.set(index, product);
        }
        else {
            // add
            int lastId = products.get(products.size() -1).getId();
            product.setId(lastId + 1);
            products.add(product);
        }

    }

    @Override
    public void removeById(int id) {
        products.removeIf(e -> e.getId() == id);
    }

    @Override
    public Optional<Product> getById(int id) {
        return products.stream().filter(e -> e.getId() == id).findFirst();
    }

    @Override
    public List<Product> getByName(String name) {
        return null;
    }


}
