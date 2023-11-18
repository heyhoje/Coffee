package kr.kh.finalproject.vo;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class GalleryVO {
	private int gal_num;
	private String gal_title;
	private String gal_me_user_id;
	private int gal_gc_num;
	private String gal_contents;
	private int gal_hits;
	
	private List<FileVO> fileVoList;
}
	
