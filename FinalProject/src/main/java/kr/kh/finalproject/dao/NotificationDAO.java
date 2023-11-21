package kr.kh.finalproject.dao;

import java.util.Collection;

import org.apache.ibatis.annotations.Param;

import kr.kh.finalproject.vo.Option_ChoiceVO;

public interface NotificationDAO {


	Option_ChoiceVO getOrderbyId(@Param("orderId")Long orderId);

	}

