package service.user;

import models.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

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

    public void saveOrUpdate(User user) {
        if (user.getId() > 0) {
            String sql = "UPDATE users SET login=?, email=?, password=? WHERE id=?";
            jdbcTemplate.update(sql, user.getName(), user.getEmail(),
                    user.getPassword(), user.getId());
        } else {
            String sql = "INSERT INTO users (login, email, password)"
                    + " VALUES (?, ?, ?)";
            jdbcTemplate.update(sql, user.getName(), user.getEmail(),
                    user.getPassword());
        }
    }

    public void delete(int userId) {
        jdbcTemplate.update("DELETE FROM users_has_cars WHERE users_id=" + userId);
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
        String sql = "SELECT * FROM users WHERE email=\"" + email + "\"";
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
        String sql = "INSERT INTO users_has_cars (users_id, cars_id) VALUES (?, ?)";
        jdbcTemplate.update(sql, userId, carId);
    }

    @Override
    public void delFromBasket(int userId, int carId) {
        String sql = "DELETE FROM users_has_cars WHERE users_id=? AND cars_id=?)";
        jdbcTemplate.update(sql, userId, carId);
    }

    @Override
    public void delAllFromBasket(int userId) {
        String sql = "DELETE FROM users_has_cars WHERE users_id=?)";
        jdbcTemplate.update(sql, userId);
    }

    @Override
    public int getTotalCost(int userId) {
        return 5200;// need getting summ of all goods in basket
    }

    private User getUserFromRs(ResultSet rs) throws SQLException,
            DataAccessException{
        User user = new User();

        user.setId(rs.getInt("id"));
        user.setName(rs.getString("login"));
        user.setEmail(rs.getString("email"));
        user.setPassword(rs.getString("password"));

        return user;
    }


}
