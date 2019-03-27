package Dao;

import Entity.Collections;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CollectionsDao {
    public List<Collections> getCollections();
    public Collections findById(int id);
    public void addCollections(Collections collections);
    public int deleteCollections(int id);
}
