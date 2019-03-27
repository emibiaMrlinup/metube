package Ctrl_Self;


import Entity.AllClass;
import Entity.User;
import Entity.Video;
import Service.AllClassService;
import Service.UserService;
import Service.VideoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.*;

@Controller
public class MainCtrl {

    @Autowired
    AllClassService allClassService;
    @Autowired
    UserService userService;
    @Autowired
    VideoService videoService;
@RequestMapping("/getTothisTypes.do")
    @ResponseBody
    public ModelAndView getTothisTypes(@RequestParam("id") String id, HttpSession session){
    User loginUser=(User)session.getAttribute("normalUser");
    List<AllClass> allClassList = allClassService.getAllTypes();
    List<Video> videoList = videoService.getVideos();
    List<Video> PTypesVideo = new ArrayList<>();
    List<AllClass> PTypes = new ArrayList<>();
    Set<User> Userset = new HashSet<User>();
    Map<String,Object> model = new HashMap<String, Object>();
    for(int i=0;i<allClassList.size();i++){
        if (allClassList.get(i).getParentid().equals(id)) {
            PTypes.add(allClassList.get(i));
        }
    }
    for (int i =0;i<videoList.size();i++){
        AllClass allClass = allClassService.findById(videoList.get(i).getChildclass());
        if (allClass.getParentid().equals(id)){
            videoList.get(i).setClassPlace(id);
            User user = userService.QueryById(Integer.parseInt(videoList.get(i).getUserid()));
            Userset.add(user);
            PTypesVideo.add(videoList.get(i));
        }
    }
    model.put("types",allClassList);
    model.put("videoList",PTypesVideo);
    model.put("PTypes",PTypes);
    model.put("Actor",Userset);
    return new ModelAndView("/user/PtypePage",model);
}
@RequestMapping("/getTothisCTypes.do")
    @ResponseBody
    public ModelAndView getTothisCTypes(@RequestParam("id") String id, HttpSession session){
    User loginUser=(User)session.getAttribute("normalUser");
    List<AllClass> allClassList = allClassService.getAllTypes();
    List<Video> videoList = videoService.getVideos();
    List<Video> PTypesVideo = new ArrayList<>();
    List<AllClass> PTypes = new ArrayList<>();
    Set<User> Userset = new HashSet<User>();
    AllClass ChildType = allClassService.findById(Integer.parseInt(id));
    Map<String,Object> model = new HashMap<String, Object>();
    for(int i=0;i<allClassList.size();i++){
        if (allClassList.get(i).getParentid().equals(ChildType.getParentid())) {
            PTypes.add(allClassList.get(i));
        }
    }
    for (int i =0;i<videoList.size();i++){
        AllClass allClass = allClassService.findById(videoList.get(i).getChildclass());
        if (allClass.getParentid().equals(ChildType.getParentid())){
            videoList.get(i).setClassPlace(ChildType.getParentid());
            User user = userService.QueryById(Integer.parseInt(videoList.get(i).getUserid()));
            Userset.add(user);
            PTypesVideo.add(videoList.get(i));
        }
    }
    model.put("types",allClassList);
    model.put("Type",ChildType);
    model.put("videoList",PTypesVideo);
    model.put("PTypes",PTypes);
    model.put("Actor",Userset);
    model.put("tag",id);
    return new ModelAndView("/user/PtypePage",model);
}
@RequestMapping("/ToMainPage.do")
    @ResponseBody
    public ModelAndView ToMainPage(HttpSession session){
    Map<String,Object> model = new HashMap<String, Object>();
    User loginUser=(User)session.getAttribute("normalUser");
    if (loginUser==null){
        return new ModelAndView("login", model);
    }else {
        List<AllClass> allClassList = allClassService.getAllTypes();
        List<Video> videoList = videoService.getVideos();
        List<Video> PvideoList = new ArrayList<>();
        List<Video> TvideoList = new ArrayList<>();
        List<AllClass> Ptypes = new ArrayList<>();
        for (int i = 0; i < 8; i++) {
            Random random = new Random();
            int n = random.nextInt(videoList.size());
            PvideoList.add(videoList.get(n));
        }
        for (int i = 0; i < 5; i++) {
            Random random = new Random();
            int n = random.nextInt(videoList.size());
            TvideoList.add(videoList.get(n));
        }
        for (int i = 0; i < allClassList.size(); i++) {
            if (allClassList.get(i).getParentid().equals("0")) {
                Ptypes.add(allClassList.get(i));
            }
        }
        for (int i = 0; i < videoList.size(); i++) {
            AllClass allClass = allClassService.findById(videoList.get(i).getChildclass());
            videoList.get(i).setClassPlace(allClass.getParentid());
        }
        model.put("PvideoList", PvideoList);
        model.put("TvideoList", TvideoList);
        model.put("normalUser", loginUser);
        model.put("types", allClassList);
        model.put("Ptypes", Ptypes);
        model.put("videoList", videoList);
        return new ModelAndView("user/index", model);
    }
}
@RequestMapping("NormalToAdminMainPage.do")
    @ResponseBody
    public ModelAndView NormalToAdminMainPage(HttpSession session){
    Map<String,Object> model = new HashMap<String, Object>();
    User loginUser=(User)session.getAttribute("normalUser");
    if (loginUser==null){
        return new ModelAndView("login", model);
    }else {
        if (loginUser != null&&loginUser.getPower() != null&&!"".equals(loginUser.getPower())) {
            session.setAttribute("Admin",loginUser);
            model.put("username", loginUser.getUsername());
            model.put("admin",loginUser);
            System.out.println("User"+loginUser);
            return new ModelAndView("/admin/AdminIndex",model);
        } else {
            List<AllClass> allClassList = allClassService.getAllTypes();
            List<Video> videoList = videoService.getVideos();
            List<Video> PvideoList = new ArrayList<>();
            List<Video> TvideoList = new ArrayList<>();
            List<AllClass> Ptypes = new ArrayList<>();
            for (int i = 0; i < 8; i++) {
                Random random = new Random();
                int n = random.nextInt(videoList.size());
                PvideoList.add(videoList.get(n));
            }
            for (int i = 0; i < 5; i++) {
                Random random = new Random();
                int n = random.nextInt(videoList.size());
                TvideoList.add(videoList.get(n));
            }
            for (int i = 0; i < allClassList.size(); i++) {
                if (allClassList.get(i).getParentid().equals("0")) {
                    Ptypes.add(allClassList.get(i));
                }
            }
            for (int i = 0; i < videoList.size(); i++) {
                AllClass allClass = allClassService.findById(videoList.get(i).getChildclass());
                videoList.get(i).setClassPlace(allClass.getParentid());
            }
            model.put("PvideoList", PvideoList);
            model.put("TvideoList", TvideoList);
            model.put("normalUser", loginUser);
            model.put("types", allClassList);
            model.put("Ptypes", Ptypes);
            model.put("videoList", videoList);
            model.put("msg","你不是管理员");
            return new ModelAndView("user/index", model);
        }
    }
}
}
