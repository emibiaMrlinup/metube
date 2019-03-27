package Ctrl_Self;

import Entity.AllClass;
import Entity.User;
import Entity.Video;
import Service.AllClassService;
import Service.UserService;
import Service.VideoService;
import org.apache.commons.fileupload.util.Streams;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class VideoUploadCtrl {
    @Autowired
    VideoService videoService;
    @Autowired
    UserService userService;
    @Autowired
    AllClassService allClassService;
    //跳转视频上传页；
    @RequestMapping("/ToUploadVideoPage.do")
    public ModelAndView ToUploadVideoPage(HttpSession session){
        User user=(User)session.getAttribute("normalUser");
        List<AllClass> typeList = allClassService.getAllTypes();
        Map<String,Object> model = new HashMap<String,Object>();
        model.put("normalUser",user);
        model.put("typelist",typeList);
        return new ModelAndView("user/UserManage/SelfMain/UploadVideo",model);
    }
    //上传视频；
    @RequestMapping("/UploadVideo.do")
    public ModelAndView UploadVideo(HttpSession session, HttpServletRequest request, String id, String name,
                                    String detail, String url,
                                    String vpic, int childclass,
                                    @RequestParam("Video") MultipartFile videofile,
                                    @RequestParam("VideoPicture") MultipartFile vpicfile
    )throws IOException{
        String massage="";
        String massage1;
        User thisuser = (User)session.getAttribute("normalUser");
        Map<String,Object> model = new HashMap<String,Object>();
        MultipartFile videofiler=videofile;
        MultipartFile vpicfiler=vpicfile;
        try {
            if (videofile.getSize() > 10 * 1024 * 1024) {
                massage = "上传失败，視頻文件过大！";
                massage1=null;
                model.put("massage",massage);
                model.put("massage1",massage1);
                model.put("normalUser",thisuser);
            } else {
                Date date = new Date();
                String nowTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(date);
                Video video = new Video();
                video.setId(id);
                video.setName(request.getParameter("name"));
                video.setUserid(thisuser.getId());
                video.setDetail(detail);
                video.setChildclass(childclass);
                video.setDateshow(Timestamp.valueOf(nowTime));
                String videoname = videofile.getOriginalFilename();
                String vipcname = vpicfile.getOriginalFilename();
                String videoTargetPath = request.getSession().getServletContext().getRealPath("/A_video");
                String videoTargetPathr = request.getSession().getServletContext().getRealPath("/assets/A_video");
                String picTargetPath = request.getSession().getServletContext().getRealPath("/A_picture");
                String picTargetPathr = request.getSession().getServletContext().getRealPath("/assets/A_picture");
                int noTarget=videoTargetPath.lastIndexOf("target");
                String str=videoTargetPath.substring(0,noTarget);
                String videoPath=str+"src/main/webapp/assets/A_video";
                String vimagePath = str+"src/main/webapp/assets/A_picture";
                System.out.println(videoPath.toString());
                System.out.println(vimagePath.toString());
                String videofileType = videoname.substring(videoname.lastIndexOf("."));
                String picfileType = vipcname.substring(vipcname.lastIndexOf("."));// 截取文件格式
                // 自定义方式产生文件名
                String v_serialName = String.valueOf(System.currentTimeMillis());
                String p_serialName = String.valueOf(System.currentTimeMillis());
                File uploadVideoFile = new File(videoPath + "/" + v_serialName + videofileType);
                File ServletVideoFile = new File(videoTargetPathr+"/"+v_serialName + videofileType);
                File uploadVimgFile = new File(vimagePath + "/" + p_serialName + picfileType);
                File ServletVideoPicFile = new File(picTargetPathr + "/" + p_serialName + picfileType);
                //videofile.transferTo(new File(  videoPath+"/" + v_serialName + videofileType));
                //vpicfile.transferTo(new File( vimagePath+"/" + p_serialName + picfileType));
                Streams.copy(videofile.getInputStream(),new FileOutputStream(uploadVideoFile.getAbsolutePath()),true);
                Streams.copy(vpicfile.getInputStream(),new FileOutputStream(uploadVimgFile.getAbsolutePath()),true);
                //已部署工程路径
                Streams.copy(videofiler.getInputStream(),new FileOutputStream(ServletVideoFile.getAbsolutePath()),true);
                Streams.copy(vpicfiler.getInputStream(),new FileOutputStream(ServletVideoPicFile.getAbsolutePath()),true);
                video.setUrl("/assets/A_video/" + v_serialName + videofileType);
                video.setVpic("/assets/A_picture/" + p_serialName + picfileType);
                videoService.addVideo(video);
                massage = "上传成功,等待审核";
                massage1="yes";
                model.put("massage",massage);
                model.put("massage1",massage1);
                model.put("normalUser",thisuser);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return new ModelAndView("user/UserManage/SelfMain/WaitReturn",model);
    }

//    public String reverse(String s){
//        char[] letters=s.toCharArray();
//        char temp;
//        int len=letters.length;
//        for(int i=len/2-1;i>=0;i--){
//            temp=letters[i];
//            letters[i]=letters[len-1-i];
//            letters[len-1-i]=temp;
//        }
//        return new String(letters);
//    }
}

