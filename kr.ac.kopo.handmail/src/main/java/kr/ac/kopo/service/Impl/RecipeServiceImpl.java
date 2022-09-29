package kr.ac.kopo.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.dao.RecipeDao;
import kr.ac.kopo.model.RecipeVO;
import kr.ac.kopo.service.RecipeService;

@Service
public class RecipeServiceImpl implements RecipeService {

	@Autowired
	private RecipeDao recipeDao;
	
	@Override
	public List<RecipeVO> selectList() {
		
		return recipeDao.selectRecipeList();
	}

	@Override
	public int insertRecipe(RecipeVO vo) {
		
		return recipeDao.insertRecipe(vo);
	}

	@Override
	public int delRecipe(int recipeNo) {
		
	
		return recipeDao.delRecipe(recipeNo);
	}

	@Override
	public RecipeVO selectRecipe(int recipeNo) {
		
		return recipeDao.selectRecipe(recipeNo);
	}

	@Override
	public int updateRecipe(RecipeVO vo) {
		
		return recipeDao.updateRecipe(vo);
	}

}
