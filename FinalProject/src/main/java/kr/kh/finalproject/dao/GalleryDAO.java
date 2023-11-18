package kr.kh.finalproject.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.kh.finalproject.pagination.Criteria;
import kr.kh.finalproject.vo.FileVO;
import kr.kh.finalproject.vo.GalleryTypeVO;
import kr.kh.finalproject.vo.GalleryVO;

public interface GalleryDAO {

	List<GalleryVO> selectGalleryList(@Param("cri")Criteria cri);
	
	boolean insertGallery(@Param("gallery")GalleryVO gallery);
	
	void updateGalleryhits(@Param("gal_num")Integer gal_num);
	
	void insertFile(@Param("file")FileVO fileVo);
	
	GalleryVO selectGallery(@Param("gal_num")Integer gal_num);

	int selectGalleryCount(@Param("cri")Criteria cri);
	
	List<GalleryTypeVO> selectGalleryTypeList();

	boolean updateGallery(@Param("gallery")GalleryVO gallery);

	FileVO selectFile(@Param("fi_num")Integer num);

	void deleteFile(@Param("fi_num")Integer num);

	void deleteGallery(@Param("gal_num")Integer gal_num);

	

}
