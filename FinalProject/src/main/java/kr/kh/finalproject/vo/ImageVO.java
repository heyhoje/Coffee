package kr.kh.finalproject.vo;

import lombok.AllArgsConstructor;
import lombok.Data;

@AllArgsConstructor
@Data
public class ImageVO {

	private int im_num;
	private String im_name;
	private String im_ori_name;
	private String im_contents;
	
	// 데이터가 사용되는 테이블관련 변수
	private String im_tableName;
	private int im_tableNum;
	
	// 첨부파일
	public ImageVO(String im_name, String im_ori_name, String im_tableName, int im_tableNum) {
	
		this.im_name = im_name;
		this.im_ori_name = im_ori_name;
		this.im_tableName = im_tableName;
		this.im_tableNum = im_tableNum;
	}
}