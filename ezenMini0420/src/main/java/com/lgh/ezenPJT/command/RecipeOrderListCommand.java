package com.lgh.ezenPJT.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.lgh.ezenPJT.dao.EzenDao;
import com.lgh.ezenPJT.dto.RecipeOrderDto;
import com.lgh.ezenPJT.util.Constant;

public class RecipeOrderListCommand implements EzenCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		
		EzenDao edao = Constant.edao;		
		
		String oUser = request.getParameter("rOuser");
		
		ArrayList<RecipeOrderDto> dtos = (ArrayList<RecipeOrderDto>)edao.recipeOrderList(oUser);
		
		//DB���� ��ȯ���� model�� �־� jsp���� ���
		model.addAttribute("recipeOrderList", dtos);
	}

}
