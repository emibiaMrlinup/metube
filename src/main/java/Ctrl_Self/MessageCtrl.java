package Ctrl_Self;

import Entity.Message;
import Entity.User;
import Service.FriendsService;
import Service.MessageService;
import Service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.*;

@Controller
public class MessageCtrl {
    @Autowired
    MessageService messageService;
    @Autowired
    UserService userService;
    @Autowired
    FriendsService friendsService;

@RequestMapping(value = "SendMessage.do",method = RequestMethod.POST)
    @ResponseBody
    public Map SendMessage(@RequestParam("userid") String userid,@RequestParam("friendid") String friendid,@RequestParam("context") String context,String id){
    Map<String,Object> model = new HashMap<String,Object>();
    Message message = new Message();
    Date date = new Date();
    message.setId(id);
    message.setUserid(userid);
    message.setFriendid(friendid);
    message.setContext(context);
    message.setDate(date);
    boolean ok = messageService.SendMessage(message);
    if (ok){
        model.put("MESSAGE","发送成功");
        return model;
    }else {
        model.put("MESSAGE","发送失败");
        return model;
    }
}
@RequestMapping("getMyMassage.do")
    @ResponseBody
    public Map getMyMassage(HttpSession session){
    User loginUser=(User)session.getAttribute("normalUser");
    Map<String,Object> model = new HashMap<String,Object>();
    List<User> userList= new ArrayList<>();
    List<Message> messageList = messageService.getMessage();
    List<Message> MyMessages = new ArrayList<>();
    int num=0;
    for (int i=0;i<messageList.size();i++){
      if (messageList.get(i).getFriendid().equals(loginUser.getId())){
          MyMessages.add(messageList.get(i));
          User user = userService.QueryById(Integer.parseInt(messageList.get(i).getUserid()));
          userList.add(user);
          num++;
      }
    }
    model.put("count",num);
    model.put("normalUser",loginUser);
   model.put("MyMessages",MyMessages);
    model.put("SendUsers",userList);
    return model;
}
@RequestMapping("/ToMessagePage.do")
    public ModelAndView ToMessagePage(HttpSession session){
        User user=(User)session.getAttribute("normalUser");
        Map<String,Object> model = new HashMap<String,Object>();
        model.put("normalUser",user);
        return new ModelAndView("user/MessageManage",model);
    }
}
