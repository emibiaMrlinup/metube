package Ctrl;

import Dao.ThemeDao;
import Entity.Theme;
import Entity.User;
import Service.ThemeService;
import Service.UserService;
import org.apache.commons.fileupload.util.Streams;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.*;

@Controller
public class AdminThemeCtrl {
   @Autowired
    UserService userService;
    @Autowired
    ThemeService themeService;

    @RequestMapping("/ToAddTheme.do")
    public ModelAndView ToAddTheme(HttpSession session){
        User user=(User)session.getAttribute("Admin");
        Map<String,Object>  model = new HashMap<String, Object>();
        model.put("AdminInfo",user);
        return new ModelAndView("admin/ThemeManage/AddTheme",model);
    }
    @RequestMapping(value="/addTheme.do",method = RequestMethod.POST)
    @ResponseBody
    public Map addTheme(@RequestParam("name")String name, @RequestParam("url") MultipartFile url, @RequestParam("type") String type, String id, HttpServletRequest request) throws IOException {
        Map<String,Object> model = new HashMap<String,Object>();
        MultipartFile urlcopy = url;
         try{
             Theme theme = new Theme();
             theme.setId(id);
             theme.setName(name);
             theme.setType(type);
             String picname = url.getOriginalFilename();
             String UrlPath = request.getSession().getServletContext().getRealPath("/bgres");
             String UrlPathr = request.getSession().getServletContext().getRealPath("/assets/bgres");
             int noTarget=UrlPath.lastIndexOf("target");
             String str=UrlPath.substring(0,noTarget);
             String url_Path;
             String url_Pathr;
             String databasePath;
             if (type.equals("1")){
                 url_Path=str+"src/main/webapp/assets/bgres/bg";
                 url_Pathr=UrlPathr+"/bg";
                 databasePath="/assets/bgres/bg/";
             }else if (type.equals("2")){
                 url_Path=str+"src/main/webapp/assets/bgres/viewFF";
                 url_Pathr=UrlPathr+"/viewFF";
                 databasePath="/assets/bgres/viewFF/";
             }else{
                 url_Path=str+"src/main/webapp/assets/bgres/head";
                 url_Pathr=UrlPathr+"/head";
                 databasePath="/assets/bgres/head/";
             }
             String picfileType = picname.substring(picname.lastIndexOf("."));
             // 自定义方式产生文件名
             String p_serialName = String.valueOf(System.currentTimeMillis());
             File themeFile = new File(url_Path+"/"+p_serialName+"."+picfileType);
             File ServlethemeFile = new File(url_Pathr+"/"+p_serialName+"."+picfileType);
             Streams.copy(url.getInputStream(),new FileOutputStream(themeFile.getAbsolutePath()),true);
             Streams.copy(urlcopy.getInputStream(),new FileOutputStream(ServlethemeFile.getAbsolutePath()),true);
             theme.setUrl(databasePath + p_serialName+"." + picfileType);
             boolean ok = themeService.AddTheme(theme);
             model.put("MESSAGE","上传成功！");
         }catch (Exception e){
             e.printStackTrace();
         }
         return model;
    }
@RequestMapping("ToThemeManage.do")
    public ModelAndView ToThemeManage(HttpSession session){
    User user=(User)session.getAttribute("Admin");
    Map<String,Object>  model = new HashMap<String, Object>();
    List<Theme> themes = themeService.getThemes();
    model.put("AdminInfo",user);
    model.put("themes",themes);
        return new ModelAndView("admin/ThemeManage/ThemeManage",model);
}

@RequestMapping("/SetSelfBg.do")
    public ModelAndView SetSelfBg(HttpSession session,@RequestParam("id") String id){
    User user=(User)session.getAttribute("Admin");
    List<Theme> themeList = themeService.getThemes();
    int tagnum=0;
    for (int i=0;i<themeList.size();i++) {
        if (themeList.get(i).getType().equals("1")) {
            if (themeList.get(i).getUse()!=null&&themeList.get(i).getUse().equals("1")) {
                Theme theme = new Theme();
                theme.setId(themeList.get(i).getId());
                theme.setUse("0");
                themeService.ChangeUse(theme);
            }
        }
    }
    Theme theme = new Theme();
    theme.setId(id);
    theme.setUse("1");
    themeService.ChangeUse(theme);
    Map<String,Object>  model = new HashMap<String, Object>();
    List<Theme> themes = themeService.getThemes();
    model.put("tag",tagnum);
    model.put("AdminInfo",user);
    model.put("themes",themes);
    return  new ModelAndView("admin/ThemeManage/ThemeManage",model);
}

