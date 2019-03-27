package Service;

import Entity.Discuss;

import java.util.List;

public interface DiscussService {
    List<Discuss> getDiscuss();
    Discuss findById(int id);
    boolean addDiscuss(Discuss discuss);
    boolean deleteDiscuss(int id);
}
