package Service.ServiceImp;

import Dao.MessageDao;
import Entity.Message;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import Service.MessageService;

import java.util.List;

@Service
@Transactional
public class MessageServiceImp implements MessageService {
    Logger logger = Logger.getLogger(MessageServiceImp.class);
    @Autowired
    MessageDao messageDao;

    @Override
    public List<Message> getMessage() {
        return messageDao.getMessage();
    }

    @Override
    public Message findById(int id) {
        return messageDao.findById(id);
    }

    @Override
    public boolean deleteMessage(int id) {
        messageDao.deleteMessage(id);
        return true;
    }

    @Override
    public boolean SendMessage(Message message) {
        messageDao.SendMessage(message);
        return true;
    }
}
