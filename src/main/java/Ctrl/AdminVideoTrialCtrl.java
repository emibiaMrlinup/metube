package Ctrl;

import Entity.*;
import Entity.Collections;
import Service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.*;

@Controller
public class AdminVideoTrialCtrl {
    @Autowired
    UserService userService;
    @Autowired
    VideoService videoService;
    @Autowired
    MessageService messageService;
    @Autowired
    AllClassService allClassService;
    @Autowired
    CollectsService collectsService;
    @Autowired
    CollectionService collectionService;
    @RequestMapping("Trialing.do")
    public ModelAndView Trialing(HttpSession session){
        User user=(User)session.getAttribute("Admin");
        Map<String,Object> model = new HashMap<String, Object>();
        List<Video> videoList = videoService.getVideos();
        List<Video> UnTrials = new ArrayList<>();
        String trial = "1";
        for(int i=videoList.size()-1; i>=0; i--){
            if (!videoList.get(i).getTrial().equals(trial)){
                UnTrials.add(videoList.get(i));
            }
        }
        model.put("UnTrialVideos",UnTrials);
        model.put("AdminInfo",user);
        return new ModelAndView("/admin/VideoManage/VideoTrialing",model);
    }
    @RequestMapping("Trialed.do")
    public ModelAndView Trialed(HttpSession session){
        User user=(User)session.getAttribute("Admin");
        Map<String,Object> model = new HashMap<String, Object>();
        List<Video> videoList = videoService.getVideos();
        List<Video> UnTrials = new ArrayList<>();
        String trial = "1";
        for(int i=videoList.size()-1; i>=0; i--){
            if (videoList.get(i).getTrial().equals(trial)){
                UnTrials.add(videoList.get(i));
            }
        }
        model.put("TrialVideos",UnTrials);
        model.put("AdminInfo",user);
        return new ModelAndView("/admin/VideoManage/VideoTrial",model);
    }
    @RequestMapping("/ReTrialing.do")
    public ModelAndView ReTrialing(HttpSession session, @RequestParam("id") String id,String Messageid){
        User user=(User)session.getAttribute("Admin");
        Map<String,Object> model = new HashMap<String, Object>();
        Video thisvideo = videoService.findById(Integer.parseInt(id));
        Video video = new Video();
        video.setId(id);
        video.setTrial("0");
        videoService.Trialing(video);
        List<Video> videoList = videoService.getVideos();
        Date date = new Date();
        Message message = new Message();
        message.setId(Messageid);
        message.setDate(date);
        message.setUserid(user.getId());
        message.setFriendid(thisvideo.getUserid());
        message.setContext("您的视频（"+thisvideo.getName()+"）被打回去重审了！");
        messageService.SendMessage(message);
        List<Video> UnTrials = new ArrayList<>();
        String trial = "1";
        for(int i=videoList.size()-1; i>=0; i--){
            if (videoList.get(i).getTrial().equals(trial)){
                UnTrials.add(videoList.get(i));
            }
        }
        model.put("AdminInfo",user);
        model.put("TrialVideos",UnTrials);
        return new ModelAndView("/admin/VideoManage/VideoTrial",model);
    }
    @RequestMapping("/IsTrialed.do")
    public ModelAndView Trialing(HttpSession session, @RequestParam("id") String id,String Messageid){
        User user=(User)session.getAttribute("Admin");
        Map<String,Object> model = new HashMap<String, Object>();
        Video thisvideo = videoService.findById(Integer.parseInt(id));
        Video video = new Video();
        video.setId(id);
        video.setTrial("1");
        videoService.Trialing(video);
        List<Video> videoList = videoService.getVideos();
        Date date = new Date();
        Message message = new Message();
        message.setId(Messageid);
        message.setDate(date);
        message.setUserid(user.getId());
        message.setFriendid(thisvideo.getUserid());
        message.setContext("恭喜Up主，您的视频（"+thisvideo.getName()+"）已通过审核！");
        messageService.SendMessage(message);
        List<Video> UnTrials = new ArrayList<>();
        String trial = "1";
        for(int i=videoList.size()-1; i>=0; i--){
            if (!videoList.get(i).getTrial().equals(trial)){
                UnTrials.add(videoList.get(i));
            }
        }
        model.put("AdminInfo",user);
        model.put("UnTrialVideos",UnTrials);
        return new ModelAndView("/admin/VideoManage/VideoTrialing",model);
    }
    @RequestMapping("/AdminDeleteVideo.do")
    public ModelAndView AdminDeleteVideo(HttpSession session, @RequestParam("id") String id,String Messageid){
        User user=(User)session.getAttribute("Admin");
        Map<String,Object> model = new HashMap<String, Object>();
        Video thisvideo = videoService.findById(Integer.parseInt(id));
        Date date = new Date();
        Message message = new Message();
        message.setId(Messageid);
        message.setDate(date);
        message.setUserid(user.getId());
        message.setFriendid(thisvideo.getUserid());
        message.setContext("您的视频（"+thisvideo.getName()+"）已被下架！");
        videoService.deleteVideo(Integer.parseInt(id));
        List<Video> videoList = videoService.getVideos();
        messageService.SendMessage(message);
        List<Video> UnTrials = new ArrayList<>();
        String trial = "1";
        for(int i=videoList.size()-1; i>=0; i--){
            if (videoList.get(i).getTrial().equals(trial)){
                UnTrials.add(videoList.get(i));
            }
        }
        model.put("AdminInfo",user);
        model.put("UnTrialVideos",UnTrials);
        return new ModelAndView("/admin/VideoManage/VideoTrialing",model);
    }
    @RequestMapping("/ToDeleteVideo.do")
    public ModelAndView ToDeleteVideo(HttpSession session, @RequestParam("id") String id,String Messageid){
        User user=(User)session.getAttribute("Admin");
        Map<String,Object> model = new HashMap<String, Object>();
        Video thisvideo = videoService.findById(Integer.parseInt(id));
        Date date = new Date();
        Message message = new Message();
        message.setId(Messageid);
        message.setDate(date);
        message.setUserid(user.getId());
        message.setFriendid(thisvideo.getUserid());
        message.setContext("该视频未通过审核已被删除，请Up主检查自己的视频（"+thisvideo.getName()+"）以及其详情是否包含敏感信息！");
        videoService.deleteVideo(Integer.parseInt(id));
        List<Video> videoList = videoService.getVideos();
        messageService.SendMessage(message);
        List<Video> UnTrials = new ArrayList<>();
        String trial = "1";
        for(int i=videoList.size()-1; i>=0; i--){
            if (!videoList.get(i).getTrial().equals(trial)){
                UnTrials.add(videoList.get(i));
            }
        }
        model.put("AdminInfo",user);
        model.put("UnTrialVideos",UnTrials);
        return new ModelAndView("/admin/VideoManage/VideoTrialing",model);
    }

