package service.user;

import models.User;

import java.util.List;

/**
 * Created by Siarhei Baltrukevich on 23.06.2016.
 */
public interface UserService {

    void saveOrUpdate(User user);

    void delete(int userId);

    User get(int userId);

    User getByEmail(String name);

    List<User> getAll();
}
