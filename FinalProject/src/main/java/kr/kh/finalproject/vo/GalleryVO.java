package kr.kh.finalproject.vo;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class GalleryVO {
	int gal_num;
	String gal_title;
	String gal_me_user_id;
	int gal_gc_num;
	
	private List<FileVO> fileVoList;
	
	
}
	
