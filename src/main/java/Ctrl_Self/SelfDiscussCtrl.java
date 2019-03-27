package Ctrl_Self;

import Entity.Discuss;
import Entity.User;
import Entity.Video;
import Service.DiscussService;
import Service.UserService;
import Service.VideoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
@Controller
public class SelfDiscussCtrl {
    @Autowired
    DiscussService discussService;
    @Autowired
    UserService userService;
    @Autowired
    VideoService videoService;

    @RequestMapping(value = "AddDiscuss.do",method = RequestMethod.POST)
    @ResponseBody
    public Map AddDiscuss(String id, @RequestParam("context") String context,@RequestParam("userid") String userid,@RequestParam("vid") String vid){
       Map<String,Object> model = new HashMap<String,Object>();
        Discuss discuss = new Discuss();
        discuss.setId(id);
        discuss.setContext(context);
        discuss.setUserid(userid);
        discuss.setVid(vid);
        discussService.addDiscuss(discuss);
        model.put("MESSAGE","评论成功!");
       return model;
    }

    @RequestMapping(value = "getDiscussess.do",method = RequestMethod.POST)
    @ResponseBody
    public Map getDiscussess(@RequestParam("vid") String vid){
        Map<String,Object> model = new HashMap<String,Object>();
        Video video  = videoService.findById(Integer.parseInt(vid));
        List<Discuss> discussList = discussService.getDiscuss();
        List list = new ArrayList();
        for(int i=0;i<discussList.size();i++){
            if(discussList.get(i).getVid().equals(vid)){
                User user = userService.QueryById(Integer.parseInt(discussList.get(i).getUserid()));
                List list1  = new ArrayList();
                list1.add(discussList.get(i));
                list1.add(user);
                list.add(list1);
            }
        }
        model.put("DiscussData",list);
        return model;
    }
}
