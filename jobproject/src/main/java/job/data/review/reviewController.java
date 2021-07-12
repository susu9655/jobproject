package job.data.review;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import job.data.emplogin.EmpAccountDto;
import job.data.emplogin.EmpAccountMapper;
import job.data.gonggo.CompanyDto;
import job.data.gonggo.CompanyMapper;
import job.data.resume.CarerDto;
import job.data.resume.ResumeMapper;
import job.data.userlogin.auth.PrincipalDetails;

@Controller
public class reviewController {

	@Autowired
	reviewMapper mapper;
	
	@Autowired
	ResumeMapper rmapper;
	
	@Autowired
	EmpAccountMapper emapper;
	
	@GetMapping("/addreview")
	   public ModelAndView review(
				Authentication authentication,
				@AuthenticationPrincipal PrincipalDetails userDetails,
				@AuthenticationPrincipal OAuth2User oauth
			   ) {
	      ModelAndView mview =new ModelAndView();
	      
			//로그인할 시 정보를 전달
			if(authentication!=null) {
			  PrincipalDetails principalDetails = (PrincipalDetails)
			  authentication.getPrincipal(); OAuth2User oauth2User =
			  (OAuth2User)authentication.getPrincipal();
			  mview.addObject("auth",userDetails.getUsername());
			}	      
			
			//username 변수 지정
			String email=userDetails.getUsername().toString();
			
			//user id(num)값
			int id=(int)userDetails.getUser().getId();
			
			List<CarerDto> company=rmapper.getIdCareer(id);
			System.out.println("회사:"+company);
			
			//username별 리뷰 총 개수
		    int totalCount=mapper.getTotalCount(email);
		    
		    //usertname별 데이터 출력
		    List<reviewDto> list=mapper.myreviewOfEmail(email);
		    
		    //날짜
		    Date date=new Date();
	        mview.addObject("date", date);

		    mview.addObject("totalCount",totalCount);
		    mview.addObject("company",company);
		    mview.addObject("list",list);
		    mview.setViewName("/review/addreview");
		    return mview;
	   }
	
	@GetMapping("/review")
	public ModelAndView addreview(
			@RequestParam(value = "pageNum",defaultValue = "1") int currentPage,
			Authentication authentication,
			@AuthenticationPrincipal PrincipalDetails userDetails,
			@AuthenticationPrincipal OAuth2User oauth
			) {
		ModelAndView mview =new ModelAndView();
		
		//로그인할 시 정보를 전달
		if(authentication!=null) {
		
		  PrincipalDetails principalDetails = (PrincipalDetails)
		  authentication.getPrincipal(); OAuth2User oauth2User =
		  (OAuth2User)authentication.getPrincipal();
		  mview.addObject("auth",userDetails.getUsername());
		}
		
		
		int totalCount=mapper.selectEmpnameCount();
		
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
		
		List<reviewDto> empname=mapper.selectEmpname(start, perPage);
		System.out.println(empname);
		List<reviewDto> list=mapper.getReviewData();
		mview.addObject("empname",empname);
		mview.addObject("list",list);
		
		int total=mapper.TotalCount();
		
		//출력에 필요한 변수들 모두 request에 저장(list.jsp에서 사용)
		mview.addObject("no", no);
		mview.addObject("startPage", startPage);
		mview.addObject("endPage", endPage);
		mview.addObject("currentPage", currentPage);
		mview.addObject("total", total);
		mview.addObject("totalCount", totalCount);
		 
		mview.setViewName("/review/reviewlist");
		return mview;
	}
	
	
	@GetMapping("/writeReview")
	public ModelAndView writeReview(
			@RequestParam String emp,
			Authentication authentication,
			@AuthenticationPrincipal PrincipalDetails userDetails,
			@AuthenticationPrincipal OAuth2User oauth
			) {
		ModelAndView mview =new ModelAndView();
		
		
		//로그인할 시 정보를 전달
		if(authentication!=null) {
				
			PrincipalDetails principalDetails = (PrincipalDetails)
			authentication.getPrincipal(); OAuth2User oauth2User =
			(OAuth2User)authentication.getPrincipal();
			System.out.println(userDetails.getUser());
			mview.addObject("auth",userDetails.getUsername());
		}
		
		//기업명 저장
	    mview.addObject("emp",emp);
	
	    mview.setViewName("/review/writeform");
		return mview; 
	}
	
