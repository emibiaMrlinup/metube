package Service.ServiceImp;

import Dao.CollectsDao;
import Entity.Collects;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import Service.CollectsService;

import java.util.List;

@Service
@Transactional
public class CollectsServiceImp implements CollectsService {
    Logger logger=Logger.getLogger(CollectsServiceImp.class);
    @Autowired
    CollectsDao collectsDao;

    @Override
    public List<Collects> getCollects() {
        return collectsDao.getCollects();
    }

    @Override
    public Collects findById(int id) {
        return collectsDao.findById(id);
    }

    @Override
    public boolean addCollects(Collects collects) {
        collectsDao.addCollects(collects);
        return true;
    }

    @Override
    public boolean deleteCollects(int id) {
        collectsDao.deleteCollects(id);
        return true;
    }

    @Override
    public boolean updateCollects(Collects collects) {
        collectsDao.updateCollects(collects);
        return true;
    }
}
