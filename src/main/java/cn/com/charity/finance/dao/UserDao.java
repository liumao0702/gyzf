package cn.com.charity.finance.dao;

import cn.com.charity.finance.entity.AcctUser;

/**
 * 创建时间：2015-2-6 下午2:43:50
 *
 * @author andy
 * @version 2.2
 *
 * 用户Dao接口
 */

public interface UserDao extends GenericDao<AcctUser, String> {
    AcctUser findUserByNickname(String username);

}

