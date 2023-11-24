package kr.kh.finalproject.vo;

import java.util.List;

import lombok.Data;

@Data
public class OptionVO {
	private int os_num;
	private String os_name;
	private int os_mn_num;
	private int os_optionNum;
	
	private List<Option_ValueVO> optionValueList;
	

}


