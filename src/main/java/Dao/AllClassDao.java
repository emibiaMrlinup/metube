package Dao;

import Entity.AllClass;

import java.util.List;

public interface AllClassDao {
    List<AllClass> getAllTypes();
    int updateTypes(AllClass allClass);
    void addTypes(AllClass allClass);
    AllClass findById(int id);
    int deleteTypes(String id);
    int deleteMainTypes(String id);
}
