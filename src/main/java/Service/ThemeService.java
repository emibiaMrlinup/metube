package Service;

import Entity.Theme;

import java.util.List;

public interface ThemeService {
    List<Theme> getThemes();
    boolean AddTheme(Theme theme);
    boolean deleteTheme(int id);
    Theme findById(int id);
    boolean ChangeUse(Theme theme);
}
