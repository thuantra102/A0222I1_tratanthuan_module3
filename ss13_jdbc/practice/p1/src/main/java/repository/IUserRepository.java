package repository;

import model.User;

import java.sql.SQLException;
import java.util.List;
import java.util.Optional;

public interface IUserRepository {


    public List<User> selectAllUsers();

    public boolean deleteUser(int id) throws SQLException;


    public void save(User user) throws SQLException;
    public Optional<User> getById(int id);
}
