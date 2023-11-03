package kr.kh.finalproject.vo;

import lombok.Data;

@Data
public class FileVO {
	private int im_num;
	private String im_name, im_ori_name;
	
	public FileVO(int im_num, String im_name, String im_ori_name) {
		this.im_num = im_num;
		this.im_name = im_name;
		this.im_ori_name = im_ori_name;
	}
	
	
	
}
