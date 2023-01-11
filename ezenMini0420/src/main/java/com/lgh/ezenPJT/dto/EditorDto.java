package com.lgh.ezenPJT.dto;

import java.sql.Timestamp;

public class EditorDto {
	private int edId; //seq일련번호 EDITOR_SEQ와 DB는 Editor로
	private String edUser; //userid
	private String edTitle; //제목
	private String editor; //content으로 ckeditor에 만들어 textarea에 복사한 html
	private Timestamp edDate; //작성일
	
	public EditorDto() {
		super();		
	}

	public EditorDto(int edId, String edUser, String edTitle, String editor, Timestamp edDate) {
		super();
		this.edId = edId;
		this.edUser = edUser;
		this.edTitle = edTitle;
		this.editor = editor;
		this.edDate = edDate;
	}

	public int getEdId() {
		return edId;
	}

	public void setEdId(int edId) {
		this.edId = edId;
	}

	public String getEdUser() {
		return edUser;
	}

	public void setEdUser(String edUser) {
		this.edUser = edUser;
	}

	public String getEdTitle() {
		return edTitle;
	}

	public void setEdTitle(String edTitle) {
		this.edTitle = edTitle;
	}

	public String getEditor() {
		return editor;
	}

	public void setEditor(String editor) {
		this.editor = editor;
	}

	public Timestamp getEdDate() {
		return edDate;
	}

	public void setEdDate(Timestamp edDate) {
		this.edDate = edDate;
	}
	
	
	
}
