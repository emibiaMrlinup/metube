package Dao;

import Entity.Collects;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface CollectsDao {
    public List<Collects> getCollects();
    public Collects findById(int id);
    public void addCollects(Collects collects);
    public int deleteCollects(int id);
    public int updateCollects(Collects collects);
}
