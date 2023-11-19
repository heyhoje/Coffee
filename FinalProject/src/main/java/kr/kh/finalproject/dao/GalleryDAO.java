package kr.kh.finalproject.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import kr.kh.finalproject.pagination.Criteria;
import kr.kh.finalproject.vo.FileVO;
import kr.kh.finalproject.vo.GalleryTypeVO;
import kr.kh.finalproject.vo.GalleryVO;

public interface GalleryDAO {

	List<GalleryVO> selectGalleryList(@Param("cri")Criteria cri);

	int selectGalleryCount(@Param("cri")Criteria cri);

	List<GalleryTypeVO> selectGalleryTypeList();

	boolean insertGallery(@Param("gallery")GalleryVO gallery);

	void insertFile(@Param("file")FileVO fileVo);
	


}
