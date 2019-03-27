package Service;

import Entity.Collects;

import java.util.List;

public interface CollectsService {
    List<Collects> getCollects();
    Collects findById(int id);
    boolean addCollects(Collects collects);
    boolean deleteCollects(int id);
    boolean updateCollects(Collects collects);
}
