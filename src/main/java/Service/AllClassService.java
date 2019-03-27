package Service;


import Entity.AllClass;

import java.util.List;

public interface AllClassService {
    List<AllClass> getAllTypes();
    boolean updateTypes(AllClass allClass);
    boolean addTypes(AllClass allClass);
    AllClass findById(int id);
    boolean deleteTypes(String id);
    boolean deleteMainTypes(String id);
}
