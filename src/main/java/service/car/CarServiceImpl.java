package service.car;

import models.Car;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * Created by Siarhei Baltrukevich on 26.06.2016.
 */
@Service
public class CarServiceImpl implements CarService {

    @Autowired
    private JdbcTemplate jdbcTemplate;


    @Override
    public List<Car> getAll() {
        String sql = "SELECT * FROM cars";
        return jdbcTemplate.query(sql, new RowMapper<Car>() {

            @Override
            public Car mapRow(ResultSet rs, int rowNum) throws SQLException {
                return getCarFromRs(rs);
            }

        });
    }

    @Override
    public void addToBasket(int carId, int userId) {
        String sql = "INSERT INTO user_has_cars (user_id, car_id) VALUE (?, ?)";
        jdbcTemplate.update(sql, userId, carId);
    }

    @Override
    public List<Car> getAllForUser(int userId) {
        String sqlForUser = "SELECT * FROM user_has_cars WHERE user_id=" + userId;
        try{
            List<Integer> listOfCarsId = jdbcTemplate.query(sqlForUser, new RowMapper<Integer>() {
                @Override
                public Integer mapRow(ResultSet rs, int rowNum) throws SQLException {
                    return rs.getInt("car_id");
                }
            });

            return listOfCarsId.stream()
                    .map(this::getOne)
                    .collect(Collectors.toList());
        }catch (Exception e){
            return null;
        }
    }

    @Override
    public List<Car> getTopPosition() {
        return getAll().stream()
                .sorted((c1, c2) -> Integer.compare(c2.getView(), c1.getView()) )
                .limit(3)
                .collect(Collectors.toList());
    }

    @Override
    public Car getOne(int carId) {
        String sql = "SELECT * FROM cars WHERE id=" + carId;
        return jdbcTemplate.query(sql, new ResultSetExtractor<Car>() {

            @Override
            public Car extractData(ResultSet rs) throws SQLException,
                    DataAccessException {
                if (rs.next()) {
                    return getCarFromRs(rs);
                }

                return null;
            }

        });
    }

    @Override
    public void saveOrUpdate(Car car) {
        if (car.getId() > 0) {
            String sql = "UPDATE cars SET brand=?, model=?, transmition=?, color=?, engine=?, frame=?, agregate=?, "
                    + "year=?, price=?, odo=?, view=?, skin=?, aircondition=?, castdisk=?, img1=?, img2=?, img3=?    WHERE id=?";
            jdbcTemplate.update(sql, car.getBrand(), car.getModel(), car.getTransmition(), car.getColor(), car.getEngine(),  car.getFrame(),
                    car.getAgregate(), car.getYear(), car.getPrice(), car.getOdo(), car.getView(), car.hasSkin(),
                    car.hasConditioner(), car.hasCastDisk(), car.getImg1(), car.getImg2(), car.getImg3(), car.getId() );
        } else {
            String sql = "INSERT INTO cars (brand, model, transmition, color, engine, frame, agregate, year, price, odo, " +
                    "view, skin, aircondition, castdisk, img1, img2, img3)"
                    + " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            jdbcTemplate.update(sql, car.getBrand(), car.getModel(), car.getTransmition(), car.getColor(), car.getEngine(),  car.getFrame(),
                    car.getAgregate(), car.getYear(), car.getPrice(), car.getOdo(), car.getView(), car.hasSkin(),
                    car.hasConditioner(), car.hasCastDisk(), car.getImg1(), car.getImg2(), car.getImg3());
        }
    }

    @Override
    public void addView(int carId, int view) {
        String sql = "UPDATE cars SET  view=? WHERE id=?";
        jdbcTemplate.update(sql, view, carId);
    }

    @Override
    public void delete(int carId) {
        jdbcTemplate.update("DELETE FROM user_has_cars WHERE car_id=" + carId);
        jdbcTemplate.update("DELETE FROM cars WHERE id=" + carId);
    }

    @Override
    public Map<String, List<String>> getModelsForBrands() {
        return getAll().stream()
                .collect(Collectors.groupingBy(Car::getBrand, Collectors.mapping(Car::getModel, Collectors.toList())));
    }

    @Override
    public List<String> getBrands() {
        String sqlForUser = "SELECT DISTINCT brand FROM cars";

        return jdbcTemplate.query(sqlForUser, new RowMapper<String>() {
            @Override
            public String mapRow(ResultSet rs, int rowNum) throws SQLException {
                return rs.getString("brand");
            }
        }).stream().sorted(String::compareTo).collect(Collectors.toList());
    }

    private Car getCarFromRs(ResultSet rs) throws SQLException,
            DataAccessException {
        Car car = new Car();

        car.setId(rs.getInt("id"));
        car.setYear(rs.getInt("year"));
        car.setPrice(rs.getInt("price"));
        car.setOdo(rs.getInt("odo"));
        car.setView(rs.getInt("view"));

        car.setBrand(rs.getString("brand"));
        car.setModel(rs.getString("model"));
        car.setTransmition(rs.getString("transmition"));
        car.setFrame(rs.getString("frame"));
        car.setEngine(rs.getString("engine"));
        car.setColor(rs.getString("color"));
        car.setAgregate(rs.getString("agregate"));

        car.setImg1(rs.getString("img1"));
        car.setImg2(rs.getString("img2"));
        car.setImg3(rs.getString("img3"));

        car.setAdded(rs.getDate("added"));

        car.setConditioner(rs.getBoolean("aircondition"));
        car.setSkin(rs.getBoolean("skin"));
        car.setCastDisk(rs.getBoolean("castdisk"));


        return car;
    }
}
