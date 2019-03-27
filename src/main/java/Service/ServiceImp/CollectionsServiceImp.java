package Service.ServiceImp;

import Dao.CollectionsDao;
import Entity.Collections;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

import Service.CollectionService;
@Service
@Transactional
public class CollectionsServiceImp implements CollectionService {
    Logger logger=Logger.getLogger(CollectionsServiceImp.class);
    @Autowired
    CollectionsDao collectionsDao;
    @Override
    public List<Collections> getCollections() {
        return collectionsDao.getCollections();
    }

    @Override
    public Collections findById(int id) {
        return collectionsDao.findById(id);
    }

    @Override
    public boolean addCollections(Collections collections) {
        collectionsDao.addCollections(collections);
        return true;
    }

    @Override
    public boolean delete(int id) {
        collectionsDao.deleteCollections(id);
        return true;
    }
}
