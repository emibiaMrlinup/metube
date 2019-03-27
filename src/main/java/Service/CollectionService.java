package Service;

import Entity.Collections;

import java.util.List;

public interface CollectionService {
    public List<Collections> getCollections();
    public Collections findById(int id);
    public boolean addCollections(Collections collections);
    public boolean delete(int id);
}
