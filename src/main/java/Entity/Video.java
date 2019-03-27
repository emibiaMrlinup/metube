package Entity;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

public class Video {
    private String id;
    private String name;
    private String detail;
    private String url;
    private String vpic;
    private int childclass;
    private String userid;
    private String trial;
    private Date dateshow;
    private int discussgroup;
    private String ClassPlace;
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getVpic() {
        return vpic;
    }

    public void setVpic(String vpic) {
        this.vpic = vpic;
    }

    public int getChildclass() {
        return childclass;
    }

    public void setChildclass(int childclass) {
        this.childclass = childclass;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public String getTrial() {
        return trial;
    }

    public void setTrial(String trial) {
        this.trial = trial;
    }

    public Date getDateshow() {
        return dateshow;
    }

    public void setDateshow(Date dateshow) {
        this.dateshow = dateshow;
    }

    public int getDiscussgroup() {
        return discussgroup;
    }

    public String getClassPlace() {
        return ClassPlace;
    }

    public void setClassPlace(String classPlace) {
        ClassPlace = classPlace;
    }

    public void setDiscussgroup(int discussgroup) {
        this.discussgroup = discussgroup;
    }
    public Map AddCollectTime(Collections collections,int index,int items){
        Date date = collections.getDate();
        Map<String,Object> map = new HashMap<String,Object>();
        map.put("CollectsDate"+index+items,date);
        return map;
    }
}
