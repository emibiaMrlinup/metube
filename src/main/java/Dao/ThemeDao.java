package Dao;

import Entity.Theme;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ThemeDao {
    List<Theme> getThemes();
    Theme findById(int id);
    void AddTheme(Theme theme);
    int deleteTheme(int id);
    int ChangeUse(Theme theme);
}