    @RequestMapping("/AdminTothisVideo.do")
    public ModelAndView getthisVideo(@RequestParam("id") String id, HttpSession session){
        User loginUser =(User)session.getAttribute("Admin");
        session.removeAttribute("normalUser");
        session.setAttribute("normalUser",loginUser);
        Map<String, Object> model = new HashMap<String, Object>();
        Video video = videoService.findById(Integer.parseInt(id));
        List<Video> videoList = videoService.getVideos();
        List<Collects> collectsList = collectsService.getCollects();
        List<Collections> collectionsList = collectionService.getCollections();
        List<Video> randomVideo = new ArrayList<>();
        List<Collects> MyCollects = new ArrayList<>();
        int num = 0;
        for (int i = 0; i < 8; i++) {
            Random random = new Random();
            int n = random.nextInt(videoList.size());
            randomVideo.add(videoList.get(n));
        }
        for (int i = 0; i < collectsList.size(); i++) {
            if (collectsList.get(i).getUserid().equals(loginUser.getId())) {
                MyCollects.add(collectsList.get(i));
            }
        }
        for (int i = 0; i < collectionsList.size(); i++) {
            if (collectionsList.get(i).getVid().equals(id)) {
                num++;
            }
        }
        AllClass allClass = allClassService.findById(video.getChildclass());
        User user = userService.QueryById(Integer.parseInt(video.getUserid()));
        AllClass parentType = allClassService.findById(Integer.parseInt(allClass.getParentid()));
        model.put("ParentType", parentType);
        model.put("arctor", user);
        model.put("ChildType", allClass);
        model.put("thisVideo", video);
        model.put("normalUser", loginUser);
        model.put("randomVideo", randomVideo);
        model.put("MyCollects", MyCollects);
        model.put("num", num);
        return new ModelAndView("user/videopage", model);
    }

}
