package kr.kh.finalproject.vo;

import lombok.Data;

@Data
public class AdvertisementVO {

	int ad_num;
	String ad_contents;
	String ad_image;
	String ad_date;
	
	int ad_st_num; // 매장 번호 - 는 브랜드/매장이름 등의 정보를 알기 어려움
	String ad_br_name; // 해당하는 광고의 브랜드이름 : store와 쪼인해서 st_br_name을 ad_br_name 으로 vo에 저장.
}
