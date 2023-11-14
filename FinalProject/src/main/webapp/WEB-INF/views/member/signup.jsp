<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
html,body,div,span,object,iframe,h1,h2,h3,h4,h5,h6,p,blockquote,pre,abbr,address,cite,code,del,dfn,em,img,ins,kbd,q,samp,small,strong,sub,sup,var,b,i,dl,dt,dd,ol,ul,li,fieldset,form,label,legend,table,caption,tbody,tfoot,thead,tr,th,td,article,aside,canvas,details,figcaption,figure,footer,header,hgroup,menu,nav,section,summary,time,mark,audio,video {
    margin: 0;
    padding: 0;
    border: 0;
    font-size: 100%;
    vertical-align: baseline;
    background: transparent;
}
#container { width:100%; }
.find_mem_wrap { max-width:570px; margin:0 auto; padding:70px 0 50px; }
.find_mem_inner{bottom:0; top:auto !important}
.find_mem_ttl { display:block; font-size:30px; font-weight:normal; margin-bottom:30px; text-align:center; }
.hid {
    position: absolute;
    left: -9999px;
    font-size: 0;
    width: 0;
    height: 0;
    text-indent: -9999px;
    overflow: hidden;
}
.renew_joinform_v2 { border:1px solid #ddd; border-radius:3px; box-sizing:border-box; max-width:570px; margin:0 auto 30px; position:relative; }
.renew_joinform_v2 .mem_agreement_wrap { margin:20px; margin-bottom:30px; position:relative; overflow: hidden; padding: 3px 0;}
.renew_joinform_v2  section .agree-check , .mem_agreement_wrap  .agree-check   {position: absolute; display: block; width: 26px; right: 3px;  top: 0; }
.renew_joinform_v2 div.mem_agreement_area { background:#f7f7f7; box-sizing:border-box; color:#666 !important; height:170px; width:100%; }
.renew_joinform_v2 .mem_agreement_wrap { margin:20px; margin-bottom:30px; position:relative; overflow: hidden; padding: 3px 0;}/*20180831 수정*/
.renew_joinform_v2 div.mem_agreement_area { background:#f7f7f7; box-sizing:border-box; color:#666 !important; height:170px; width:100%; }
.renew_joinform_v2 .mem_agreement_wrap { margin:20px; margin-bottom:30px; position:relative; overflow: hidden; padding: 3px 0;}/*20180831 수정*/
.renew_joinform_v2 .mem_accreditation_wrap { margin:20px; }

.find_mem_sally { margin: 0 auto; text-align: center;padding: 30px 20px 0;background: url('//image.istarbucks.co.kr/common/img/util/mem/icon_find_sally.png') 50% 100% no-repeat;width: 205px;height: 182px;}
.find_form_txt { background:#fff; border-bottom:1px solid #ddd; color:#777; font-size:18px; line-height:24px; text-align:center; padding:30px 20px 30px; }

.type_green {
    color: #006241;
}

input.mem[type=checkbox]:not(old){position: absolute; width:26px; height: 26px; top: 0px; left:0px; padding:0;  border: 0 none;  background: #fff; cursor: pointer; -webkit-appearance: none; -moz-appearance: none; appearance: none;  outline:none;}
input.mem[type=checkbox]:not(old) + label{position: absolute; display: inline-block; width: 26px; height: 26px; line-height: 26px;   background: #fff url("/common/img/util/mem/mem_check_off_type2.png") 0 0 no-repeat ; font-size: 13px; color: #3f4141; cursor: pointer; vertical-align: top; background-size: 26px; text-indent: -9999px; cursor: pointer;  font-size: 0;overflow: hidden;  z-index: 4; -webkit-appearance: none; -moz-appearance: none; appearance: none;  outline:none;} 
.privacy_cont p, .privacy_cont li { font-size:14px; color:#444444; line-height:1.6; }
.privacy_cont p, .privacy_cont li { font-size:14px; color:#444444; line-height:1.6; }
.mem_join_note { margin:20px; margin-bottom:30px; }
</style>
</head>
<body>

	<div id="container">
			<!-- 내용 -->
			<div class="find_mem_wrap asdasdadas"><!-- jsp 수정 : 클래스명 추가 -->
				<!-- 20160804 수정 -->
				<div class="find_mem_inner">
					<form action="" method="post">
						<fieldset>
							<legend class="hid">회원가입 이용약관 동의, 수집하는 개인정보의 항목, 개인정보의 수집 및 이용목적, 개인정보의 보유 및 이용기간 및 파기절차, 파기 방법에 관한 폼</legend>
							
								<strong class="find_mem_ttl">회원가입</strong>
							
							<section class="renew_joinform_v2">
								<!-- 접근성_20171120 수정-->
								<div class="find_mem_sally">
									<!-- <img src="https://image.istarbucks.co.kr/common/img/util/mem/icon_find_sally.png" alt="" /> -->
									<!-- 접근성_20171120 삭제 -->
								</div>
								<!-- 접근성_20171120 수정 end -->
								 <p class="find_form_txt">
									회원가입 약관동의 및 본인인증단계입니다.

								 </p>
								<section class="mem_agreement_wrap">								
									<h5>홈페이지 이용약관 동의 <span class="type_green">(필수)</span></h5>  <!-- 20200826 수정 -->
									<!-- <div class="mem_agreeMent">
										<input type="checkbox" name="mem_agreeMent" id="mem_agreeMent_yes" />
									</div> 접근성_20171120 삭제 -->
									<!-- 접근성_20171120 추가  : label  추가 -->
									<span class="agree-check"><input type="checkbox" name="mem_agreeMent" id="mem_agreeMent_yes" class="mem" /> <label for="mem_agreeMent_yes">동의</label></span>
									<!-- 접근성_20171120 추가 end -->
									<div class="mem_agreement_area">

										<!--20180518 수정-->
										<div class="privacy_cont">
							                <p class="title_text" id="title_text"></p>
										</div>
										<!--//20180518 수정-->

									</div>
								</section>
								
								<section class="mem_purpose_wrap">
								<h5>개인정보 수집 및 이용동의 <span class="type_green">(필수)</span></h5> <!-- 20200826 수정 -->
								<!-- 접근성_20171120 추가 -->
								<span class="agree-check">
									<input type="checkbox" name="mem_purpose" id="mem_purpose_yes" class="mem" />
									<label for="mem_purpose_yes">동의</label>
								</span>
									<!-- 접근성_20171120 추가 end -->
									<!-- <div class="mem_purpose">
										<input type="checkbox" name="mem_purpose" id="mem_purpose_yes" />
									</div> 접근성_20171120 삭제 -->
									<div class="mem_purpose_area mem_purpose_area_v2">
										<!-- 개인정보의 수집 및 이용목적 내용 -->
										<div class="privacy_cont">
							                <p class="privacy_text" id="privacy_text"></p>
										</div>
										<!-- 개인정보의 수집 및 이용목적 내용 end -->
									</div>
								</section>
								
								<!-- 20180726 ::E-mail 및 SMS 광고성 정보 수신동의 영역추가-->
								<!-- s: 개인정보 관련 수정 220929 -->
                                <section class="mem_agreement_wrap mem_advertise_wrap">
                                    <h5>광고성 정보 수신동의 <span class="type_green">(선택)</span></h5>
                                    <!-- 접근성_20171120 추가 -->
                                    <span class="agree-check">
                                        <input type="checkbox" name="mem_advertise" id="mem_advertise_yes" class="mem" />
                                        <label for="mem_advertise_yes">동의</label>
                                    </span>

                                    <!-- 2022.11.23 수정 s -->
                                    <div class="mem_agreement_area">
                                    	<!-- 광고성 정보수신동의 내용  s -->
                                    	<div class="privacy_cont">
							                <p class="privacy_text" id="advertising_text"></p>
										</div>
										<!-- 광고성 정보수신동의 내용  e -->
									</div>
                                    <!-- <dd id="mem_advertise_desc">
                                        <table class="vod_tb_ag mb20 mt10">
                                            <caption class="hid">
                                                수집하는 개인정보에 대한 항목, 목적, 보유기간 안내 테이블
                                            </caption>
                                            <colgroup>
                                                <col width="">
                                                <col width="30%">
                                                <col width="30%">
                                            </colgroup>
                                            <thead>
                                                <tr>
                                                    <th scope="col">목적</th>
                                                    <th scope="col">항목</th>
                                                    <th scope="col">보유 및 이용 기간</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>마케팅 정보 활용<br/>(상품정보 및 행사 정보 안내 등)</td>
                                                    <td class="text-center">휴대번화번호, 이메일</td>
                                                    <td class="text-center underLine">회원 탈퇴시까지</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </dd>
                                    <ul class="list dot">
                                        <li>귀하께서는 동의를 거부하실 수 있으나, 동의를거부 하실 경우 마케팅 정보를받으실 수 없습니다.</li>
                                    </ul> -->
                                    <!-- 접근성_20171120 추가 end -->
                                </section>
                                <!-- <section class="mem_ad_way_wrap">
                                    <h5>광고성 정보 수신 방법</h5>
                                    <ul class="checkbox_wrap">
                                        <li>
                                            <input type="checkbox" name="agreement_advertise" id="agreement_advertise_email"><label for="agreement_advertise_email">E-mail</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" name="agreement_advertise" id="agreement_advertise_sms"><label for="agreement_advertise_sms">SMS</label>
                                        </li>
                                    </ul>
                                </section> -->
                                <!-- 2022.11.23 수정 e -->

                                <!-- e: 개인정보 관련 수정 220929 -->
								<section class="mem_join_note">
									<h5>회원가입 유의사항</h5>
									<ul>
										<li>반드시 회원님 명의로 된 휴대폰, 아이핀을 이용해주세요.</li>
										<li>
											타인의 개인정보를 도용하여 가입할 경우 향후 적발 시 서비스 이용제한 및 법적 제재를 받으실 수 있습니다.
										</li>
										<li>
											스타벅스 코리아의 공식 홈페이지는 Internet Explorer 9.0 이상, Chrome, Firefox, Safari 브라우저에 최적화 되어있습니다.
										</li> <!-- 220112 수정 -->
									</ul>
								</section>
								<section class="mem_accreditation_wrap mb10">
									<h5>인증방식 선택</h5>
									<ul class="mem_accreditation_info">
										<li class="li1">
											<figure><img src="/common/img/util/mem/icon_find1_type2.png" alt="휴대폰 아이콘"></figure> <!-- 20200826 수정 -->
											<p class="mem_k_titl">휴대폰 인증</p>
											<p class="mem_k_txt">본인 명의의 휴대폰을 통해 인증합니다.</p>
											<p class="mem_k_btn"><a href="javascript:void(0)" title="휴대폰 본인 인증 새창열기">인증하기</a></p><!-- 접근성_20171120 title 추가 -->
										</li>
										<li class="li2">
											<figure><img src="/common/img/util/mem/icon_find2_type2.png" alt="아이핀 아이콘"></figure> <!-- 20200826 수정 -->
											<p class="mem_f_titl">아이핀 <span class="en">(i-PIN)</span>인증 </p>
											<p class="mem_f_txt">가입한 아이핀 ID를 통해 인증합니다.</p>
											<p class="mem_f_btn"><a href="javascript:void(0)" title="아이핀 본인 인증 새창열기">인증하기</a></p><!-- 접근성_20171120 title 추가 -->
										</li>
									</ul>
								</section>
							</section>
						</fieldset>	
					</form>
				</div>
			</div>
		</div>
		<!-- 내용 end -->

</body>
</html>