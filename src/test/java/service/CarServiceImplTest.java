package service;

import config.ShopConfig;
import models.Car;
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
import service.car.CarServiceImpl;

import javax.annotation.Resource;
import java.util.Date;

/**
 * Created by Siarhei Baltrukevich on 26.06.2016.
 */

@DirtiesContext
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = ShopConfig.class)
@WebAppConfiguration
public class CarServiceImplTest {

    @Resource
    private JdbcTemplate template;

    @Autowired
    private CarServiceImpl service;

    @Before
    public void setUp() throws Exception {
        String sql = "INSERT INTO cars (id, brand, model, transmition, color, engine, year, price, odo, view, frame, " +
                "agregate, skin, aircondition, castdisk, img1)"
                + " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        template.update(sql, 102, "audi", "a4", "Auto", "gray", "diesel", 2014, 5400, 45000, 99999, "sedan", "used", 1, 1, 1, "for delete");
        template.update(sql, 103, "audi", "a6", "Auto", "gray", "diesel", 2014, 5400, 45000, 99999, "sedan", "used", 1, 1, 1, "for update");
        template.update(sql, 104, "audi", "a8", "Auto", "gray", "diesel", 2014, 5400, 45000, 99999, "sedan", "used", 1, 1, 1, "for get");

        template.update("INSERT INTO users (id, login, password, email) VALUES (99999, 'login', 'testpass', 'test@mail.ru')");

        String sql1 = "INSERT INTO users_has_cars (users_id, cars_id) VALUES (?, ?)";
        template.update(sql1, 99999, 102);
        template.update(sql1, 99999, 103);
        template.update(sql1, 99999, 104);
    }

    @After
    public void tearDown() throws Exception {
        template.update("DELETE FROM users_has_cars WHERE users_id=99999");
        template.update("DELETE FROM cars WHERE view=99999");
        template.update("DELETE FROM users WHERE id=99999");

    }

    @Test
    public void testGetAll() throws Exception {
        service.getAll();
    }

    @Test
    public void testGetAllForUser() throws Exception {
        service.getAllForUser(1);
    }

    @Test
    public void testGetOne() throws Exception {
        service.getOne(103);
    }

    @Test
    public void testSave() throws Exception {
        service.saveOrUpdate(new Car(0, 2015, 6200, 55222, 99999, "audi", "a4", "Auto", "gray", "sedan", "diesel", "used", "img1", "img2", "img3", true, true, false, new Date()));
    }

    @Test
    public void testUpdate() throws Exception {
        service.saveOrUpdate(new Car(104, 2015, 6200, 55222, 99999, "audi", "a4", "Auto", "gray", "sedan", "diesel", "was update", "img1", "img2", "img3", true, true, false, new Date()));
    }

    @Test
    public void testDelete() throws Exception {
        service.delete(102);
    }

    @Test
    public void testGetModelsForBrand(){
        service.getModelsForBrands();
    }
}