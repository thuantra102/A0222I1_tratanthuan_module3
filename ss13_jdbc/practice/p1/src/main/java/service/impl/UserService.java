package service.impl;

import com.mysql.cj.util.DnsSrv;
import common.Validation;
import model.User;
import repository.IUserRepository;
import repository.impl.UserRepository;
import service.IUserService;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

public class UserService implements IUserService {
    IUserRepository userRepository = new UserRepository();


    @Override
    public List<User> selectUsers(String check) {
        return userRepository.selectUsers(check);
    }

    @Override
    public boolean deleteUser(int id) throws SQLException {
        return userRepository.deleteUser(id);
    }


    @Override
    public Map<String ,String > save(User user) throws SQLException {
        Map<String,String> map = new HashMap<>();
        if("".equals(user.getEmail())){
            map.put("email","Email can not empty");
        }else if(!Validation.checkEmail(user.getEmail())){
            map.put("email","Email invalidate");
        }
        if(map.isEmpty()) {
            userRepository.save(user);
        }
        return map;
    }

    @Override
    public Optional<User> getById(int id) {
        return userRepository.getById(id);
    }

    @Override
    public List<User> search(String country) {
        return userRepository.search(country);
    }


}