	@PostMapping("/add")
	public ModelAndView add(
			@ModelAttribute reviewDto rdto,
			Authentication authentication,
			@AuthenticationPrincipal PrincipalDetails userDetails,
			@AuthenticationPrincipal OAuth2User oauth
			) {
		ModelAndView mview =new ModelAndView();
		
		mapper.insertReview(rdto);
		
		//로그인할 시 정보를 전달
		if(authentication!=null) {
		
		  PrincipalDetails principalDetails = (PrincipalDetails)
		  authentication.getPrincipal(); OAuth2User oauth2User =
		  (OAuth2User)authentication.getPrincipal();
		  System.out.println(userDetails.getUser());
		  mview.addObject("auth",userDetails.getUsername());
		}
		mview.setViewName("redirect:/addreview");
		return  mview;
	}
	
	@GetMapping("/reviewdetail")
	public ModelAndView reviewdetail(
			@RequestParam String empname,
			@RequestParam(value = "pageNum",defaultValue = "1") int currentPage,
			Authentication authentication,
			@AuthenticationPrincipal PrincipalDetails userDetails,
			@AuthenticationPrincipal OAuth2User oauth) {
		ModelAndView mview =new ModelAndView();
		
		//로그인할 시 정보를 전달
		if(authentication!=null) {
		
		  PrincipalDetails principalDetails = (PrincipalDetails)
		  authentication.getPrincipal(); OAuth2User oauth2User =
		  (OAuth2User)authentication.getPrincipal();
		  System.out.println(userDetails.getUser());
		  mview.addObject("auth",userDetails.getUsername());
		}
		
		//기업이름
		String emp=empname;
		mview.addObject("empname",emp);
		
		System.out.println("empname:"+empname);
		
		//총 개수
		int review0fEmp=mapper.review0fEmp(empname);
		mview.addObject("review0fEmp",review0fEmp);
		
		//데이터 출력
		List<reviewDto> list=mapper.getReviewData();
		mview.addObject("list",list);
		
		//페이징에 필요한 코드
		int totalPage;//전체 페이지
		int startPage;//각 블럭의 시작페이지
		int endPage;//각 블럭의 마지막페이지
		int start;//각 페이지의 시작번호
		int no;//각 페이지에서 출력을 시작할 번호
		int perPage=3;//한페이지에 보여질 글의 개수
		int perBlock=5;//한 블럭에 보여질 페이지의 개수

		//총 페이지수 구하기
		totalPage=review0fEmp/perPage+(review0fEmp%perPage>0?1:0); 
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
		no=review0fEmp-(currentPage-1)*perPage;

		
		//empname에 해당하는 데이터 출력
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("empname", empname);
		map.put("start", start);
		map.put("perpage", perPage);

		List<reviewDto> empdata=mapper.getReviewDataOfEmp(map);
		mview.addObject("empdata",empdata);
		
		//기업정보 출력
		List<EmpAccountDto> empDataOfAccount=emapper.getEmpData(empname);
		System.out.println("empdataofaccount:"+empDataOfAccount);
		
		
		//평가 평균
		float avgRating=mapper.avgRating(empname);
		float avgCul=mapper.avgCul(empname);
		float avgImp=mapper.avgImp(empname);
		float avgEnv=mapper.avgEnv(empname);
		float avgSal=mapper.avgSal(empname);
		float avgCeo=mapper.avgCeo(empname);
		mview.addObject("avgRating",avgRating);
		mview.addObject("avgCul",avgCul);
		mview.addObject("avgImp",avgImp);
		mview.addObject("avgEnv",avgEnv);
		mview.addObject("avgSal",avgSal);
		mview.addObject("avgCeo",avgCeo);
		
		//출력에 필요한 변수들 모두 저장
		mview.addObject("no", no);
		mview.addObject("startPage", startPage);
		mview.addObject("endPage", endPage);
		mview.addObject("currentPage", currentPage);
		mview.addObject("totalPage", totalPage);
		mview.addObject("empAccount", empDataOfAccount);
		
		mview.setViewName("/review/reviewdetail");
		return mview;
	}
		
