package Service;

import Entity.User;

import java.util.List;

public interface UserService {
List<User> getUser();
User QueryById(int id);
List<User> SearchUser(String name,String username);
boolean updateUserInfo(User user);
boolean addUser(User user);
boolean deleteUser(String id);
User login(String username,String password);
    boolean updateUserPic(User user);
    boolean updateUserPWD(User user);
}
