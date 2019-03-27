package Ctrl;

import Entity.User;
import Service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Controller
public class AdminUserCtrl {
    @Autowired
    UserService userService;
//获取登陆的管理员信息
public User getLoginAdmin(HttpSession session){
    User Admin=(User)session.getAttribute("Admin");
    return Admin;
}
//用户管理列表页
    @RequestMapping("UserList.do")
public ModelAndView GetUserList(HttpServletRequest request,HttpSession session){
        User user=(User)session.getAttribute("Admin");
        String adminname = request.getParameter ("adminname");
        List<User> users = userService.getUser();
        Map<String,Object>  model = new HashMap<String, Object>();
        model.put("users",users);
        model.put("AdminInfo",user);
        return new ModelAndView("/admin/UserManage/UserManage",model);
    }
//用户管理删除
@RequestMapping("AdminUserDelete.do")
public ModelAndView delete(String id,HttpSession session){
    User user=(User)session.getAttribute("Admin");
    Map<String,Object>  model = new HashMap<String, Object>();
    boolean ok = userService.deleteUser(id);
    List<User> users = userService.getUser();
    model.put("users",users);
    model.put("AdminInfo",user);
    return new ModelAndView("/admin/UserManage/UserManage",model);
}
//用户管理用户信息详情页
@RequestMapping("AdminUserDetailView.do")
    public ModelAndView getUsefDetail(@RequestParam("id")int id,HttpSession session){
        User Admin=(User)session.getAttribute("Admin");
        User user = userService.QueryById(id);
        Map<String,Object>  model = new HashMap<String, Object>();
        model.put("user",user);
        model.put("AdminInfo",Admin);
    return new ModelAndView("/admin/UserManage/UserDetail",model);
}
//跳转到用户修改页
@RequestMapping("AdminUserUpdateView.do")
    public ModelAndView turnToUpdate(@RequestParam("id")int id,HttpSession session){
    User Admin=(User)session.getAttribute("Admin");
    User user = userService.QueryById(id);
    Map<String,Object>  model = new HashMap<String, Object>();
    model.put("user",user);
    model.put("AdminInfo",Admin);
    return new ModelAndView("/admin/UserManage/UserUpdate",model);
}
//用户管理修改
@RequestMapping("AdminUserUpdate.do")
    public ModelAndView UserUpdate(User user,HttpSession session){
    User Admin=(User)session.getAttribute("Admin");
    Map<String,Object>  model = new HashMap<String, Object>();
    boolean ok = userService.updateUserInfo(user);
    if(ok==true){
        List<User> users = userService.getUser();
        model.put("sussessful","修改成功");
        model.put("users",users);
        model.put("AdminInfo",Admin);
        return new ModelAndView("/admin/UserManage/UserManage",model);
    }else{
        model.put("error","修改失败");
        model.put("user",user);
        model.put("AdminInfo",Admin);
        return new ModelAndView("/admin/UserManage/UserUpdate",model);
    }
    }
    //搜索用户
    @RequestMapping("/AdminUserSearch.do")
    @ResponseBody
    public  ModelAndView AdminUserSearch(String name,String username,HttpSession session,HttpServletRequest request){
        User user=(User)session.getAttribute("Admin");
        String SearchValue=request.getParameter("searchValue");
        Map<String,Object>  model = new HashMap<String, Object>();
        List<User> users=userService.SearchUser(SearchValue, SearchValue);
        if(users!=null){
           model.put("AdminInfo",user);
           model.put("users",users);
           return new ModelAndView("/admin/UserManage/UserManage",model);
        }else{
            List<User> users1=userService.getUser();
            model.put("AdminInfo",user);
            model.put("error","无结果");
            return new ModelAndView("/admin/UserManage/UserManage",model);
        }
    }
    }
