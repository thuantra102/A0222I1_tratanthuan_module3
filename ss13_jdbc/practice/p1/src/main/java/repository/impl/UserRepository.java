package repository.impl;

import model.User;
import repository.BaseRepository;
import repository.IUserRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class UserRepository implements IUserRepository {
    private static final String SELECT_ALL_USERS = "select * from users";
    private static final String EDIT_USER = "update users \n" +
            "set \n" +
            "\t`name` = ?,\n" +
            "    `email` = ?,\n" +
            "    `country` = ?\n" +
            "where\n" +
            "\tid = ?; ";
    private static final String ADD_USER = "insert into users(name, email, country) values(?,?,?);";
    private static final String DELETE_USER = "delete from users where id = ?;";




    @Override
    public List<User> selectAllUsers() {
        List<User> userList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            ResultSet resultSet =connection.prepareStatement(SELECT_ALL_USERS).executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String country = resultSet.getString("country");
                userList.add(new User(id,name,email,country));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return userList;
    }

    @Override
    public boolean deleteUser(int id) throws SQLException {
        Connection connection = BaseRepository.getConnectDB();
        PreparedStatement preparedStatement = connection.prepareStatement(DELETE_USER);
        preparedStatement.setInt(1,id);
        int num =preparedStatement.executeUpdate();
        return (num==1);
    }



    @Override
    public void save(User user) throws SQLException {
        Connection connection =BaseRepository.getConnectDB();
        PreparedStatement preparedStatement = connection.prepareStatement(user.getId()>0 ? EDIT_USER : ADD_USER);
        preparedStatement.setString(1,user.getName());
        preparedStatement.setString(2,user.getEmail());
        preparedStatement.setString(3,user.getCountry());
        if(user.getId() > 0){
            preparedStatement.setInt(4,user.getId());
        }
        preparedStatement.executeUpdate();


    }

    @Override
    public Optional<User> getById(int id) {
        List<User> userList = selectAllUsers();
        Optional<User> userId = userList.stream().filter(user -> user.getId() == id).findFirst();

        return userId;
    }
}
