package kr.kh.finalproject.vo;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class ShopVO {
	private String bm_id;
	private String bm_pw;
	private String bm_phone;
	private String bm_contents;
	private String bm_address;
	private Double bm_geocoding_lati;
	private Double bm_geocoding_longi;
	private String bm_num;
	private String bm_store_name;
	private String bm_image;
	private String bm_manager;
}
