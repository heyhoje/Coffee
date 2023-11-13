package kr.kh.finalproject.vo;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class GalleryVO {
	int gal_num;
	String gal_title;
	String gal_me_user_id;
	int gal_gc_num;
}
