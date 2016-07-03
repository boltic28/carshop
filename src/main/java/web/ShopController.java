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
import service.car.CarService;
import service.user.UserService;

import javax.validation.Valid;
import java.util.List;

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

    @RequestMapping(method = RequestMethod.GET)
    public String root(ModelMap model) {
        model.addAttribute("mess", "Welcom to SHOP!");
        model.addAttribute("topGoods", carService.getTopPosition());
        return "index";
    }

    @RequestMapping(method = RequestMethod.POST)
    public String login(ModelMap model,
                              @RequestParam(value = "login", required = false) String login,
                              @RequestParam(value = "password", required = false) String pass) {
        try {
            if (!login.isEmpty()) {
                User user = userService.getByEmail(login);
                if (user != null && pass.equals(user.getPassword())) {
                    loggedUser = user;
                    model.addAttribute("mess", "You are enter as " + user.getName());

                    return "index";
                }
                model.addAttribute("mess", "not valid data ");
            }
        }catch (Exception e){
            System.out.println("ugu");
        }

        return "index";
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String saveRegister(@Valid User user, BindingResult result, SessionStatus status, ModelMap model) {
        if (result.hasErrors()) {
            model.addAttribute("register", true);
            return "index";
        } else {
                userService.saveOrUpdate(user);
            loggedUser = user;
            return "index";        }
    }

    @RequestMapping(value = "/exit", method = RequestMethod.GET)
    public String exit(ModelMap model) {
        loggedUser = null;
        return "index";
    }

    @RequestMapping(value = "/cars", method = RequestMethod.GET)
    public String cars(ModelMap model) {
        model.addAttribute("isLogin", loggedUser == null ? "no" : "yes");
        model.addAttribute("mess", "Welcom to Auto!!!");
        model.addAttribute("carList", carService.getAll());
        return "cars";
    }

    @RequestMapping(value = "/cars/{carId}", method = RequestMethod.GET)
    public String cars(ModelMap model, @PathVariable("carId") int id) {
        Car currentCar = carService.getOne(id);
        carService.addView( id, currentCar.getView() + 1);
        model.addAttribute("isLogin", loggedUser == null ? "no" : "yes");
        model.addAttribute("mess", "Welcom to Auto!!!");
        model.addAttribute("curcar", currentCar );

        return "car";
    }

    @RequestMapping(value = "/cars/{carId}/addToBasket", method = RequestMethod.GET)
    public String addToBasket(ModelMap model, @PathVariable("carId") int id) {
        model.addAttribute("isLogin", loggedUser == null ? "no" : "yes");
        carService.addToBasket(id, loggedUser.getId());
        model.addAttribute("mess", "Car was added to your basket");
        model.addAttribute("curcar", carService.getOne(id));
        return "car";
    }

    @RequestMapping(value = "/basket", method = RequestMethod.GET)
    public String home(ModelMap model) {
        List total = carService.getAllForUser(loggedUser.getId());
        model.addAttribute("goodsList", total);
        model.addAttribute("total", userService.getTotalCost(loggedUser.getId()));
        model.addAttribute("totGoods", total.size());
        return "basket";
    }

    @RequestMapping(value = "/inbasket/{carId}/add", method = RequestMethod.GET)
    public String inBasket(ModelMap model, @PathVariable("carId") int id) {
        userService.addToBasket(loggedUser.getId(), id);
        return "cars/" + id;
    }

    @RequestMapping(value = "inbasket/${car.id}/del", method = RequestMethod.GET)
    public String delFromBasket(ModelMap model, @PathVariable("carId") int id) {
        userService.delFromBasket(loggedUser.getId(), id);
        return "basket";
    }

    @RequestMapping(value = "/basket/delall", method = RequestMethod.GET)
    public String delAllFromBasket(ModelMap model) {
        userService.delAllFromBasket(loggedUser.getId());
        return "basket";
    }
}