	@GetMapping("/searchlist")
	public ModelAndView searchlist (@RequestParam String empname,
			Authentication authentication,
			@AuthenticationPrincipal PrincipalDetails userDetails,
			@AuthenticationPrincipal OAuth2User oauth
			) {
		ModelAndView mview =new ModelAndView();
		
		//로그인할 시 정보를 전달
		if(authentication!=null) {
		
		  PrincipalDetails principalDetails = (PrincipalDetails)
		  authentication.getPrincipal(); OAuth2User oauth2User =
		  (OAuth2User)authentication.getPrincipal();
		  System.out.println(userDetails.getUser());
		  mview.addObject("auth",userDetails.getUsername());
		}
		
		
		//기업 단어 검색
		List<reviewDto> searchlist=mapper.searchEmpname(empname);
		
		int total=mapper.TotalCountOfSearch(empname);
		
		//값 저장
		mview.addObject("searchlist", searchlist);
		mview.addObject("total", total);
		mview.setViewName("/review/searchlist");
		return mview;
	}
	
	@ResponseBody
	@PostMapping("/insertlikes")
	public int likes(@RequestParam String email,@RequestParam String num) {
		
		System.out.println(email);
		System.out.println(num);

		// 이전에 추천했으면1 안했으면0 반환
		int countOflikes=mapper.countOflikes(email, num);
		System.out.println("추천기록:"+countOflikes);

		//이전에 추천했으면 1반환
		if (countOflikes==1) {
			countOflikes=1;
			
			return countOflikes;

		//이전에 추천 안했으면 데이터 추가
		}else {
			//추천기록 없음
			countOflikes=0;

			//추천수 증가 insert
			
			mapper.insertReviewOflikes(num);

			//추천 누른 id 데이터 추가
			mapper.insertlikes(email, num);
			
			return countOflikes;
		}
	}
	
	
	@GetMapping("/deleteReview")
	public String deleteReview(@RequestParam int num) {
		mapper.deleteReview(num);
		return "redirect:/addreview";
	}
	
	@GetMapping("/updateReview")
	public ModelAndView updateReview(@RequestParam int num,
			Authentication authentication,
			@AuthenticationPrincipal PrincipalDetails userDetails,
			@AuthenticationPrincipal OAuth2User oauth) {
		ModelAndView mview =new ModelAndView();
		
		//로그인할 시 정보를 전달
		if(authentication!=null) {
		  PrincipalDetails principalDetails = (PrincipalDetails)
		  authentication.getPrincipal(); OAuth2User oauth2User =
		  (OAuth2User)authentication.getPrincipal();
		  System.out.println(userDetails.getUser());
		  mview.addObject("auth",userDetails.getUsername());
		}
		
		List<reviewDto> updatedata=mapper.getData(num);
		mview.addObject("updatedata", updatedata);
		
		mview.setViewName("/review/updateform");
		return mview;
	}
	
	@PostMapping("/updateOfReview")
	public ModelAndView update(@ModelAttribute reviewDto rdto,
			Authentication authentication,
			@AuthenticationPrincipal PrincipalDetails userDetails,
			@AuthenticationPrincipal OAuth2User oauth) {
		ModelAndView mview =new ModelAndView();
		
		//수정
		mapper.updateReview(rdto);
		
		//로그인할 시 정보를 전달
		if(authentication!=null) {
		
		  PrincipalDetails principalDetails = (PrincipalDetails)
		  authentication.getPrincipal(); OAuth2User oauth2User =
		  (OAuth2User)authentication.getPrincipal();
		  System.out.println(userDetails.getUser());
		  mview.addObject("auth",userDetails.getUsername());
		}
		mview.setViewName("redirect:/addreview");
		return mview;
	}
	
	
	//관리자페이지 출력//
		@GetMapping({"/admin2/adminreview/list"})
		public ModelAndView list()
		
