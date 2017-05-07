package cn.com.charity.finance.service.impl;

import java.util.HashSet;
import java.util.Set;
import cn.com.charity.finance.dao.UserDao;
import cn.com.charity.finance.entity.AcctAuthority;
import cn.com.charity.finance.entity.AcctRole;
import cn.com.charity.finance.entity.AcctUser;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
/**
 * 描述： 实现SpringSecurity的UserDetails接口 自定义认证
 * 可以通过手机号或者是邮箱进行认证
 */

public class UserDetailsServiceImpl implements UserDetailsService {

    private static final Logger LOGGER = Logger
            .getLogger(UserDetailsServiceImpl.class);

    // 注入查询User的dao层
    @Autowired
    private UserDao userDao;

    @Override
    public UserDetails loadUserByUsername(String username)
            throws UsernameNotFoundException {
        LOGGER.info("认证用户：" + username);
        // 查询数据库获取该用户的信息
        AcctUser acctUser = userDao.findUserByNickname(username);
        if (null == acctUser) {
            throw new UsernameNotFoundException("用户：" + username + "不存在");
        }
        Set<GrantedAuthority> authorities = getAuthorities(acctUser);
        // 将没有使用到的属性设置为true
        UserDetails userDetails = new User(acctUser.getNickName(),
                acctUser.getNickPassword(), true, true, true, true, authorities);
        return userDetails;
    }

    // 获得用户所有角色的权限
    private Set<GrantedAuthority> getAuthorities(AcctUser acctUser) {
        Set<GrantedAuthority> authoritySet = new HashSet<GrantedAuthority>();
        // 默认所有的用户有"浏览用户"的权利
        authoritySet.add(new SimpleGrantedAuthority("ROLE_USER"));
        // 依次添加
        if (null != acctUser.getAcctRoles()
                && acctUser.getAcctRoles().size() > 0)
            for (AcctRole role : acctUser.getAcctRoles()) {
                if (null != role.getAcctAuthorities()
                        && role.getAcctAuthorities().size() > 0)
                    for (AcctAuthority authority : role.getAcctAuthorities()) {
                        authoritySet.add(new SimpleGrantedAuthority(authority
                                .getName()));
                    }
            }
        LOGGER.info("authoritySet.size()：" + authoritySet.size());
        return authoritySet;
    }
}
