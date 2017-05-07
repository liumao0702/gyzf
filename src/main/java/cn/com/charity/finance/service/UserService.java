package cn.com.charity.finance.service;

import cn.com.charity.finance.entity.AcctUser;

import java.util.List;

/**
 * 创建时间：2015-2-6 下午3:18:57
 *
 * @author andy
 * @version 2.2
 *  userService接口
 */

public interface UserService {
    AcctUser load(String id);

    AcctUser get(String id);

    List<AcctUser> findAll();

    void persist(AcctUser entity);

    String save(AcctUser entity);

    void saveOrUpdate(AcctUser entity);

    void delete(String id);

    void flush();

    AcctUser findUserByNickname(String nickName);
}
