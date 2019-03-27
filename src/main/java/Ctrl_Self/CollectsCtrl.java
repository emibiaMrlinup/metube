package Ctrl_Self;

import Entity.Collects;
import Entity.User;
import Service.CollectsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/Collects")
public class CollectsCtrl {
    @Autowired
    CollectsService collectsService;

    @RequestMapping(params = "page=ColletcsPage")
    public String ColletcsPage(){
        return "user/UserManage/CollectionGroup/CollectsPage";
    }

    @RequestMapping(params = "page=MyPage")
    public String MyPage(){
        return "user/UserManage/CollectionGroup/Collections";
    }

    @RequestMapping(params = "data=getCollects")
    @ResponseBody
    public ModelAndView getCollects(HttpSession session) {
        List<Collects> myCollects = new ArrayList<>();
        User user = (User) session.getAttribute("normalUser");
        System.out.println(user.getId());
        List<Collects> collectsList = collectsService.getCollects();
        Map<String, Object> model = new HashMap<String, Object>();
        for (Collects c : collectsList) {
            if (c.getUserid().equals(user.getId())) {
                myCollects.add(c);
            }
        }
        model.put("myCollects", myCollects);
        return new ModelAndView("user/UserManage/CollectionGroup/CollectsPage", model);
    }
    @RequestMapping(params = "json=getCollects")
    @ResponseBody
    public Map getCollectsJson(HttpSession session) {
        List<Collects> myCollects = new ArrayList<>();
        User user = (User) session.getAttribute("normalUser");
        List<Collects> collectsList = collectsService.getCollects();
        Map<String, Object> model = new HashMap<String, Object>();
        for (Collects c : collectsList) {
            if (c.getUserid().equals(user.getId())) {
                myCollects.add(c);
            }
        }
        model.put("myCollects", myCollects);
        return model;
    }
    //返回添加收藏夹的dialog
    @RequestMapping(params = "page=addColldialogPlay")
    public String addColldialogPlay(){
        return "user/UserManage/CollectionGroup/addCollectsDialog";
    }
}
