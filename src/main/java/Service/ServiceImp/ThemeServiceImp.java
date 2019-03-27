package Service.ServiceImp;

import Dao.ThemeDao;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import Service.ThemeService;
import java.util.List;
import Entity.Theme;
@Service
@Transactional
public class ThemeServiceImp implements ThemeService {
    Logger logger = Logger.getLogger(ThemeServiceImp.class);
    @Autowired
    ThemeDao themeDao;
    @Override
    public List<Theme> getThemes() {
        return themeDao.getThemes();
    }

    @Override
    public boolean AddTheme(Theme theme) {
        themeDao.AddTheme(theme);
        return true;
    }

    @Override
    public boolean deleteTheme(int id) {
        themeDao.deleteTheme(id);
        return true;
    }

    @Override
    public Theme findById(int id) {
        return themeDao.findById(id);
    }

    @Override
    public boolean ChangeUse(Theme theme) {
        themeDao.ChangeUse(theme);
        return true;
    }
}

