package service.user;

import models.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;
import service.car.CarServiceImpl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

/**
 * Created by Siarhei Baltrukevich on 23.06.2016.
 */
@Component
public class UserServiceImpl implements UserService {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Autowired
    private CarServiceImpl carService;

    public void saveOrUpdate(User user) {
        if (user.getId() > 0) {
            String sql = "UPDATE users SET login=?, email=?, password=?, role=? WHERE id=?";
            jdbcTemplate.update(sql, user.getName(), user.getEmail(),
                    user.getPassword(), user.getRole(), user.getId());
        } else {
            String sql = "INSERT INTO users (login, email, password, role)"
                    + " VALUES (?, ?, ?, ?)";
            jdbcTemplate.update(sql, user.getName(), user.getEmail(),
                    user.getPassword(), user.getRole());
        }
    }

    public void delete(int userId) {
        jdbcTemplate.update("DELETE FROM user_has_cars WHERE user_id=" + userId);
        jdbcTemplate.update("DELETE FROM users WHERE id=" + userId);
    }

    public User get(int userId) {
        String sql = "SELECT * FROM users WHERE id=" + userId;

        return jdbcTemplate.query(sql, new ResultSetExtractor<User>() {

            @Override
            public User extractData(ResultSet rs) throws SQLException,
                    DataAccessException {
                if (rs.next()) {
                    return getUserFromRs(rs);
                }

                return null;
            }

        });
    }

    public User getByEmail(String email) {
        String sql = "SELECT * FROM users WHERE email='" + email + "'";
        return jdbcTemplate.query(sql, new ResultSetExtractor<User>() {

            @Override
            public User extractData(ResultSet rs) throws SQLException,
                    DataAccessException {
                if (rs.next()) {
                    return getUserFromRs(rs);
                }

                return null;
            }

        });
    }

    public User getByName(String name) {
        try {
            String sql = "SELECT * FROM users WHERE login='" + name + "'";
            return jdbcTemplate.query(sql, new ResultSetExtractor<User>() {

                @Override
                public User extractData(ResultSet rs) throws SQLException,
                        DataAccessException {
                    if (rs.next()) {
                        return getUserFromRs(rs);
                    }

                    return null;
                }

            });
        }catch (Exception e){
            return null;
        }
    }

    public List<User> getAll() {
        String sql = "SELECT * FROM users";

        return jdbcTemplate.query(sql, new RowMapper<User>() {

            @Override
            public User mapRow(ResultSet rs, int rowNum) throws SQLException {
                return getUserFromRs(rs);
            }

        });
    }

    @Override
    public void addToBasket(int userId, int carId) {
        String sql = "INSERT INTO user_has_cars (user_id, car_id) VALUES (?, ?)";
        jdbcTemplate.update(sql, userId, carId);
    }

    @Override
    public void delFromBasket(int userId, int carId) {
        String sql = "DELETE FROM user_has_cars WHERE user_id=? AND car_id=?";
        jdbcTemplate.update(sql, userId, carId);
    }

    @Override
    public void delAllFromBasket(int userId) {
        String sql = "DELETE FROM user_has_cars WHERE user_id=?";
        jdbcTemplate.update(sql, userId);
    }

    // need to change when add new category of good
    @Override
    public int getTotalCostForUsersGoods(int userId) {
        return carService.getTotalCostForUser(userId);
    }

    // need to change when add new category of good
    @Override
    public int getTotalCountForUsersGoods(int userId) {
        return (int) carService.getAllForUser(userId).stream().count();
    }

    private User getUserFromRs(ResultSet rs) throws SQLException,
            DataAccessException{
        User user = new User();

        user.setId(rs.getInt("id"));
        user.setName(rs.getString("login"));
        user.setEmail(rs.getString("email"));
        user.setPassword(rs.getString("password"));
        user.setRole(rs.getString("role"));
        user.setRegistered(rs.getDate("registered"));

        return user;
    }


}
