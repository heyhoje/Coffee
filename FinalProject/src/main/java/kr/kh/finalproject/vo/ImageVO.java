package kr.kh.finalproject.vo;

import lombok.Data;

@Data
public class ImageVO {

	int im_num;
	String im_name;
	String im_ori_name;
	String im_contents;
	
	// 데이터가 사용되는 테이블관련 변수
	String im_tableName;
	int im_tableNum;
	
	// 첨부파일
	public ImageVO(String im_name, String im_ori_name, String im_tableName, int im_tableNum) {
		this.im_name = im_name;
		this.im_ori_name = im_ori_name;
		this.im_tableName = im_tableName;
		this.im_tableNum = im_tableNum;
		
	}
}