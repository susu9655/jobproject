package job.data.news;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import job.data.review.reviewDto;

@Controller
public class newsController {

	@Autowired
	newsMapper mapper; 
	
	@GetMapping("/news")
	public ModelAndView news(
			@RequestParam(value = "pageNum",defaultValue = "1") int currentPage
			) {
		ModelAndView mview=new ModelAndView();
		
		//총 개수
		int totalCount=mapper.getTotalCount();
		
		//최신뉴스
		List<newsDto> latest=mapper.getLatestData();
		
		
		//페이징에 필요한 코드
		int totalPage;//전체 페이지
		int startPage;//각 블럭의 시작페이지
		int endPage;//각 블럭의 마지막페이지
		int start;//각 페이지의 시작번호
		int no;//각 페이지에서 출력을 시작할 번호
		int perPage=5;//한페이지에 보여질 글의 개수
		int perBlock=5;//한 블럭에 보여질 페이지의 개수

		//총 페이지수 구하기
		totalPage=totalCount/perPage+(totalCount%perPage>0?1:0); 
		//나머지가 있으면 1페이지 더하기(글개수13개면 페이지3장필요)

		//현재페이지가 3인경우 startPage는 1, endPage=5 / 현재페이지가 6인경우 startPage는 6, endPage=10
		startPage=(currentPage-1)/perBlock*perBlock+1;
		endPage=startPage+perBlock-1;

		//만약 총 페이지수가 8인경우 2번째 블럭은 startPage 6, endPage 10 BUT, 이때 endPage는 8로 표기되어야한다.
		if(totalPage<endPage)
			endPage=totalPage;

		//각 페이지의 시작번호 구하기(1일경우 0, 2일경우 3)
		//오라클 첫글:1, mysql 첫글:0
		start=(currentPage-1)*perPage;

		//각 글 앞에 붙일 시작번호구하기 
		//예: 총글이 20개일경우 1페이지는 20부터 2페이지는 15부터 출력해서 1씩 감소해가며 출력할것
		no=totalCount-(currentPage-1)*perPage;		
		
		//데이터출력(페이징처리)
		List<newsDto> list=mapper.getDataOfNews(start, perPage);	

		//출력에 필요한 변수들 모두 request에 저장(list.jsp에서 사용)
		mview.addObject("no", no);
		mview.addObject("startPage", startPage);
		mview.addObject("endPage", endPage);
		mview.addObject("currentPage", currentPage);
		mview.addObject("totalPage", totalPage);
		
		mview.addObject("totalCount", totalCount);
		mview.addObject("list", list);
		mview.addObject("latest", latest);
		
		mview.setViewName("/news/newslist");
		return mview;
	}
	
	@GetMapping("/newsdetail")
	public ModelAndView newsdetail(@RequestParam String num) {
		ModelAndView mview=new ModelAndView();
		
		//num에 해당하는 데이터
		List<newsDto> list=mapper.getDataOfNum(num);

		//조회수 증가
		mapper.readcount(num);
		
		//조회수 조회
		int readcount=mapper.getReadcount(num);
		
		mview.addObject("list", list);
		mview.addObject("readcount", readcount);
		
		mview.setViewName("/news/newsdetail");
		return mview;
	}
	
	@ResponseBody
	@PostMapping("/searchNews")
	public List<newsDto> searchNews(@RequestParam String title){
		
		//title이 들어간 news데이터 전체 출력
		List<newsDto> list=mapper.searchNews(title);
		System.out.println(list);
		
		return list;
	}

	
}
