package Ctrl;
import Dao.UserDao;
import Entity.AllClass;
import Entity.User;
import Service.AllClassService;
import Service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class AdminClassCtrl {
    @Autowired
    UserService userService;
    @Autowired
    AllClassService allClassService;
    @RequestMapping("/Adgetclass.do")
    public ModelAndView Adgetclass(HttpSession session,User user){
        user=(User)session.getAttribute("Admin");
        List<AllClass> types=allClassService.getAllTypes();
        Map<String, Object> model = new HashMap<String, Object>();
        model.put("AdminInfo",user);
        model.put("types",types);
        return new ModelAndView("/admin/TypesManage/TypesMainPage",model);
    }
   @RequestMapping("/toAddtypes.do")
    public ModelAndView toAddtypes(HttpSession session){
      User user=(User)session.getAttribute("Admin");
       List<AllClass>typeList=allClassService.getAllTypes();
       Map<String, Object> model = new HashMap<String, Object>();
       model.put("AdminInfo",user);
       model.put("typeList",typeList);
     return new ModelAndView("/admin/TypesManage/TypesAdd",model);
   }
@RequestMapping("/AddTypes.do")
public ModelAndView AddTypes(HttpSession session,String name,String parentid){
    User user=(User)session.getAttribute("Admin");
    AllClass allClass = new AllClass();
    allClass.setName(name);
    allClass.setParentid(parentid);
    boolean ok=allClassService.addTypes(allClass);
    if(ok==true) {
        List<AllClass> types = allClassService.getAllTypes();
        Map<String, Object> model = new HashMap<String, Object>();
        model.put("types", types);
        model.put("AdminInfo",user);
        return new ModelAndView("/admin/TypesManage/TypesMainPage", model);
    }
    else {
    }
    return null;
}

@RequestMapping("/deletetypes.do")
   public ModelAndView deletetypes(HttpSession session,String id){
    User user=(User)session.getAttribute("Admin");
    boolean ok=allClassService.deleteTypes(id);
    List<AllClass> types=allClassService.getAllTypes();
    Map<String, Object> model = new HashMap<String, Object>();
    model.put("AdminInfo",user);
    model.put("types",types);
    return new ModelAndView("/admin/TypesManage/TypesMainPage",model);
}
@RequestMapping("/deleteMaintypes.do")
    public ModelAndView deleteMaintypes(HttpSession session,String id){
    User user=(User)session.getAttribute("Admin");
    List<AllClass> typespropty=allClassService.getAllTypes();
   for(AllClass allClass:typespropty){
       if(allClass.getParentid().equals(id)){
           String nodeid=allClass.getId();
          boolean yes = allClassService.deleteTypes(nodeid);
       }
  }
    boolean ok=allClassService.deleteTypes(id);
    List<AllClass> types=allClassService.getAllTypes();
    Map<String, Object> model = new HashMap<String, Object>();
    model.put("AdminInfo",user);
    model.put("types",types);
    return new ModelAndView("/admin/TypesManage/TypesMainPage",model);
}
@RequestMapping("/Updateypes.do")
    public ModelAndView Updateypes(@RequestParam("id") int id,HttpSession session){
        User user=(User)session.getAttribute("Admin");
        AllClass allClass = allClassService.findById(id);
        List<AllClass>typeList=allClassService.getAllTypes();
        Map<String, Object> model = new HashMap<String, Object>();
        model.put("typeList",typeList);
        model.put("type",allClass);
        model.put("AdminInfo",user);
        return new ModelAndView("/admin/TypesManage/TypesUdpate",model);
}
@RequestMapping("/UpdateTypes.do")
    public ModelAndView UpdateTypes(HttpSession session,User user,AllClass allClass){
    user=(User)session.getAttribute("Admin");
    boolean ok = allClassService.updateTypes(allClass);
    List<AllClass> types=allClassService.getAllTypes();
    Map<String, Object> model = new HashMap<String, Object>();
    model.put("AdminInfo",user);
    model.put("types",types);
    return new ModelAndView("/admin/TypesManage/TypesMainPage",model);
}
}
