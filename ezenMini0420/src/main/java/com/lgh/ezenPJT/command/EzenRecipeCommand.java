package com.lgh.ezenPJT.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.lgh.ezenPJT.dao.EzenDao;
import com.lgh.ezenPJT.dto.RecipeDto;
import com.lgh.ezenPJT.util.Constant;

public class EzenRecipeCommand implements EzenCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		EzenDao edao = Constant.edao;
		//EzenDao edao = (EzenDao)request.getAttribute("dao");
		ArrayList<RecipeDto> dtos = edao.recipeList();
		model.addAttribute("recipeList", dtos);
	}

}
