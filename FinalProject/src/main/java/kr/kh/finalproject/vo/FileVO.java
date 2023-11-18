package kr.kh.finalproject.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class FileVO {
	private int fi_num , fi_gal_num; 
	private String fi_name, fi_ori_name;
	
	public FileVO(int fi_gal_num, String fi_name, String fi_ori_name) {
		this.fi_gal_num = fi_gal_num;
		this.fi_name = fi_name;
		this.fi_ori_name = fi_ori_name;
	}
	
	public FileVO(String fi_name, String fi_ori_name, int fi_gal_num) {
		this.fi_name = fi_name;
		this.fi_ori_name = fi_ori_name;
		this.fi_gal_num = fi_gal_num;
	}
}