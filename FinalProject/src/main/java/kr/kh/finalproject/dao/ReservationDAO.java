package kr.kh.finalproject.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.kh.finalproject.pagination.Criteria;
import kr.kh.finalproject.vo.ReservationVO;

public interface ReservationDAO {

	List<ReservationVO> selectReservationList(@Param("cri")Criteria cri);

	void save(ReservationVO reservation);

}
