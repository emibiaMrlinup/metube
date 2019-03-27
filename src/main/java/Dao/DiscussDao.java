package Dao;

import Entity.Discuss;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DiscussDao {
    List<Discuss> getDiscuss();
    Discuss findById(int id);
    void addDiscuss(Discuss discuss);
    int deleteDiscuss(int id);
}
