package com.lgh.ezenPJT.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.lgh.ezenPJT.dao.EzenDao;
import com.lgh.ezenPJT.dto.RecipeDto;
import com.lgh.ezenPJT.util.Constant;

public class EzenRecipeDetailCommand implements EzenCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		
		EzenDao edao = Constant.edao;
		String rId = request.getParameter("rId");
		System.out.println("rid : " + rId);
		int bId = Integer.parseInt(rId);
		System.out.println(bId);
		
		RecipeDto dto = edao.recipeDetails(bId);
		
		 if(dto != null) {
			 model.addAttribute("rDetails",dto);
		 }
	}

}
