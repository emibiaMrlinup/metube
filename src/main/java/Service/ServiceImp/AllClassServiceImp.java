package Service.ServiceImp;

import Dao.AllClassDao;
import Entity.AllClass;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import Service.AllClassService;

import java.util.List;

@Service
@Transactional
public class AllClassServiceImp implements AllClassService {
    Logger logger=Logger.getLogger(AllClassServiceImp.class);
    @Autowired
    AllClassDao allClassDao;
    @Override
    public List<AllClass> getAllTypes() {
        return allClassDao.getAllTypes();
    }

    @Override
    public boolean updateTypes(AllClass allClass) {
        allClassDao.updateTypes(allClass);
        return true;
    }

    @Override
    public boolean addTypes(AllClass allClass) {
        allClassDao.addTypes(allClass);
        return true;
    }

    @Override
    public AllClass findById(int id) {
        allClassDao.findById(id);
        return allClassDao.findById(id);
    }

    @Override
    public boolean deleteTypes(String id) {
        allClassDao.deleteTypes(id);
        return true;
    }

    @Override
    public boolean deleteMainTypes(String id) {
        allClassDao.deleteMainTypes(id);
        return true;
    }
}
