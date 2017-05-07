package cn.com.charity.finance.controller;

import cn.com.charity.finance.entity.AcctUser;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping(value="/login")
public class LoginController {

    private static final Logger logger = Logger.getLogger(LoginController.class);

    @RequestMapping(value="/login")
    public String login(@ModelAttribute("acctUser") AcctUser acctUser,
                        @RequestParam(required=false) Boolean logout,
                        Errors errors) {
        logger.info("login");
        if (null != logout) {
            errors.reject("msg", "已经完全退出");
        }
        return "/login/login";
    }

}
