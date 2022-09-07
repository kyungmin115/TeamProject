package kr.ac.kopo.service;

import java.io.IOException;
import java.util.List;

import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.dao.ProductDao;
import kr.ac.kopo.model.ProductVO;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	ProductDao productDao;
	
	@Override
	public int insertProd(ProductVO vo) {
	
		String store[] = {"cu","gs25","seven","emart24"};
		String sale[] = {"1","2"};
		String category[] = {"1","2","3","4"};
		
		for(int i=0;i<store.length;i++) {
			for(int j=0;j<sale.length;j++) {
				for(int k=0;k<category.length;k++) {
		String URL = "https://pyony.com/brands/"+store[i]+"/?event_type="+sale[j]+"&category="+category[k]+"&item=100&sort=&q=";
		Connection conn = Jsoup.connect(URL);
		
		
		try {
			
			Document doc = conn.get();
			
			Elements elem = doc.select("div.card-body > div");
			for(Element e : elem) {
				String al = e.text();
				al = al.trim();
				String[] product = al.split("\\s");

				if(product.length==7) {
					vo.setProdName(product[0]);
					vo.setProdPrice(product[1]);
					vo.setStore(store[i]);
					vo.setSale(sale[j]);
					vo.setCategory(category[k]);
					productDao.insertProd(vo);
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
				}
			}
		}
		
		
		
		return productDao.insertProd(vo);
	}

	@Override
	public void delete() {
		
		productDao.delete();
		
	}

	@Override
	public List<ProductVO> selectList() {
		
		return productDao.selectList();
	}

}
