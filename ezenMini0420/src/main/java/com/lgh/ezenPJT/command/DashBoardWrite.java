package com.lgh.ezenPJT.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.lgh.ezenPJT.dao.EzenDao;
import com.lgh.ezenPJT.dto.DashBoardDto;
import com.lgh.ezenPJT.util.Constant;

public class DashBoardWrite implements EzenCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		
		EzenDao edao = Constant.edao;
		
		DashBoardDto dto = (DashBoardDto) request.getAttribute("dto");
		
		edao.dashBoardWrite(dto);
	}

}
