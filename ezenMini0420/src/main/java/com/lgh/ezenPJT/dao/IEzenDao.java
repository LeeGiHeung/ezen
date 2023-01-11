package com.lgh.ezenPJT.dao;

import java.util.ArrayList;

import com.lgh.ezenPJT.dto.AuthUserDto;
import com.lgh.ezenPJT.dto.DashBoardDto;
import com.lgh.ezenPJT.dto.EditorDto;
import com.lgh.ezenPJT.dto.EzenBoardDto;
import com.lgh.ezenPJT.dto.EzenJoinDto;
import com.lgh.ezenPJT.dto.FullCalendarDto;
import com.lgh.ezenPJT.dto.RecipeDto;
import com.lgh.ezenPJT.dto.RecipeOrderDto;

public interface IEzenDao {
	//추상메서드
	//join
	public String join(EzenJoinDto dto);
	//login
	public EzenJoinDto login(String pid);
	//recipe
	public ArrayList<RecipeDto> recipeList();
	public String recipeWrite(RecipeDto dto);
	public RecipeDto recipeDetails(int rId);
	public void recipeOrder(RecipeOrderDto dto);
	public ArrayList<RecipeOrderDto> recipeOrderList(String oUser);
	//admin
	public String adminAuth(String pid,String auth);
	//board
	public ArrayList<EzenBoardDto> list();
	public ArrayList<EzenBoardDto> pageList(String pageNo);
	public ArrayList<EzenBoardDto> searchList();
	public void bWrite(String name,String title,String content);
	public EzenBoardDto contentView(String bid);
	public void upHit(int bId);
	public void modify(EzenBoardDto dto);
	public void delete(int bId);
	public EzenBoardDto replyView(int bId);
	public void reply(EzenBoardDto dto);
	public void replyShape(int bGroup,int bStep);
	//calendar
	public void calendarInsert(FullCalendarDto dto);
	public ArrayList<FullCalendarDto> calendarList(String cId);
	public void calendarUpdate(FullCalendarDto dto);
	public void calendarDelete(FullCalendarDto dto);
	//dashboard
	public ArrayList<DashBoardDto> dashBoardList();
	public void dashBoardWrite(DashBoardDto dto);
	//social
	public void authDB(AuthUserDto dto);
	public void authInsert(AuthUserDto dto);
	public AuthUserDto authLogin(String username);
	
	//editor
	public void editorInsert(EditorDto dto);
	public ArrayList<EditorDto> editorList(String username);
	public EditorDto editorDetail(int edid);
}
