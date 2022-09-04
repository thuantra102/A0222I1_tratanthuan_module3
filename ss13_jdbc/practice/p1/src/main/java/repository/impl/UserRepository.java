package repository.impl;

import model.User;
import repository.BaseRepository;
import repository.IUserRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class UserRepository implements IUserRepository {
    private static final String COUNTRY_SEARCH = "call search(?);";
    private static  String SELECT_USERS = "select * from users ";
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
    public List<User> selectUsers(String check) {
                List<User> userList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            ResultSet resultSet =connection.prepareStatement(SELECT_USERS + (check == null ? "" : "order by country" )).executeQuery();
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
    public List<User> search(String country) {
        List<User> userSearch = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            CallableStatement callableStatement= connection.prepareCall(COUNTRY_SEARCH);
            callableStatement.setString(1,country);
            ResultSet resultSet =callableStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String country1 = resultSet.getString("country");
                userSearch.add(new User(id,name,email,country1));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return userSearch;
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
        List<User> userList = selectUsers(null);
        Optional<User> userId = userList.stream().filter(user -> user.getId() == id).findFirst();
        return userId;
    }
}
