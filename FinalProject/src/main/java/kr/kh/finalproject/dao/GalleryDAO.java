package kr.kh.finalproject.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.kh.finalproject.pagination.Criteria;
import kr.kh.finalproject.vo.FileVO;
import kr.kh.finalproject.vo.GalleryVO;

public interface GalleryDAO {

	List<GalleryVO> selectGalleryList(Criteria cri);

	int selectCountGalleryList(Criteria cri);

	boolean insertCoffeeBoard(@Param("gallery")GalleryVO gallery);

	void insertFile(FileVO fileVo);


}
