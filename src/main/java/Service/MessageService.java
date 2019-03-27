package Service;

import Entity.Message;

import java.util.List;

public interface MessageService {
    List<Message> getMessage();
    Message findById(int id);
    boolean deleteMessage(int id);
    boolean SendMessage(Message message);
}
