package kr.ac.kopo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.ac.kopo.model.RecipeVO;

@Mapper
public interface RecipeDao {
	
	List<RecipeVO> selectRecipeList();

	int insertRecipe(RecipeVO vo);

	int delRecipe(int recipeNo);

	RecipeVO selectRecipe(int recipeNo);

	int updateRecipe(RecipeVO vo);
	
}