    @RequestMapping("/SetHeadBg.do")
    public ModelAndView SetViewFF(HttpSession session,@RequestParam("id") String id){
        User user=(User)session.getAttribute("Admin");
        List<Theme> themeList = themeService.getThemes();
        int tagnum=2;
        for (int i=0;i<themeList.size();i++) {
            if (themeList.get(i).getUse()!=null&&themeList.get(i).getType().equals("3")) {
                if (themeList.get(i).getUse()!=null&&themeList.get(i).getUse().equals("1")) {
                    Theme theme = new Theme();
                    theme.setId(themeList.get(i).getId());
                    theme.setUse("0");
                    themeService.ChangeUse(theme);
                }
            }
        }
        Theme theme = new Theme();
        theme.setId(id);
        theme.setUse("1");
        themeService.ChangeUse(theme);
        Map<String,Object>  model = new HashMap<String, Object>();
        List<Theme> themes = themeService.getThemes();
        model.put("tag",tagnum);
        model.put("AdminInfo",user);
        model.put("themes",themes);
        return  new ModelAndView("admin/ThemeManage/ThemeManage",model);
    }

    @RequestMapping("/SetSelfHeadBg.do")
    public ModelAndView SetSelfHeadBg(HttpSession session,@RequestParam("id") String id){
        User user=(User)session.getAttribute("Admin");
        List<Theme> themeList = themeService.getThemes();
        int tagnum=2;
        for (int i=0;i<themeList.size();i++) {
            if (themeList.get(i).getUse()!=null&&themeList.get(i).getType().equals("3")) {
                if (themeList.get(i).getUse().equals("2")) {
                    Theme theme = new Theme();
                    theme.setId(themeList.get(i).getId());
                    theme.setUse("0");
                    themeService.ChangeUse(theme);
                }
            }
        }
        Theme theme = new Theme();
        theme.setId(id);
        theme.setUse("2");
        themeService.ChangeUse(theme);
        Map<String,Object>  model = new HashMap<String, Object>();
        List<Theme> themes = themeService.getThemes();
        model.put("tag",tagnum);
        model.put("AdminInfo",user);
        model.put("themes",themes);
        return  new ModelAndView("admin/ThemeManage/ThemeManage",model);
    }

@RequestMapping("/getViewFF.do")
@ResponseBody
    public Map getViewFF(){
    List<Theme> themeList = themeService.getThemes();
    List<Theme> themes = new ArrayList<>();
    List<Theme> theme = new ArrayList<>();
    for (int i=0;i<themeList.size();i++){
        if (themeList.get(i).getType().equals("2")){
            themes.add(themeList.get(i));
        }

    }
    for (int i = 0; i < 5; i++) {
        Random random = new Random();
        int n = random.nextInt(themes.size());
        theme.add(themes.get(n));
    }
    Map<String,Object>  model = new HashMap<String, Object>();
    model.put("theme",theme);
    return model;
}

    @RequestMapping("/getSelfBg.do")
    @ResponseBody
    public Map getSelfBg(){
        List<Theme> themeList = themeService.getThemes();
        Theme theme = new Theme();
        for (int i=0;i<themeList.size();i++){
            if (themeList.get(i).getUse()!=null&&themeList.get(i).getType().equals("1")){
              if (themeList.get(i).getUse()!=null&&themeList.get(i).getUse().equals("1")){
                  theme=themeList.get(i);
              }
            }
        }
        Map<String,Object>  model = new HashMap<String, Object>();
        model.put("theme",theme);
        return model;
    }

    @RequestMapping("/getHeadBg.do")
    @ResponseBody
    public Map getHeadBg(){
        List<Theme> themeList = themeService.getThemes();
        Theme theme = new Theme();
        for (int i=0;i<themeList.size();i++){
            if (themeList.get(i).getUse()!=null&&themeList.get(i).getType().equals("3")){
                if (themeList.get(i).getUse()!=null&&themeList.get(i).getUse().equals("1")){
                    theme=themeList.get(i);
                }
            }
        }
        Map<String,Object>  model = new HashMap<String, Object>();
        model.put("theme",theme);
        return model;
    }

    @RequestMapping("/getSelfHeadBg.do")
    @ResponseBody
    public Map getSelfHeadBg(){
        List<Theme> themeList = themeService.getThemes();
        Theme theme = new Theme();
        for (int i=0;i<themeList.size();i++){
            if (themeList.get(i).getUse()!=null&&themeList.get(i).getType().equals("3")){
                if (themeList.get(i).getUse()!=null&&themeList.get(i).getUse().equals("2")){
                    theme=themeList.get(i);
                }
            }
        }
        Map<String,Object>  model = new HashMap<String, Object>();
        model.put("theme",theme);
        return model;
    }

    @RequestMapping("/DeletePic.do")
    @ResponseBody
    public ModelAndView DeletePic(HttpSession session,@RequestParam("id") String id){
        User user=(User)session.getAttribute("Admin");
        Map<String,Object>  model = new HashMap<String, Object>();
        Theme theme = themeService.findById(Integer.parseInt(id));
        int tagnum;
        if (theme.getType().equals("1")){
            tagnum=0;
        }else if(theme.getType().equals("2")){
            tagnum=1;
        }else {
            tagnum=2;
        }
        themeService.deleteTheme(Integer.parseInt(id));
        List<Theme> themes = themeService.getThemes();
        model.put("tag",tagnum);
        model.put("themes",themes);
        model.put("AdminInfo",user);
        return  new ModelAndView("admin/ThemeManage/ThemeManage",model);    }
}
