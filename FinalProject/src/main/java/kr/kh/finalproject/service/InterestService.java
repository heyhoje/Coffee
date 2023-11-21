package kr.kh.finalproject.service;

import java.util.List;

public interface InterestService {

	void updateMemberInterests(String me_user_id, List<String> interestsList) throws Exception;

	void deleteMemberInterests(String me_user_id)throws Exception;

}
