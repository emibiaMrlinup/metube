package Ctrl;

import Entity.*;
import Entity.Collections;
import Service.*;
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
public class VIdeoPlayCtrl {
@Autowired
    VideoService videoService;
@Autowired
    AllClassService allClassService;
@Autowired
    UserService userService;
@Autowired
    CollectsService collectsService;
@Autowired
    CollectionService collectionService;
    @RequestMapping(value = "getthisVideo.do")
    @ResponseBody
    public ModelAndView getthisVideo(@RequestParam("id") String id, HttpSession session){
        User loginUser=(User)session.getAttribute("normalUser");
        if (loginUser!=null) {
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
        }else {
            return new ModelAndView("/login", null);
        }
    }
    //搜索视频
    @RequestMapping(value = "searchVideo.do")
    @ResponseBody
    public ModelAndView searchVideo(@RequestParam("name") String name,HttpSession session){
        User loginUser=(User)session.getAttribute("normalUser");
        List<Video> videoList = videoService.searchVideos(name);
        List<AllClass> allClassList =allClassService.getAllTypes();
        Set<User> Userset = new HashSet<User>();
        for (int i=0;i<videoList.size();i++){
            User user = userService.QueryById(Integer.parseInt(videoList.get(i).getUserid()));
            AllClass allClass = allClassService.findById(videoList.get(i).getChildclass());
            videoList.get(i).setClassPlace(allClass.getParentid());
            Userset.add(user);
        }

        Map<String,Object> model = new HashMap<String, Object>();
        model.put("searchVideo",videoList);
        model.put("allType", allClassList);
        model.put("Artor",Userset);
        model.put("searchContext",name);
        model.put("normalUser",loginUser);
        return new ModelAndView("user/SearchPage",model);
    }
    //Set-List
    public static List deleteSameParam(Set set){
        List<Object> myList = new ArrayList<Object>();
        for(Object object: set){
            myList.add(object);
        }
        return myList;
    }
}
