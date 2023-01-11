package com.lgh.ezenPJT.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.lgh.ezenPJT.dao.EzenDao;
import com.lgh.ezenPJT.dto.EditorDto;
import com.lgh.ezenPJT.util.Constant;

public class EditorInsertCommand implements EzenCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		
		EzenDao edao = Constant.edao;
		EditorDto dto = (EditorDto)request.getAttribute("edDto");
		
		edao.editorInsert(dto);
	}

}
