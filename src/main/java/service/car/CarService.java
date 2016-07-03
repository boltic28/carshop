package service.car;

import models.Car;

import java.util.List;

/**
 * Created by Siarhei Baltrukevich on 26.06.2016.
 */
public interface CarService {
    List<Car> getAll();
    List<Car> getAllForUser(int userId);
    List<Car> getTopPosition();

    Car getOne(int id);
    void saveOrUpdate(Car car);
    void delete(int id);
    void addToBasket(int carId, int userId);
    void addView(int carId, int view);


}
