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

        String sql1 = "INSERT INTO cars (id, brand, model, transmition, color, engine, year, price, odo, view, frame, " +
                "agregate, skin, aircondition, castdisk, img1)"
                + " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        template.update(sql1, 102, "audi", "a4", "Auto", "gray", "diesel", 2014, 5400, 45000, 99999, "sedan", "used", 1, 1, 1, "for delete");

        template.update("INSERT INTO users_has_cars (users_id, cars_id) VALUES (102, 102)");
    }

    @After
    public void setOut() throws Exception{
        template.update("DELETE FROM users_has_cars WHERE cars_id=102");
        template.update("DELETE FROM users WHERE password=?", "delete");
        template.update("DELETE FROM cars WHERE view=99999");
    }

    @Test
    public void testSave() throws Exception {
            service.saveOrUpdate(new User(0, "testUserSave", "testmail@mail.ru", "delete", "user",new Date()));
    }

    @Test
    public void testUpdate() throws Exception {
        service.saveOrUpdate(new User(104, "testUserWasUpd", "testmail@mail.ru", "delete" , "user",new Date()));
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

    @Test
    public void testDelFromBasket() throws Exception {
        service.delFromBasket(102, 102);
    }

    @Test
    public void testDelAllFromBasket() throws Exception {
        service.delAllFromBasket(102);
    }

    @Test
    public void testAddToBasket() throws Exception {
        service.addToBasket(104, 102);
    }
}