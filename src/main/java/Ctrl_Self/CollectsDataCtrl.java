package Ctrl_Self;

import Entity.Collections;
import Entity.Collects;
import Entity.User;
import Entity.Video;
import Service.CollectionService;
import Service.CollectsService;
import Service.UserService;
import Service.VideoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.*;

@Controller
public class CollectsDataCtrl {
    @Autowired
    CollectsService collectsService;
    @Autowired
    CollectionService collectionService;
    @Autowired
    VideoService videoService;
    @Autowired
    UserService userService;
    @RequestMapping(value = "/addCollects.do",method = RequestMethod.POST)
    @ResponseBody
    public String addCollects(Collects collects){
        boolean ok =  collectsService.addCollects(collects);
        return null;
    }
    @RequestMapping("/getColletsData.do")
    @ResponseBody
    public Map getColletsData(HttpSession session){
        User user=(User)session.getAttribute("normalUser");
        List<Collects> collectsList=collectsService.getCollects();
        List<Collections> collectionList=collectionService.getCollections();
        List<Video> videoList=videoService.getVideos();
        List myCollects = new ArrayList();
        Map<String,Object> model = new HashMap<String,Object>();
        for(int i=0;i<collectsList.size();i++) {
                List CVlist= new ArrayList();
            if (collectsList.get(i).getUserid().equals(user.getId())) {
                Collects collects=collectsList.get(i);
                List<Video> myVideos=new ArrayList<>();
                CVlist.add(collects);
                for(int j=0;j<collectionList.size();j++){
                    if(collectionList.get(j).getCid().equals(collectsList.get(i).getId()))
                        for(int k=0;k<videoList.size();k++) {
                        if(videoList.get(k).getId().equals(collectionList.get(j).getVid())){
                            System.out.println(videoList.get(k).getId());
                            videoList.get(k).AddCollectTime(collectionList.get(j),j,i);
                            myVideos.add(videoList.get(k));
                        }
                }
            }
            CVlist.add(myVideos);
            myCollects.add(CVlist);
        }
        }
        model.put("collect",myCollects);
        return model;
    }
   @RequestMapping(value = "deleteCollects.do",method = RequestMethod.POST)
    @ResponseBody
    public Map deleteCollects(@RequestParam("id") String id){
       Map<String,Object> model = new HashMap<String,Object>();
       int cid = Integer.parseInt(id);
       List<Collections> collectionsList = collectionService.getCollections();
       List<Collections> myCollecttions= new ArrayList<>();
       for(int i=0;i<collectionsList.size();i++){
           if(collectionsList.get(i).getCid().equals(id)){
               collectionService.delete(Integer.parseInt(collectionsList.get(i).getId()));
           }
       }
       Collects collects = collectsService.findById(cid);
       collectsService.deleteCollects(cid);
       model.put("Message",collects.getName()+"已被删除");
       return model;
   }
   @RequestMapping(value = "updateCollects.do",method = RequestMethod.POST)
    @ResponseBody
    public Map updateCollects(@RequestParam("id") String id,@RequestParam("name") String name,HttpSession session){
       User user=(User)session.getAttribute("normalUser");
       Collects collects = new Collects();
       collects.setId(id);
       collects.setName(name);
       collects.setUserid(user.getId());
       collectsService.updateCollects(collects);
       Map<String,Object> model = new HashMap<String,Object>();
       model.put("MESSAGE","修改成功");
     return model;
   }
   @RequestMapping(value = "AddCollects.do",method = RequestMethod.POST)
    @ResponseBody
    public Map AddCollects(@RequestParam("name") String name,HttpSession session,String id){
       User user=(User)session.getAttribute("normalUser");
       Map<String,Object> model = new HashMap<String,Object>();
       Collects collects = new Collects();
       collects.setId(id);
       collects.setName(name);
       collects.setUserid(user.getId());
       collectsService.addCollects(collects);
       model.put("MESSAGE","添加成功");
       return model;
   }
@RequestMapping(value = "deleteCollections.do",method = RequestMethod.POST)
    @ResponseBody
    public Map deleteCollections(@RequestParam("id") String id){
        int ctid = Integer.parseInt(id);
        collectionService.delete(ctid);
    Map<String,Object> model = new HashMap<String,Object>();
    model.put("MESSAGE","删除成功");
        return model;
}
//添加收藏
    @RequestMapping(value = "AddCollections.do",method = RequestMethod.POST)
    @ResponseBody
    public Map AddCollectionss(@RequestParam("vid") String vid,@RequestParam("cid") String cid,String id){
        Map<String,Object> model = new HashMap<String,Object>();
        int num=0;
        Collections collections = new Collections();
        Date date = new Date();
        collections.setId(id);
        collections.setCid(cid);
        collections.setVid(vid);
        collections.setDate(date);
        collectionService.addCollections(collections);
        List<Collections> collectionsList = collectionService.getCollections();
        for(int i=0;i<collectionsList.size();i++){
            if (collectionsList.get(i).getVid().equals(vid)){
                num++;
            }
        }
        model.put("count",num);
        model.put("MESSAGE","添加成功");
        return model;
    }
    //收藏状态
    @RequestMapping(value = "CollectionStatus.do",method = RequestMethod.POST)
    @ResponseBody
    public Map CollectionStatus(@RequestParam("vid") String vid,@RequestParam("userid") String userid){
        Map<String,Object> model = new HashMap<String,Object>();
        User user = userService.QueryById(Integer.parseInt(userid));
        List<Collects> collectsList = collectsService.getCollects();
        List<Collections> collectionsList = collectionService.getCollections();
        List<Collections> MyCollections = new ArrayList<>();
        int num=0;
        for (int i=0;i<collectsList.size();i++){
            if (collectsList.get(i).getUserid().equals(user.getId())){
                for (int j=0;j<collectionsList.size();j++){
                    if (collectionsList.get(j).getVid().equals(vid)){
                    if (collectionsList.get(j).getCid().equals(collectsList.get(i).getId())){
                         MyCollections.add(collectionsList.get(j));
                     }
                    }
                }
            }
        }
        for(int i=0;i<collectionsList.size();i++){
            if (collectionsList.get(i).getVid().equals(vid)){
                num++;
            }
        }
       if (MyCollections.size()==0){
            model.put("status",0);
       }else{
           model.put("status",1);
       }
       model.put("num",num);
        return model;
    }
//取消收藏

    @RequestMapping(value = "deleteThisCollections.do",method = RequestMethod.POST)
    @ResponseBody
    public Map deleteThisCollections(@RequestParam("vid") String vid,@RequestParam("userid") String userid){
        Map<String,Object> model = new HashMap<String,Object>();
        User user = userService.QueryById(Integer.parseInt(userid));
        List<Collects> collectsList = collectsService.getCollects();
        List<Collections> collectionsList = collectionService.getCollections();
        int num=0;
        for (int i=0;i<collectsList.size();i++){
            if (collectsList.get(i).getUserid().equals(user.getId())){
                for (int j=0;j<collectionsList.size();j++){
                    if (collectionsList.get(j).getVid().equals(vid)){
                        if (collectionsList.get(j).getCid().equals(collectsList.get(i).getId())){
                            collectionService.delete(Integer.parseInt(collectionsList.get(j).getId()));
                        }
                    }
                }
            }
        }
        List<Collections> collectionsList1 = collectionService.getCollections();
        for(int i=0;i<collectionsList1.size();i++){
            if (collectionsList1.get(i).getVid().equals(vid)){
                num++;
            }
        }
        model.put("count",num);
        model.put("MESSAGE","已取消收藏");
        return model;
    }
}

