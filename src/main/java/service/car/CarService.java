package service.car;

import models.Car;

import java.util.List;
import java.util.Map;

/**
 * Created by Siarhei Baltrukevich on 26.06.2016.
 */
public interface CarService {
    List<Car> getAll();
    List<Car> getAllForUser(int userId);
    Integer getTotalCostForUser(int userId);
    List<Car> getTopPosition();
    List<Car> getLastAddedPosition();


    Car getOne(int id);
    void saveOrUpdate(Car car);
    void delete(int id);
    void addToBasket(int carId, int userId);
    void addView(int carId, int view);

    Map<String, List<String>> getModelsForBrands();
    List<String> getBrands();


}
