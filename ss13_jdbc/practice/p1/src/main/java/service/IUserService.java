package service;

import model.User;

import javax.jws.soap.SOAPBinding;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.Optional;

public interface IUserService {
    public List<User> selectUsers(String check);
    public boolean deleteUser(int id) throws SQLException;
    public Map<String,String> save(User user) throws SQLException;
    public Optional<User> getById(int id);
    public List<User> search(String country);

}
