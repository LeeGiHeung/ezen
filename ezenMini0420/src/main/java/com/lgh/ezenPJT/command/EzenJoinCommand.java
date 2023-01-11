package com.lgh.ezenPJT.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.ui.Model;

import com.lgh.ezenPJT.dao.EzenDao;
import com.lgh.ezenPJT.dto.EzenJoinDto;
import com.lgh.ezenPJT.util.Constant;

public class EzenJoinCommand implements EzenCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		//암호화 객체
		BCryptPasswordEncoder passwordEncoder= Constant.passwordEncoder;
		//form의 입력 원소값을 추출
		String bid = request.getParameter("pid");
		String bpw = request.getParameter("ppw"); //암호화전
		String baddress = request.getParameter("paddress");
		String bhobby = request.getParameter("phobby");
		String bprofile = request.getParameter("pprofile");
		
		//암호화전 bpw를 bpw_org에 저장
		String bpw_org = bpw; //bPw_org는 암호화전 pw
		bpw = passwordEncoder.encode(bpw_org); //encode메서드로 암호화
		
		EzenJoinDto dto = new EzenJoinDto(bid,bpw,baddress,bhobby,bprofile,null,null);
		
		EzenDao edao = Constant.edao;
		String result = edao.join(dto);
		System.out.println("result : " + result);
		
		request.setAttribute("result", result);
	}

}
