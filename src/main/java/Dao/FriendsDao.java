package Dao;

import Entity.Friends;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface FriendsDao {
List<Friends> getFriends();
void AddFriends(Friends friends);
int deleteFriends(int id);
}
