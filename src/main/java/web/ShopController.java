package web;

import models.Car;
import models.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;
import service.car.CarService;
import service.user.UserService;

import javax.validation.Valid;
import java.util.List;
import java.util.stream.Collectors;

/**
 * Created by Siarhei Baltrukevich on 23.06.2016.
 */

@Controller
@RequestMapping("/")
public class ShopController {

    @Autowired
    private UserService userService;
    @Autowired
    private CarService carService;

    private User loggedUser;
    private boolean admin;


    @RequestMapping(method = RequestMethod.GET)
    public String root(ModelMap model) {
        model.addAttribute("mess", "Welcom to SHOP!");
        model.addAttribute("topGoods", carService.getTopPosition());
        model.addAttribute("isLogin", loggedUser == null ? "no" : "yes");
        if(loggedUser != null)
        {
            model.addAttribute("curuser", loggedUser);
        }
        return "index";
    }
//logging
    @RequestMapping(method = RequestMethod.POST)
    public String login(ModelMap model,
                              @RequestParam(value = "login", required = false) String login,
                              @RequestParam(value = "password", required = false) String pass) {
        try {
            if (!login.isEmpty()) {
                User user = userService.getByEmail(login);
                if (user != null && pass.equals(user.getPassword())) {
                    loggedUser = user;

                    model.addAttribute("topGoods", carService.getTopPosition());

                    model.addAttribute("isLogin", loggedUser == null ? "no" : "yes");
                    model.addAttribute("curuser", loggedUser);

                    return "index";
                }
                model.addAttribute("mess", "not valid data ");
            }
        }catch (Exception e){
            System.out.println("ugu");
        }
        model.addAttribute("isLogin", loggedUser == null ? "no" : "yes");
        model.addAttribute("topGoods", carService.getTopPosition());
        return "index";
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String saveRegister(@Valid User user, BindingResult result, SessionStatus status, ModelMap model) {
        if (result.hasErrors()) {
            model.addAttribute("register", true);
            return "index";
        } else {
            userService.saveOrUpdate(user);

            model.addAttribute("isLogin", loggedUser == null ? "no" : "yes");
            model.addAttribute("curuser", loggedUser);
            model.addAttribute("topGoods", carService.getTopPosition());
            model.addAttribute("curuser", loggedUser);

            return "index";        }
    }

    @RequestMapping(value = "/exit", method = RequestMethod.GET)
    public String exit(ModelMap model) {
        loggedUser = null;
        model.addAttribute("isLogin", "no");
        model.addAttribute("topGoods", carService.getTopPosition());
        return "index";
    }

//from cars work
    @RequestMapping(value = "/cars", method = RequestMethod.GET)
    public String cars(ModelMap model) {

        model.addAttribute("isLogin", loggedUser == null ? "no" : "yes");
        model.addAttribute("curuser", loggedUser);

        model.addAttribute("carList", carService.getAll());
        model.addAttribute("models", carService.getModelsForBrands());
        model.addAttribute("brands", carService.getBrands());

        return "cars";
    }

    @RequestMapping(value = "/cars", method = RequestMethod.POST)
    public String filter(ModelMap model,
                         @RequestParam(value = "cbrand", required = false) String brand,
                         @RequestParam(value = "color", required = false) String color,
                         @RequestParam(value = "engine", required = false) String engine,
                         @RequestParam(value = "agregate", required = false) String agregate,
                         @RequestParam(value = "frame", required = false) String frame,
                         @RequestParam(value = "odo", required = false) Integer odo,
                         @RequestParam(value = "year", required = false) Integer year,
                         @RequestParam(value = "price", required = false) Integer price) {

        model.addAttribute("isLogin", loggedUser == null ? "no" : "yes");
        model.addAttribute("curuser", loggedUser);

        model.addAttribute("carList", carService.getAll().stream()
                .filter(car -> !brand.equals("all") ? car.getBrand().equals(brand) : !car.getBrand().equals("null"))
                .filter(car -> !frame.equals("all") ? car.getFrame().equals(frame) : !car.getBrand().equals("null"))
                .filter(car -> !engine.equals("all") ? car.getEngine().equals(engine) : !car.getBrand().equals("null"))
                .filter(car -> !color.equals("all") ? car.getColor().equals(color) : !car.getBrand().equals("null"))
                .filter(car -> !agregate.equals("all") ? car.getAgregate().equals(agregate) : !car.getBrand().equals("null"))
                .filter(car -> odo != 0 ? car.getOdo() <= odo : !car.getBrand().equals("null"))
                .filter(car -> year != 0 ? car.getYear() >= year : !car.getBrand().equals("null"))
                .filter(car -> price != 0 ? car.getPrice() <= price : !car.getBrand().equals("null"))
                .collect(Collectors.toList())
        );
        model.addAttribute("models", carService.getModelsForBrands());
        model.addAttribute("brands", carService.getBrands());
        model.addAttribute("color", color);

        return "cars";
    }

    @RequestMapping(value = "/cars/{carId}", method = RequestMethod.GET)
    public String cars(ModelMap model, @PathVariable("carId") int id) {
        Car currentCar = carService.getOne(id);
        carService.addView( id, currentCar.getView() + 1);
        model.addAttribute("isLogin", loggedUser == null ? "no" : "yes");
        model.addAttribute("curuser", loggedUser);
        model.addAttribute("curcar", currentCar );

        return "car";
    }

//from basket work
    @RequestMapping(value = "/basket", method = RequestMethod.GET)
    public String home(ModelMap model) {
        model.addAttribute("isLogin", loggedUser == null ? "no" : "yes");
        model.addAttribute("curuser", loggedUser);

        List total = carService.getAllForUser(loggedUser.getId());
        model.addAttribute("goodsList", total);
        model.addAttribute("total", userService.getTotalCost(loggedUser.getId()));
        model.addAttribute("totGoods", total.size());
        return "basket";
    }

    @RequestMapping(value = "/inbasket/{carId}/add", method = RequestMethod.GET)
    public String addToBasket(ModelMap model, @PathVariable("carId") int id) {
        model.addAttribute("isLogin", loggedUser == null ? "no" : "yes");
        model.addAttribute("curuser", loggedUser);

        model.addAttribute("curcar", carService.getOne(id));

        carService.addToBasket(id, loggedUser.getId());

        return "car";
    }

    @RequestMapping(value = "/inbasket/{carId}/addFromCars", method = RequestMethod.GET)
    public String addToBasketFromCars(ModelMap model, @PathVariable("carId") int id) {
        model.addAttribute("isLogin", loggedUser == null ? "no" : "yes");
        model.addAttribute("curuser", loggedUser);

        model.addAttribute("carList", carService.getAll());
        model.addAttribute("models", carService.getModelsForBrands());
        model.addAttribute("brands", carService.getBrands());
        carService.addToBasket(id, loggedUser.getId());
        return "cars";
    }

    @RequestMapping(value = "/inbasket/{carId}/del", method = RequestMethod.GET)
    public String delFromBasket(ModelMap model, @PathVariable("carId") int id) {
        userService.delFromBasket(loggedUser.getId(), id);
        model.addAttribute("isLogin", loggedUser == null ? "no" : "yes");
        model.addAttribute("curuser", loggedUser);

        List total = carService.getAllForUser(loggedUser.getId());
        model.addAttribute("goodsList", total);
        model.addAttribute("total", userService.getTotalCost(loggedUser.getId()));
        model.addAttribute("totGoods", total.size());

        return "basket";
    }

    @RequestMapping(value = "/basket/delall", method = RequestMethod.GET)
    public String delAllFromBasket(ModelMap model) {
        userService.delAllFromBasket(loggedUser.getId());
        model.addAttribute("isLogin", loggedUser == null ? "no" : "yes");
        model.addAttribute("curuser", loggedUser);

        List total = carService.getAllForUser(loggedUser.getId());
        model.addAttribute("goodsList", total);
        model.addAttribute("total", userService.getTotalCost(loggedUser.getId()));
        model.addAttribute("totGoods", total.size());
        return "basket";
    }

    @RequestMapping(value = "/admin", method = RequestMethod.GET)
    public String adminLog(ModelMap model) {
        if(admin){
            return "admin/adminUser";
        }
        return "admin/adminLog";
    }
// admin for users
    @RequestMapping(value = "/admin", method = RequestMethod.POST)
    public String admin(ModelMap model,
                        @RequestParam(value = "login", required = false) String login,
                        @RequestParam(value = "password", required = false) String pass) {

        try {
            if (!login.isEmpty()) {
                User user = userService.getByEmail(login);
                if (user != null && pass.equals(user.getPassword()) && user.getPassword().contains("Admin")) {
                    loggedUser = user;

                    admin = true;
                    model.addAttribute("adminHere", true);

                    model.addAttribute("isLogin", "yes");
                    model.addAttribute("curuser", loggedUser);

                    model.addAttribute("userList", userService.getAll());

                    return "admin/adminUser";
                }
            }
        }catch (Exception e){
            System.out.println("ugu");
        }

        return "admin/adminLog";
    }

    @RequestMapping(value = "/admin/user", method = RequestMethod.GET)
    public String adminUsers(ModelMap model) {
        model.addAttribute("userList", userService.getAll());
        if(admin){
            return "admin/adminUser";
        }
        return "admin/adminLog";
    }

    @RequestMapping(value = "/register/admin", method = RequestMethod.POST)
    public String saveRegisterFromAdmin(@Valid User user, BindingResult result, SessionStatus status, ModelMap model) {
        if (result.hasErrors()) {
            model.addAttribute("register", true);
            return "admin/adminUser";
        } else {
            userService.saveOrUpdate(user);
            model.addAttribute("userList", userService.getAll());
            return "admin/adminUser";
        }
    }

    @RequestMapping(value = "/admin/user/{userId}/del", method = RequestMethod.GET)
    public String adminUserDel(ModelMap model, @PathVariable("userId") int id) {
        userService.delete(id);
        model.addAttribute("userList", userService.getAll());
        if(admin){
            return "admin/adminUser";
        }
        return "admin/adminLog";
    }

    // admin for cars
    @RequestMapping(value = "/admin/car", method = RequestMethod.GET)
    public String adminCars(ModelMap model) {
        model.addAttribute("carList", carService.getAll());
        if(admin){
            return "admin/adminCar";
        }
        return "admin/adminLog";
    }

    @RequestMapping(value = "/admin/car/{carId}/del", method = RequestMethod.GET)
    public String adminCarDel(ModelMap model, @PathVariable("carId") int id) {
        carService.delete(id);
        model.addAttribute("carList", carService.getAll());
        if(admin){
            return "admin/adminCar";
        }
        return "admin/adminLog";
    }

    @RequestMapping(value = "/admin/car/add", method = RequestMethod.POST)
    public String adminCarDel(@Valid Car car, BindingResult result, SessionStatus status, ModelMap model) {
        carService.saveOrUpdate(car);
        model.addAttribute("carList", carService.getAll());
        if(admin){
            return "admin/adminCar";
        }
        return "admin/adminLog";
    }

    // admin for motos
    @RequestMapping(value = "/admin/moto", method = RequestMethod.GET)
    public String adminMotos(ModelMap model) {
        if(admin){
            return "admin/adminMoto";
        }
        return "admin/adminLog";

    }

    @RequestMapping(value = "/admin/out", method = RequestMethod.GET)
    public String adminOut(ModelMap model) {
        admin = false;

        return "redirect:/";
    }
}
