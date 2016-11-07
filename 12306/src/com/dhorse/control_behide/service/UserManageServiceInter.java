package com.dhorse.control_behide.service;

import java.util.List;

import com.dhorse.control_behide.vo.UserVO;

public interface UserManageServiceInter {

	int getRecords();

	void userList(List<UserVO> userList, int nowPage, int pageRecords);

	void deleteUser(int id);

	UserVO getUserInfo(int userId);

}
