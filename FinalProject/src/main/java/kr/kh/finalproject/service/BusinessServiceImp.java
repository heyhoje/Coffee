package kr.kh.finalproject.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kh.finalproject.dao.BusinessDAO;

@Service
public class BusinessServiceImp implements BusinessService {
	
	@Autowired
	
	private BusinessDAO businessDao; 


}
