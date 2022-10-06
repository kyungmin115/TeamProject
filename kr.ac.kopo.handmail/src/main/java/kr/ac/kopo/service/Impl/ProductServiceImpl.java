package kr.ac.kopo.service.Impl;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
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
import kr.ac.kopo.model.SearchCriteria;
import kr.ac.kopo.service.ProductService;

@Service
public class ProductServiceImpl implements ProductService {

   @Autowired
   ProductDao productDao;
   
   @Override
   public int insertProd(ProductVO vo) {
   
       //이미지 가져와서 저장하기
       File tFolder = new File("d:/pyony/");
       if(!tFolder.exists()) {
       	tFolder.mkdirs();
       }
	   
	  String store[] = {"cu", "gs25", "seven", "emart24"};
      String sale[] = {"1", "2"};
      String category[] = {"1", "2", "3", "4"};
      
      for(int i=0;i<store.length;i++) {
         for(int j=0;j<sale.length;j++) {
            for(int k=0;k<category.length;k++) {
      String URL = "https://pyony.com/brands/"+store[i]+"/?event_type="+sale[j]+"&category="+category[k]+"&item=100&sort=&q=";
      Connection conn = Jsoup.connect(URL);
            
      
      try {
         
         Document doc = conn.get();
         
         String imgName = "";
         
         Elements cardBodies = doc.select("div.card-body");
         for(Element cardBody : cardBodies) { //card-body하나가 하나의 제품
        	 Elements elems = cardBody.select("div.card-body > div.prod_img_div"); //card-body밑에 이미지 div에서 이미지 다운로드
        	 for(Element e : elems) { //div
                 Element imgTag = e.select("img").get(0);
                 String url = imgTag.getElementsByAttribute("src").attr("src");
                 String[] urlSplit = url.split("/");
                 imgName = urlSplit[urlSplit.length-1]; //순수 파일명
                 System.out.println("imgName" + imgName);
                 System.out.println(url);
        
                 URL urls = null;
                 //이미지 다운로드
                 if(url.startsWith("http:")) {
                		 urls = new URL(url);	 
                 } else {
                	 urls = new URL("https:" + url);	 
                 }
                 
                 InputStream is = urls.openStream();
                 FileOutputStream fos = new FileOutputStream("d:/pyony/" + imgName);
                 int b;
                 while((b = is.read()) != -1) {
                 	fos.write(b);
                 }
                 fos.close();
                 
                 System.out.println(imgName + " :: 작업완료");
                 		
                 break;
              }
        	 Elements elem = cardBody.select("div.card-body > div"); //card-body밑에 div에서 상품 정보 저장
             for(Element e : elem) { //div
                String al = e.text();
                System.out.println(al);
                al = al.trim();
                String[] product = al.split("\\s");

                if(product.length==7) {
                   vo.setProdName(product[0]);
                   vo.setProdPrice(product[1]);
                   vo.setStore(store[i]);
                   vo.setSale(sale[j]);
                   vo.setCategory(category[k]);
                   vo.setImgName(imgName);
                   
                   productDao.insertProd(vo);
                }
             }
        	 
         }
         
			/*
			 * Elements elems = doc.select("div.card-body > div.prod_img_div"); for(Element
			 * e : elems) { //div Element imgTag = e.select("img").get(0); String url =
			 * imgTag.getElementsByAttribute("src").attr("src"); String[] urlSplit =
			 * url.split("/"); imgName = urlSplit[urlSplit.length-1]; //순수 파일명
			 * System.out.println("imgName" + imgName);
			 * 
			 * 
			 * //이미지 다운로드 URL urls = new URL(url); InputStream is = urls.openStream();
			 * FileOutputStream fos = new FileOutputStream("d:/pyony/" + imgName); int b;
			 * while((b = is.read()) != -1) { fos.write(b); } fos.close();
			 * 
			 * System.out.println(imgName + " :: 작업완료");
			 * 
			 * break; }
			 * 
			 * Elements elem = doc.select("div.card-body > div"); for(Element e : elem) {
			 * //div String al = e.text(); System.out.println(al); al = al.trim(); String[]
			 * product = al.split("\\s");
			 * 
			 * if(product.length==7) { vo.setProdName(product[0]);
			 * vo.setProdPrice(product[1]); vo.setStore(store[i]); vo.setSale(sale[j]);
			 * vo.setCategory(category[k]); vo.setImgName(imgName);
			 * 
			 * productDao.insertProd(vo); } }
			 */
      } catch (IOException e) {
         e.printStackTrace();
      }
      
            }
         }
      }
            
      return 1;
   }

   @Override
   public void delete() {
      
      productDao.delete();
      
   }

   @Override
   public List<ProductVO> selectList(SearchCriteria scri) {
      
      return productDao.selectList(scri);
   }

   @Override
   public int listCount(SearchCriteria scri) {
      
      return productDao.listCount(scri);
   }

   @Override
   public List<ProductVO> selectEvent(SearchCriteria scri) {

      return productDao.selectEvent(scri);
   }

   @Override
   public List<ProductVO> category(SearchCriteria scri) {
      
      return productDao.category(scri);
   }

}