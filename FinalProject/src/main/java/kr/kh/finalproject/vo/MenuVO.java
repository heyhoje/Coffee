package kr.kh.finalproject.vo;

import lombok.Data;

@Data
public class MenuVO {


	private int mn_num;
    private String mn_name;
    private String mn_contents;
    private int mn_price;
    private int mn_st_num;
    private int mn_mc_num;
    private int mn_quantity;
    
    // 테이블끼리 연결하지 않고 이미지테이블의 사진파일을 쓰기 위해
    // Mapper에서 ResultMap하고 vo에 해당 VO 추가! 삭제 금지!
    ImageVO image;

    private String mn_image;

    
}
