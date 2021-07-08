package traffic.bye.service;


import java.io.IOException;
import java.sql.SQLException;
import java.util.Iterator;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.inject.internal.util.Iterators;

import traffic.bye.dao.CrawlerDAO;
import traffic.bye.vo.WordDTO;



@Service
public class CrawlerServiceImpl implements CrawlerService {

	@Autowired
	private CrawlerDAO crawlerDAO;

	
	
	@Override
	//public void insert(String url,String user_id) {
	public void insert(String url) {
		
		Document doc = null;
		
		try {
		
			doc = Jsoup.connect(url).get();
			System.out.println("연결 성공");
		}catch(IOException e) {
			e.printStackTrace();
		}
		System.out.println(url);
		Elements element = doc.select("div.product_card");
		
		//System.out.println(element);
		
		Iterator<Element> ie1= element.select("span.brand_name").iterator(); // 브랜드 이름
		Iterator<Element> ie2 = element.select("span.tit").iterator(); // 상품명
		Iterator<Element> ie3 = element.select("span.sale").iterator(); // 가격
		Iterator<Element> ie4 = element.select("img").iterator(); // 가격
		
		System.out.println("--------------------");
		int cnt = 0;
		// to-do
		// 가장 작은 수 만큼
		
		
		while(ie1.hasNext()) {
			cnt += 1;
			String s_ie1 =ie1.next().text().trim();
			String s_ie2= ie2.next().text().trim();
			String s_ie3= ie3.next().text().trim();
			String s_ie4= ie4.next().attr("src").trim();
			//System.out.println(s_ie1);
			//System.out.println(s_ie2);
			if(s_ie1 ==null) break;
			if(s_ie2 ==null) break;
			if(s_ie3 ==null) break;
			if(s_ie4 ==null) break;
			
			System.out.println(s_ie1);
			System.out.println(s_ie2);
			System.out.println(s_ie3);
			System.out.println(s_ie4);
			System.out.println("-=------");
			
//			wordDTO.setMember_id(user_id);
//			wordDTO.setQuestion(s_ie1);
//			wordDTO.setAnswer(s_ie2);

			
			
			
		}
		
		System.out.println(cnt);
		System.out.println("--------------------");
		System.out.println("--------------------");
		
	}
}
