package kr.ac.kopo.service;

import java.util.List;

import kr.ac.kopo.model.BoardVO;
import kr.ac.kopo.model.RecipeVO;
import kr.ac.kopo.model.SearchCriteria;

public interface RecipeService {

	List<RecipeVO> selectList();

	int insertRecipe(RecipeVO vo);

	int delRecipe(int recipeNo);

	RecipeVO selectRecipe(int recipeNo);

	int updateRecipe(RecipeVO vo);

	
}
