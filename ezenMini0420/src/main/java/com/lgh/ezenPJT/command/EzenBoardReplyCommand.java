package com.lgh.ezenPJT.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.lgh.ezenPJT.dao.EzenDao;
import com.lgh.ezenPJT.dto.EzenBoardDto;
import com.lgh.ezenPJT.util.Constant;

public class EzenBoardReplyCommand implements EzenCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		
		EzenDao edao = Constant.edao;
		
		EzenBoardDto dto = (EzenBoardDto)request.getAttribute("formDto");
		
		edao.reply(dto);
	}

}
