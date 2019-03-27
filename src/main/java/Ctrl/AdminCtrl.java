package Ctrl;

import Dao.UserDao;
import Entity.AllClass;
import Entity.User;
import Entity.Video;
import Service.AllClassService;
import Service.UserService;
import Service.VideoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.*;

@Controller
public class AdminCtrl {
    @Autowired
    UserService userService;
    @Autowired
    AllClassService allClassService;
    @Autowired
    VideoService videoService;
    @RequestMapping("/")
    public String ToAdminIndex(){
  //return "admin/UserManage/UserManage";
        return "login";
    }
    @RequestMapping("Adminlogin.do")
    public ModelAndView login(String username, String password, HttpServletRequest request, HttpSession session){
        final  String msg1="密码或用户名错误";
        final  String msg2="密码或用户名不能为空";
        String loginname=request.getParameter("username");
        String loginpass=request.getParameter("password");
        System.out.println("username"+loginname);
        System.out.println("username"+loginpass);
        Map<String, Object> model = new HashMap<String, Object>();
        if(!"".equals(loginname) || loginname != null&&!"".equals(loginpass) || loginpass != null) {
            User user = userService.login(username, password);
            if (user != null&&user.getPower() != null&&!"".equals(user.getPower())) {
                session.setAttribute("Admin",user);
                model.put("username", username);
                model.put("AdminInfo",user);
                System.out.println("User"+user);
                return new ModelAndView("/admin/AdminIndex",model);
            } else {
                model.put("error1", msg1);
                System.out.println("密码或用户名错误");
                return new ModelAndView("login",model);
            }
        }else {
            model.put("error2",msg2);
            System.out.println("密码或用户名不能为空");
            return  new ModelAndView("login",model);
        }
    }
    //管理员信息
    @RequestMapping("/getAdminDetail.do")
    public ModelAndView getAdminInfo(HttpSession session){
        User user=(User)session.getAttribute("Admin");
        Map<String,Object> model = new HashMap<String,Object>();
        model.put("AdminInfo",user);
        model.put("user",user);
        return  new ModelAndView("/admin/AdminDetail",model);
    }
    //等出
    @RequestMapping("/Adminlogout.do")
    public String Adminlogout(HttpSession session){
        //String user=(User)session.getAttribute("Admin")
        session.removeAttribute("Admin");
        return "/login";
    }
    //进入个人页
    @RequestMapping("/ToAdminSelfManage.do")
    @ResponseBody
    public ModelAndView ToSelfManage(HttpSession session){
        User user=(User)session.getAttribute("Admin");
        session.removeAttribute("normalUser");
        session.setAttribute("normalUser",user);
        Map<String,Object> model = new HashMap<String,Object>();
        model.put("normalUser",user);
        return new ModelAndView("user/UserManage/SelfManage",model);
    }
    @RequestMapping("/AdminToMainPage.do")
    public ModelAndView toMainPage(HttpSession session,User user){
        Map<String,Object> model = new HashMap<String, Object>();
        user=(User)session.getAttribute("Admin");
        session.removeAttribute("normalUser");
        session.setAttribute("normalUser",user);
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
        model.put("normalUser", user);
        model.put("types", allClassList);
        model.put("Ptypes", Ptypes);
        model.put("videoList", videoList);
        return new ModelAndView("user/index", model);
    }
}
