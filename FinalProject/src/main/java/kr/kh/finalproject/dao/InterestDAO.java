package kr.kh.finalproject.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface InterestDAO {

	void updateMemberInterests(@Param("me_user_id") String me_user_id, @Param("interestsList") List<String> interestsList) throws Exception;

	void deleteMemberInterests(String me_user_id) throws Exception;

	List<String> getMemberInterests(String me_user_id)throws Exception;

}
