package Dao;


import Entity.Video;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface VideoDao {
    Video findById(int id);
    List<Video> getVideos();
    void  addVideo(Video video);
    int deleteVideo(int id);
   List<Video> searchVideos(@Param("name") String name);
   int Trialing(Video video);
}
