package Ctrl;

import Entity.AllClass;
import Entity.User;
import Entity.Video;
import Service.AllClassService;
import Service.UserService;
import Service.VideoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.*;

@Controller
public class UserCtrl {
    @Autowired
    UserService userService;
    @Autowired
    AllClassService allClassService;
    @Autowired
    VideoService videoService;
    @RequestMapping("/toLogin.do")
    public String toLogin(){
        return  "login";
    }
    @RequestMapping("/toReg.do")
     public  String toReg(){
    return "reg";
}
//普通用户登录
@RequestMapping("/Userlogin.do")
    public ModelAndView UserLogin(String username, String password,HttpServletRequest request, HttpSession session){
    final  String msg1="密码或用户名错误";
    final  String msg2="密码或用户名不能为空";
    String loginname=request.getParameter("username");
    String loginpass=request.getParameter("password");
    System.out.println("username"+loginname);
    System.out.println("password"+loginpass);
    Map<String, Object> model = new HashMap<String, Object>();
    if(!"".equals(loginname) || loginname != null&&!"".equals(loginpass) || loginpass != null) {
        User user = userService.login(username, password);
        if (user != null) {
            session.setAttribute("normalUser",user);
            List<AllClass> allClassList = allClassService.getAllTypes();
            List<Video> videoList = videoService.getVideos();
            List<Video> PvideoList = new ArrayList<>();
            List<Video> TvideoList = new ArrayList<>();
            List<AllClass> Ptypes = new ArrayList<>();
            for(int i=0;i<8;i++){
                Random random = new Random();
                int n = random.nextInt(videoList.size());
                PvideoList.add(videoList.get(n));
            }
            for (int i=0;i<5;i++){
                Random random = new Random();
                int n = random.nextInt(videoList.size());
                TvideoList.add(videoList.get(n));
            }
            for(int i=0;i<allClassList.size();i++){
                if (allClassList.get(i).getParentid().equals("0")){
                    Ptypes.add(allClassList.get(i));
                }
            }
            for (int i=0;i<videoList.size();i++){
                AllClass allClass = allClassService.findById(videoList.get(i).getChildclass());
                videoList.get(i).setClassPlace(allClass.getParentid());
            }
            model.put("username", username);
            model.put("PvideoList",PvideoList);
            model.put("TvideoList",TvideoList);
            model.put("normalUser",user);
            model.put("types",allClassList);
            model.put("Ptypes",Ptypes);
            model.put("videoList",videoList);
            System.out.println("User"+user);
            return new ModelAndView("user/index",model);
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
//普通用戶注冊
@RequestMapping("/Reg.do")
    public ModelAndView Reg(String id,String username,String password,HttpServletRequest request){
     User user=new User();
    username=request.getParameter("username");
    password=request.getParameter("password");
    user.setId(id);
    user.setUsername(username);
    user.setPassword(password);
    List<User> userList=userService.getUser();
    Map<String,Object> model = new HashMap<String,Object>();
    if(user.getUsername()!=null&&user.getPassword()!=null&&!"".equals(user.getUsername())&&!"".equals(user.getPassword())){


       for(User u : userList) {

           if (u.getUsername().equals(username)) {
               model.put("error", "給用戶已存在");
               return new ModelAndView("/reg", model);
           }
       }
       for(User ue:userList){
           if(ue.getUsername().equals(username)) {
               boolean ok = userService.addUser(user);
           if (ok) {
        model.put("user", user);
        return new ModelAndView("/login", model);
           } else {
        return new ModelAndView("/reg");
    }
}
        }
    }
        else {
              model.put("error1","賬號或者密碼爲空");
             return new ModelAndView("/reg",model);
    }
  return null;
}
//获取当前登陆用户的json数据
@RequestMapping("/getNormalUser.do")
@ResponseBody
    public Map loginUser(HttpSession session){
        User user=(User)session.getAttribute("normalUser");
        Map<String,Object> model = new HashMap<String,Object>();
        model.put("NUser",user);
        return model;
}
//进入个人页
    @RequestMapping("/ToSelfManage.do")
    @ResponseBody
    public ModelAndView ToSelfManage(HttpSession session){
        User user=(User)session.getAttribute("normalUser");
        Map<String,Object> model = new HashMap<String,Object>();
        model.put("normalUser",user);
        return new ModelAndView("user/UserManage/SelfManage",model);
    }
   @RequestMapping("/ToUpdatePWD.do")
    @ResponseBody
    public ModelAndView ToUpdatePWD(HttpSession session){
       User user=(User)session.getAttribute("normalUser");
       Map<String,Object> model = new HashMap<String,Object>();
       model.put("normalUser",user);
        return new ModelAndView("user/UpdatePWD",model);
   }
   @RequestMapping(value = "UpdatePWD.do",method = RequestMethod.POST)
    @ResponseBody
    public Map UpdatePWD(HttpSession session, @RequestParam("oldpass") String oldpass,
                         @RequestParam("newpass") String newpass,
                         @RequestParam("newpassRe") String newpassRe){
       User user=(User)session.getAttribute("normalUser");
       User loginUser = userService.QueryById(Integer.parseInt(user.getId()));
       Map<String,Object> model = new HashMap<String,Object>();
       if (loginUser.getPassword().equals(oldpass)){
           if (newpass.equals(newpassRe)){
               User user1 = new User();
               user1.setId(user.getId());
               user1.setPassword(newpass);
               userService.updateUserPWD(user1);
               model.put("MESSAGE","修改成功");
           }else{
               model.put("MESSAGE","新密码错误");
           }
       }else {
               model.put("MESSAGE","旧密码错误");
       }
       return model;

   }
}
