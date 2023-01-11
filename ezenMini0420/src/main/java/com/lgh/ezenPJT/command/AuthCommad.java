package com.lgh.ezenPJT.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.lgh.ezenPJT.dao.EzenDao;
import com.lgh.ezenPJT.dto.AuthUserDto;
import com.lgh.ezenPJT.util.Constant;

public class AuthCommad implements EzenCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		
		EzenDao edao = Constant.edao;
		
		AuthUserDto dto = (AuthUserDto)request.getAttribute("dto");
		
		edao.authDB(dto);
	}

}
