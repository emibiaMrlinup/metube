package Dao;

import Entity.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface UserDao {
    List<User>  getUsers();
    User findById(int id);
    List<User> searchUsers(@Param("name")String name,@Param("username")String username);
    int updateUserInfo(User user);
    void addUser(User user);
    int deleteUser(String id);
    User login(@Param("username") String username,@Param("password") String password);
    int updateUserPic(User user);
    int updateUserPWD(User user);
}
