package Service;

import Entity.Friends;

import java.util.List;

public interface FriendsService {
    List<Friends> getFriends();
    boolean AddFriends(Friends friends);
    boolean deleteFriends(int id);
}
