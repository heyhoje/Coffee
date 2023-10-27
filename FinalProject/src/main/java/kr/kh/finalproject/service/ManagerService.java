package kr.kh.finalproject.service;

import kr.kh.finalproject.vo.ManagerVO;

public interface ManagerService {

	boolean managerRegister(ManagerVO manager);

	boolean manageridCheck(String id);

}
