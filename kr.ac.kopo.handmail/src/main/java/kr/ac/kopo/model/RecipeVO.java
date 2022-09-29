package kr.ac.kopo.model;

import java.util.Date;

public class RecipeVO {

	private int recipeNo;
	private String recipeTitle;
	private String recipeContent;
	private String recipeWriter;
	private Date recipeRegDate;
	private int recipeCount;
	private String noticeAt;
	
	
	public int getRecipeNo() {
		return recipeNo;
	}
	public void setRecipeNo(int recipeNo) {
		this.recipeNo = recipeNo;
	}
	public String getRecipeTitle() {
		return recipeTitle;
	}
	public void setRecipeTitle(String recipeTitle) {
		this.recipeTitle = recipeTitle;
	}
	public String getRecipeContent() {
		return recipeContent;
	}
	public void setRecipeContent(String recipeContent) {
		this.recipeContent = recipeContent;
	}
	public String getRecipeWriter() {
		return recipeWriter;
	}
	public void setRecipeWriter(String recipeWriter) {
		this.recipeWriter = recipeWriter;
	}
	public Date getRecipeRegDate() {
		return recipeRegDate;
	}
	public void setRecipeRegDate(Date recipeRegDate) {
		this.recipeRegDate = recipeRegDate;
	}
	public int getRecipeCount() {
		return recipeCount;
	}
	public void setRecipeCount(int recipeCount) {
		this.recipeCount = recipeCount;
	}
	public String getNoticeAt() {
		return noticeAt;
	}
	public void setNoticeAt(String noticeAt) {
		this.noticeAt = noticeAt;
	}
	
	
	
}