		{	ModelAndView mview=new ModelAndView();
			
			//목록 가져오기
			List<reviewDto> list=mapper.getAllReview();	
			mview.addObject("list",list);
			mview.setViewName("/admin2/adminreview/list");
			return mview;
		}
		
		@GetMapping("/admin2/adminreview/reviewdelete")
		public String delete(@RequestParam String num)
		{
			mapper.deleteAdminReview(num);
			return "redirect:list";
		}
		

		@ResponseBody
		@PostMapping("/reviewlargest")
		public List<reviewDto> reviewlargest(
				@RequestParam(value = "pageNum",defaultValue = "1") int currentPage,
				Authentication authentication,
				@AuthenticationPrincipal PrincipalDetails userDetails,
				@AuthenticationPrincipal OAuth2User oauth,
				Model model
				){
			
			
			//로그인할 시 정보를 전달
			if(authentication!=null) {
			
			  PrincipalDetails principalDetails = (PrincipalDetails)
			  authentication.getPrincipal(); OAuth2User oauth2User =
			  (OAuth2User)authentication.getPrincipal();
			  model.addAttribute("auth",userDetails.getUsername());
			}
			
			int totalCount=mapper.selectEmpnameCount();
			
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

			//리뷰많은 순
			List<reviewDto> reviewlargest=mapper.selectEmpnameOflargest(start, perPage);
			
			return reviewlargest;
			
		}
		
		
		@ResponseBody
		@PostMapping("/reviewrating")
		public List<reviewDto> reviewrating(
				@RequestParam(value = "pageNum",defaultValue = "1") int currentPage,
				Authentication authentication,
				@AuthenticationPrincipal PrincipalDetails userDetails,
				@AuthenticationPrincipal OAuth2User oauth,
				Model model
				){
			
			
			//로그인할 시 정보를 전달
			if(authentication!=null) {
			
			  PrincipalDetails principalDetails = (PrincipalDetails)
			  authentication.getPrincipal(); OAuth2User oauth2User =
			  (OAuth2User)authentication.getPrincipal();
			  model.addAttribute("auth",userDetails.getUsername());
			}
			
			int totalCount=mapper.selectEmpnameCount();
			
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

			//리뷰많은 순
			List<reviewDto> reviewrating=mapper.selectEmpnameOfrating(start, perPage);
			
			return reviewrating;
			
		}	
		
		@ResponseBody
		@PostMapping("/reviewhelpful")
		public List<reviewDto> reviewhelpful(
				@RequestParam(value = "pageNum",defaultValue = "1") int currentPage,
				Authentication authentication,
				@AuthenticationPrincipal PrincipalDetails userDetails,
				@AuthenticationPrincipal OAuth2User oauth,
				Model model
				){
			
			
			//로그인할 시 정보를 전달
			if(authentication!=null) {
			
			  PrincipalDetails principalDetails = (PrincipalDetails)
			  authentication.getPrincipal(); OAuth2User oauth2User =
			  (OAuth2User)authentication.getPrincipal();
			  model.addAttribute("auth",userDetails.getUsername());
			}
			
			int totalCount=mapper.selectEmpnameCount();
			
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

			//리뷰많은 순
			List<reviewDto> reviewhelpful=mapper.selectEmpnameOfhelpful(start, perPage);
			
			return reviewhelpful;
			
		}
		
		@ResponseBody
		@PostMapping("/reviewlatest")
		public List<reviewDto> reviewlatest(
				@RequestParam(value = "pageNum",defaultValue = "1") int currentPage,
				Authentication authentication,
				@AuthenticationPrincipal PrincipalDetails userDetails,
				@AuthenticationPrincipal OAuth2User oauth,
				Model model
				){
			
			
			//로그인할 시 정보를 전달
			if(authentication!=null) {
			
			  PrincipalDetails principalDetails = (PrincipalDetails)
			  authentication.getPrincipal(); OAuth2User oauth2User =
			  (OAuth2User)authentication.getPrincipal();
			  model.addAttribute("auth",userDetails.getUsername());
			}
			
			int totalCount=mapper.selectEmpnameCount();
			
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

			//리뷰많은 순
			List<reviewDto> reviewlatest=mapper.selectEmpname(start, perPage);
			
			return reviewlatest;
			
		}
	
}