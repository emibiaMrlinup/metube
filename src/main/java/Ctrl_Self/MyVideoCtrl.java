package Ctrl_Self;

import Entity.Collections;
import Entity.User;
import Entity.Video;
import Service.CollectionService;
import Service.UserService;
import Service.VideoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class MyVideoCtrl {
    @Autowired
    UserService userService;
    @Autowired
    VideoService videoService;
    @Autowired
    CollectionService collectionService;
    @RequestMapping("/getMyVideos.do")
    @ResponseBody
    public Map getMyVideos(HttpSession session){
        User user=(User)session.getAttribute("normalUser");
        List<Video> videolist=videoService.getVideos();
        Map<String,Object> model = new HashMap<String,Object>();
        List<Video> MyVideoList = new ArrayList<>();
        for(int i=0;i<videolist.size();i++){
            if(videolist.get(i).getUserid().equals(user.getId())){
                MyVideoList.add(videolist.get(i));
            }
        }
        model.put("MyVideoList",MyVideoList);
        return model;
    }
    @RequestMapping(value = "deleteMyVideo.do",method = RequestMethod.POST)
    @ResponseBody
    public Map deleteMyVideo(@RequestParam("id") String id){
        List<Collections> collectionsList = collectionService.getCollections();
        for(int i=0;i<collectionsList.size();i++){
            if(collectionsList.get(i).getVid().equals(id)){
                collectionService.delete(Integer.parseInt(id));
            }
        }
        videoService.deleteVideo(Integer.parseInt(id));
        Map<String,Object> model = new HashMap<String,Object>();
        model.put("MESSAGE","删除成功");
        return model;
    }
}
