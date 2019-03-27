package Service.ServiceImp;

import Dao.FriendsDao;
import Entity.Friends;
import Service.FriendsService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class FriendsServiceImp implements FriendsService {
    Logger logger =Logger.getLogger(FriendsServiceImp.class);
    @Autowired
    FriendsDao friendsDao;

    @Override
    public List<Friends> getFriends() {
        return friendsDao.getFriends();
    }

    @Override
    public boolean AddFriends(Friends friends) {
        friendsDao.AddFriends(friends);
        return true;
    }

    @Override
    public boolean deleteFriends(int id) {
        friendsDao.deleteFriends(id);
        return true;
    }
}
