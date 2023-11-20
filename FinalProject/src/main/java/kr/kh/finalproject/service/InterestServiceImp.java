package kr.kh.finalproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kh.finalproject.dao.InterestDAO;

@Service
public class InterestServiceImp implements InterestService{

	@Autowired
	InterestDAO interestDao;
	
	@Override
	public void updateMemberInterests(String me_user_id, List<String> interestsList) throws Exception {
		interestDao.updateMemberInterests(me_user_id, interestsList);
		
	}

	@Override
	public void deleteMemberInterests(String me_user_id) throws Exception {
		interestDao.deleteMemberInterests(me_user_id);
		
	}

}
