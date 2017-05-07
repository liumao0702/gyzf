package cn.com.charity.finance.controller;

import java.util.Date;
import java.util.List;
import java.util.UUID;

import cn.com.charity.finance.entity.AcctUser;
import cn.com.charity.finance.service.UserService;
import cn.com.charity.finance.utils.MD5Tool;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

/**
 * 用户Controller
 */
@Controller
@RequestMapping("/user")
public class UserController {

    private static final Logger LOGGER = Logger.getLogger(UserController.class);

    @Autowired
    private UserService userService;

    @RequestMapping("/showInfo/{userId}")
    public String showUserInfo(ModelMap modelMap, @PathVariable String userId){
        LOGGER.info("查询用户：" + userId);
        AcctUser userInfo = userService.load(userId);
        modelMap.addAttribute("userInfo", userInfo);
        return "/user/showInfo";
    }

    @RequestMapping("/showInfos")
    public @ResponseBody List<AcctUser> showUserInfos(){
        LOGGER.info("查询用户全部用户");
        List<AcctUser> userInfos = userService.findAll();
        return userInfos;
    }

    @RequestMapping("/userJudge")
    public @ResponseBody AcctUser userJudge(String nickName){
        LOGGER.info("判断用户是否已经存在");
        AcctUser user = userService.findUserByNickname(nickName);
        return user;
    }



    @RequestMapping("/main")
    public String main(ModelMap modelMap){
        LOGGER.info("显示主页面MAIN");
        //后台获取security保存的session中的用户信息
        //获取security的上下文
        SecurityContext securityContext = SecurityContextHolder.getContext();
        //获取认证对象
        Authentication authentication = securityContext.getAuthentication();
        //在认证对象中获取主体对象
        Object principal = authentication.getPrincipal();
        String username = "";
        if(principal instanceof UserDetails){
            username = ((UserDetails) principal).getUsername();
        }else {
            username = principal.toString();
        }
        modelMap.addAttribute("username", username);
        return "/user/main";
    }

    @RequestMapping("/save")
    public String save(ModelMap modelMap){
        LOGGER.info("保存");
        modelMap.addAttribute("msg", "save");
        return "/user/option";
    }

    @InitBinder
    public void initialiseBinder(WebDataBinder binder) {
        binder.setAllowedFields("nickName","telephone","email","nickPassword","orgName","desc");
    }

    @RequestMapping("/register")
    public String register(@ModelAttribute("acctUser") AcctUser acctUser,ModelMap modelMap){
        String id = UUID.randomUUID().toString();
        acctUser.setId(id);
//        acctUser.getNickPassword()
        String md5Passwd = MD5Tool.getMd5(acctUser.getNickPassword());
        acctUser.setNickPassword(md5Passwd);
        acctUser.setRegisterTime(new Date());
        userService.save(acctUser);
        LOGGER.info("保存");
//        userService.save((AcctUser)modelMap);
        modelMap.addAttribute("msg", "save");
        return "redirect:/login/login.htmls";
    }

    @RequestMapping("/update")
    public String update(ModelMap modelMap){
        LOGGER.info("修改");
        modelMap.addAttribute("msg", "update");
        return "/user/option";
    }

    @RequestMapping("/delete")
    public String delete(ModelMap modelMap){
        LOGGER.info("删除");
        modelMap.addAttribute("msg", "delete");
        return "/user/option";
    }
}
