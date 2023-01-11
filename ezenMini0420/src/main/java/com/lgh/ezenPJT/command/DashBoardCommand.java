package com.lgh.ezenPJT.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.lgh.ezenPJT.dao.EzenDao;
import com.lgh.ezenPJT.dto.DashBoardDto;
import com.lgh.ezenPJT.util.Constant;

public class DashBoardCommand implements EzenCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {		
		
		EzenDao edao = Constant.edao;
		
		ArrayList<DashBoardDto> dtos = edao.dashBoardList();
		
		model.addAttribute("dashArray", dtos); 
		//map�������� �����, key�� dashArray , value�� dtos
	}

}
