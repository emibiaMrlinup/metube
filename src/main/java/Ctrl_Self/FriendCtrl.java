package Ctrl_Self;

import Entity.Friends;
import Entity.User;
import Entity.Video;
import Service.FriendsService;
import Service.UserService;
import Service.VideoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class FriendCtrl {
    @Autowired
    UserService userService;
    @Autowired
    VideoService videoService;
    @Autowired
    FriendsService friendsService;
    @RequestMapping(value = "goFriendPage.do")
  public ModelAndView goFriendPage(@RequestParam("id") String id, HttpSession session){
        User loginUser=(User)session.getAttribute("normalUser");
        User thisuser = userService.QueryById(Integer.parseInt(id));
        Map<String,Object> model = new HashMap<String, Object>();
        model.put("thisUser",thisuser);
        model.put("normalUser",loginUser);
        return new ModelAndView("user/UserManage/FriendPage",model);
  }
    @RequestMapping("/getTaVideos.do")
    @ResponseBody
    public Map getTaVideos(@RequestParam("id") String id,HttpSession session){
        //User user = userService.QueryById(Integer.parseInt(id));
        List<Video> videolist=videoService.getVideos();
        Map<String,Object> model = new HashMap<String,Object>();
        List<Video> TaVideoList = new ArrayList<>();
        for(int i=0;i<videolist.size();i++){
            if(videolist.get(i).getUserid().equals(id)){
                TaVideoList.add(videolist.get(i));
            }
        }
        model.put("TaVideoList",TaVideoList);
        return model;
    }
    @RequestMapping("/toOtherMainPage.do")
    @ResponseBody
    public Map toOtherMainPage(@RequestParam("id") String id){
        User user = userService.QueryById(Integer.parseInt(id));
        Map<String,Object> model = new HashMap<String,Object>();
        model.put("user",user);
        return model;
    }
    //关注
   @RequestMapping(value = "AddFriends.do",method = RequestMethod.POST)
    @ResponseBody
    public Map AddFriends(@RequestParam("userid") String userid,@RequestParam("friendid") String friendid,String id){
       Map<String,Object> model = new HashMap<String,Object>();
       Friends friends = new Friends();
       friends.setId(id);
       friends.setUserid(userid);
       friends.setFriendid(friendid);
       boolean ok = friendsService.AddFriends(friends);
       model.put("MESSAGE","关注成功");
         return model;
   }
   //取消关注
   @RequestMapping(value = "DeleteFriends.do",method = RequestMethod.POST)
   @ResponseBody
   public Map DeleteFriends(@RequestParam("userid") String userid,@RequestParam("friendid") String friendid,String id){
       Map<String,Object> model = new HashMap<String,Object>();
       List<Friends> friendsList = friendsService.getFriends();
       Friends friends = new Friends();
       for (int i=0;i<friendsList.size();i++) {
           if (friendsList.get(i).getUserid().equals(userid)) {
               if (friendsList.get(i).getFriendid().equals(friendid)) {
                   friendsService.deleteFriends(Integer.parseInt(friendsList.get(i).getId()));
               }
           }
       }
       model.put("MESSAGE","成功取消关注");
       return model;
   }
   //关注状态
    @RequestMapping(value = "FriendStatus.do",method = RequestMethod.POST)
    @ResponseBody
    public Map FriendsStatus(@RequestParam("userid") String userid,@RequestParam("friendid") String friendid,String id){
        Map<String,Object> model = new HashMap<String,Object>();
        List<Friends> friendsList = friendsService.getFriends();
        List<Friends> friendsList1 = new ArrayList<>();
        for (int i=0;i<friendsList.size();i++){
            if(friendsList.get(i).getUserid().equals(userid)){
                if (friendsList.get(i).getFriendid().equals(friendid)){
                    friendsList1.add(friendsList.get(i));
                }
            }
        }
        if (friendsList1.size()==0){
            model.put("status",0);
        }else{
            model.put("status",1);
        }

        return model;
    }
    //获取关注的所有对象
    @RequestMapping(value = "getFriends.do",method = RequestMethod.POST)
    @ResponseBody
    public Map getFriends(@RequestParam("userid") String userid){
        Map<String,Object> model = new HashMap<String,Object>();
        List<Friends> friendsList = friendsService.getFriends();
        List<Friends> Myfriends = new ArrayList<>();
        List<User> userList = new ArrayList<>();
        int num=0;
        for(int i=0;i<friendsList.size();i++){
         if (friendsList.get(i).getUserid().equals(userid)){
             Myfriends.add(friendsList.get(i));
             User  user = userService.QueryById(Integer.parseInt(friendsList.get(i).getFriendid()));
             userList.add(user);
             num++;
         }
        }
        model.put("count",num);
        model.put("MyFriends",Myfriends);
        model.put("MyFriendsInfo",userList);
        return model;
    }

}
