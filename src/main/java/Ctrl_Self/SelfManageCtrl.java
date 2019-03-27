package Ctrl_Self;

import Entity.Collects;
import Entity.User;
import Service.CollectsService;
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
import org.w3c.dom.stylesheets.LinkStyle;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class SelfManageCtrl {
    @Autowired
    UserService userService;
    @Autowired
    CollectsService collectsService;
    @RequestMapping("/toMyMainPage.do")
    @ResponseBody
    public Map toMyMainPage(HttpSession session, HttpServletRequest request){
        User user =new User();
        user=(User)session.getAttribute("normalUser");
        int id = Integer.parseInt(user.getId());
        User me = userService.QueryById(id);
        Map<String,Object> model = new HashMap<String,Object>();
        model.put("user",me);
        return model;
    }
    @RequestMapping("/ToUpdateUserInfo.do")
    public ModelAndView ToUpdateUserInfo(HttpSession session){
        //User user=userService.QueryById(id);
        User user=(User)session.getAttribute("normalUser");
        Map<String,Object>  model = new HashMap<String, Object>();
        model.put("user",user);
        return new ModelAndView("user/UserManage/SelfMain/UpdateMyInfo",model);
    }

    @RequestMapping("/toCollectsPage.do")
    public ModelAndView ToCollectsPage(HttpSession session){
        User user=(User)session.getAttribute("normalUser");
        List<Collects> ColletsList=collectsService.getCollects();
        List<Collects> MyCollects=null;
        for (Collects c: ColletsList)
        {
            if(c.getUserid()==user.getId()){
                MyCollects.add(c);
            }
        }
        Map<String,Object>  model = new HashMap<String, Object>();
        model.put("user",user);
        model.put("MyCollects",MyCollects);
        return new ModelAndView("user/UserManage/SelfMain/Collection",model);
    }
    @RequestMapping("/getCollectsJson.do")
    @ResponseBody
    public Map getCollectsPageJson(HttpSession session){
        User user=(User)session.getAttribute("normalUser");
        List<Collects> ColletsList=collectsService.getCollects();
        List<Collects> MyCollects=new ArrayList<Collects>();
        for (Collects c: ColletsList)
        {
            if(c.getUserid().equals(user.getId())){
                MyCollects.add(c);
            }
        }
        Map<String,Object>  model = new HashMap<String, Object>();
        model.put("user",user);
        model.put("MyCollects",MyCollects);
        return model;
    }

    @RequestMapping("/toselfManage.do")
    public ModelAndView toselfManage(HttpSession session){
        User user=(User)session.getAttribute("normalUser");
        Map<String,Object> model = new HashMap<String,Object>();
        model.put("normalUser",user);
        return new ModelAndView("user/UserManage/SelfManage",model);
    }
    //提交用户更新信息API
    @RequestMapping(value = "PostMyUpInfo.do",method = RequestMethod.POST)
    @ResponseBody
    public Map PostMyUpInfo(User user){
       Map<String,Object> model= new HashMap<String,Object>();
        List<User> userlist= userService.getUser();
        int i=1;
           for(User u:userlist ){
             if (user.getName().equals(u.getName())){
                 model.put("errorMassage","改昵称已存在");
                 break;
               }else if(user.getUsername().equals(u.getUsername())){
                 model.put("errorMassage","改用户名已存在");
                 break;
             }else {
                 //model.put("successMassage","修改成功");
                 i++;
             }
           }
           if(i==userlist.size()){
               model.put("successMassage","修改成功");
               boolean ok = userService.updateUserInfo(user);
           }

      return model;
    }
    //提交用户头像API
    @RequestMapping(value = "ToUpdatePicInfo.do",method = RequestMethod.POST)
    @ResponseBody
    public  Map updateUserPicInfo(String id,MultipartFile userPicture,HttpServletRequest request)throws IOException {
        Map<String, Object> model = new HashMap<String, Object>();
        User user = new User();
       try {
           user.setId(id);
           MultipartFile userPictureCopy = userPicture;
           String picname = userPicture.getOriginalFilename();
           String PicTargetPath = request.getSession().getServletContext().getRealPath("/assets/User_pic");
           String PicTargetPathr = request.getSession().getServletContext().getRealPath("/User_pic");
           int noTarget = PicTargetPathr.lastIndexOf("target");
           String str = PicTargetPathr.substring(0, noTarget);
           String Path = str + "src/main/webapp/assets/User_pic";
           String pictype = picname.substring(picname.lastIndexOf("."));
           String serialName = String.valueOf(System.currentTimeMillis());
           File UserPicFile = new File(Path + "/" + serialName + pictype);
           File ServletUserPicFile= new File(PicTargetPath+"/"+serialName+pictype);
           Streams.copy(userPicture.getInputStream(), new FileOutputStream(UserPicFile.getAbsolutePath()), true);
           Streams.copy(userPictureCopy.getInputStream(),new FileOutputStream(ServletUserPicFile.getAbsolutePath()),true);
           user.setUserpic("/assets/User_pic/" + serialName + pictype);
           boolean ok = userService.updateUserPic(user);
           System.out.println(user.getUserpic());
       }catch (Exception e){
           e.printStackTrace();
       }
        model.put("successMassage","已更新头像!");
        return model;
    }
}
