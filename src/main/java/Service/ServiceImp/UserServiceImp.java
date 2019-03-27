package Service.ServiceImp;

import Dao.UserDao;
import Entity.User;
import Service.UserService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class UserServiceImp implements UserService {
    Logger logger= Logger.getLogger(UserServiceImp.class);
    @Autowired
    UserDao userDao;

    @Override
    public List<User> getUser() {
        return userDao.getUsers();
    }

    @Override
    public User QueryById(int id) {
        return userDao.findById(id);
    }

    @Override
    public List<User> SearchUser(String name, String username) {
        return userDao.searchUsers(name, username);
    }

    @Override
    public boolean updateUserInfo(User user) {
        userDao.updateUserInfo(user);
        return true;
    }

    @Override
    public boolean addUser(User user) {
        userDao.addUser(user);
        return true;
    }

    @Override
    public boolean deleteUser(String id) {
        userDao.deleteUser(id);
        return true;
    }

    @Override
    public User login(String username, String password) {
       return userDao.login(username,password);
    }

    @Override
    public boolean updateUserPic(User user) {
        userDao.updateUserPic(user);
        return true;
    }

    @Override
    public boolean updateUserPWD(User user) {
        userDao.updateUserPWD(user);
        return true;
    }
}
