package Service.ServiceImp;

import Dao.VideoDao;
import Entity.Video;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import Service.VideoService;

import java.util.List;

@Service
@Transactional
public class VideoServiceImp implements VideoService{
    Logger logger = Logger.getLogger(VideoServiceImp.class);
    @Autowired
    VideoDao videoDao;

    @Override
    public Video findById(int id) {
        return videoDao.findById(id);
    }

    @Override
    public List<Video> getVideos() {
        return videoDao.getVideos();
    }
    @Override
    public boolean addVideo(Video video) {
        videoDao.addVideo(video);
        return true;
    }

    @Override
    public boolean deleteVideo(int id) {
        videoDao.deleteVideo(id);
        return true;
    }

    @Override
    public List<Video> searchVideos(String name) {
       return videoDao.searchVideos(name);

    }

    @Override
    public boolean Trialing(Video video) {
        videoDao.Trialing(video);
        return true;
    }
}
