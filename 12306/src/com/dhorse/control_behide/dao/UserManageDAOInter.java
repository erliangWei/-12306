package com.dhorse.control_behide.dao;

import java.util.List;

import com.dhorse.control_behide.po.UserPO;

public interface UserManageDAOInter {

	int getCount();

	public List<UserPO> selectUserAll(int nowPage, int pageRecords);

	void deleteUser(int id);

	UserPO selectUserInfo(int userId);

}
