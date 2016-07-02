package service;

import config.ShopConfig;
import models.User;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.test.annotation.DirtiesContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import service.user.UserServiceImpl;

import javax.annotation.Resource;

import java.util.Date;

/**
 * Created by Siarhei Baltrukevich on 25.06.2016.
 */

@DirtiesContext
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = ShopConfig.class)
@WebAppConfiguration
public class UserServiceImplTest {

    @Resource
    private JdbcTemplate template;

    @Autowired
    private UserServiceImpl service;

    @Before
    public void setUp() throws Exception {
        String sql = "INSERT INTO users" +
                " (id, login, email, password)"
                + " VALUES (?, ?, ?, ?)";
        template.update(sql, 102, "testUserForDel", "testmail102@mail.ru", "delete");
        template.update(sql, 103, "testUserForGet", "testmail103@mail.ru", "delete");
        template.update(sql, 104, "testUserForUpd", "testmail104@mail.ru", "delete");
    }

    @After
    public void setOut() throws Exception{
        String sql = "DELETE FROM users WHERE password=?";
        template.update(sql, "delete");
    }

    @Test
    public void testSave() throws Exception {
            service.saveOrUpdate(new User(0, "testUserSave", "testmail@mail.ru", "delete"));
    }

    @Test
    public void testUpdate() throws Exception {
        service.saveOrUpdate(new User(104, "testUserWasUpd", "testmail@mail.ru", "delete"));
    }

    @Test
    public void testDelete() throws Exception {
        service.delete(102);
    }

    @Test
    public void testGet() throws Exception {
        service.get(103);
    }

    @Test
    public void testGetByEmail() throws Exception {
        service.getByEmail("email@mail.ru");
    }

    @Test
    public void testGetAll() throws Exception {
        service.getAll();
    }
}