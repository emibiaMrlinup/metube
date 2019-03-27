package Dao;

import Entity.Message;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MessageDao {
List<Message> getMessage();
Message findById(int id);
int deleteMessage(int id);
void SendMessage(Message message);
}
