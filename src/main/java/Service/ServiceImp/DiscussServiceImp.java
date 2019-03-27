package Service.ServiceImp;

import Dao.DiscussDao;
import Entity.Discuss;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import Service.DiscussService;

import java.util.List;

@Service
@Transactional
public class DiscussServiceImp implements DiscussService {
    Logger logger=Logger.getLogger(DiscussServiceImp.class);
    @Autowired
    DiscussDao discussDao;

    @Override
    public List<Discuss> getDiscuss() {
        return discussDao.getDiscuss();
    }

    @Override
    public Discuss findById(int id) {
        return discussDao.findById(id);
    }

    @Override
    public boolean addDiscuss(Discuss discuss) {
        discussDao.addDiscuss(discuss);
        return true;
    }

    @Override
    public boolean deleteDiscuss(int id) {
        discussDao.deleteDiscuss(id);
        return true;
    }
}
