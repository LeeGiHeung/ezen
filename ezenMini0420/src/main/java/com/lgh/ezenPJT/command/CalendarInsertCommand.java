package com.lgh.ezenPJT.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.lgh.ezenPJT.dao.EzenDao;
import com.lgh.ezenPJT.dto.FullCalendarDto;
import com.lgh.ezenPJT.util.Constant;

public class CalendarInsertCommand implements EzenCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		
		EzenDao edao = Constant.edao;
		
		FullCalendarDto dto = (FullCalendarDto)request.getAttribute("dto");
		
		edao.calendarInsert(dto);
	}

}
