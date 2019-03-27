package Service;

import Entity.Video;

import java.util.List;

public interface VideoService {
    Video findById(int id);
    List<Video> getVideos();
    boolean addVideo(Video video);
    boolean deleteVideo(int id);
    List<Video> searchVideos(String name);
    boolean Trialing(Video video);
}
