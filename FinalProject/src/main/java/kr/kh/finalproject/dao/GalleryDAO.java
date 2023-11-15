package kr.kh.finalproject.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.kh.finalproject.pagination.Criteria;
import kr.kh.finalproject.vo.GalleryTypeVO;
import kr.kh.finalproject.vo.GalleryVO;

public interface GalleryDAO {

	List<GalleryVO> selectGalleryList(@Param("cri")Criteria cri);

	List<GalleryTypeVO> selectGalleryTypeList();

	int selectGalleryCount(Criteria cri);



}
