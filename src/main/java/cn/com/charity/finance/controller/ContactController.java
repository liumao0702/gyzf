package cn.com.charity.finance.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.lang.reflect.Method;
import java.util.HashMap;

@Controller
@RequestMapping(value="/contact")
public class ContactController {
    private static final Logger logger = Logger.getLogger(LoginController.class);

    @RequestMapping(value = "/addContact")
    public ModelAndView addContact(){
        logger.info("#### add contact");
        HashMap map = new HashMap();
        map.put("contact", "add");
        return new ModelAndView("/contact/addContact",map);
    }

    @RequestMapping(value = "/listContact")
    public ModelAndView listContact(){
        logger.info("#### list contact");
        HashMap map = new HashMap();
        map.put("contact", "list");
        return new ModelAndView("/contact/listContact",map);
    }
}
