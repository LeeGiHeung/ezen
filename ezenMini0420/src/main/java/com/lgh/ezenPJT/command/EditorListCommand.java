package com.lgh.ezenPJT.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.lgh.ezenPJT.dao.EzenDao;
import com.lgh.ezenPJT.dto.EditorDto;
import com.lgh.ezenPJT.util.Constant;

public class EditorListCommand implements EzenCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		
		EzenDao edao = Constant.edao;
		
		String username = request.getParameter("edUser");
		
		ArrayList<EditorDto> dtos = edao.editorList(username);
		
		model.addAttribute("editorList", dtos);

	}

}
