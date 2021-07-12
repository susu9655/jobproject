package job.data.profile;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import job.data.gonggo.CompanyDto;
import job.data.gonggo.CompanyMapper;
import job.data.resume.CarerDto;
import job.data.resume.EducationDto;
import job.data.resume.ResumeDto;
import job.data.resume.ResumeMapper;
import job.data.userlogin.UserAccountDto;
import job.data.userlogin.UserAccountMapper;
import job.data.userlogin.auth.PrincipalDetails;

@Controller
public class ProfileController {
	
	@Autowired
	ResumeMapper rmapper;
	@Autowired
	UserAccountMapper umapper;
	@Autowired
	JobGroupMapper jmapper;
	@Autowired
	CompanyMapper cmapper;
	
	@Autowired
	private MailService mailService;
	 
	@Autowired
	BCryptPasswordEncoder encodePwd;
	 
	@GetMapping("/profile")
	public ModelAndView profile_index(
			Authentication authentication,
			@AuthenticationPrincipal PrincipalDetails userDetails,
			@AuthenticationPrincipal OAuth2User oauth,
			String num_r) {
		
				ModelAndView mv=new ModelAndView();
				 //로그인이 안되있을 시 메인으로 이동
				 if(authentication==null) {
					  PrincipalDetails principalDetails = (PrincipalDetails)
					  authentication.getPrincipal(); OAuth2User oauth2User =
					  (OAuth2User)authentication.getPrincipal();
					  mv.setViewName("/");
					  return mv;
				 }	
				  PrincipalDetails principalDetails = (PrincipalDetails)
				  authentication.getPrincipal(); OAuth2User oauth2User =(OAuth2User)authentication.getPrincipal();
				  String user_id=Long.toString(userDetails.getUser().getId());
				  mv.addObject("auth",userDetails.getUsername());
				  
				 //전문 분야 설정
				int id=(int)userDetails.getUser().getId();
				int cnt= jmapper.searchIdOfJobGroup(id);
				
				 JobGroupDto gdto=jmapper.getDataOfJobGroup(id);
				 mv.addObject("gdto",gdto);
				 
				
				//목록 가져오기
				List<ResumeDto> list=rmapper.getDataOfResume(user_id);
				mv.addObject("list",list);
				
				//만약 이력서가 존재하지 않는다면 type을 no를 보낸다
				if(list.size()==0) {
					mv.addObject("type","no");
				}else if(list.size()>0){
					if(num_r==null)//이력서는 존재하는데, num_r값이 전달되지 않았을 때
						num_r=Integer.toString(list.get(0).getNum_r()); 
					
					mv.addObject("num_r",num_r); 
					//num_r에 해당하는 정보 가져오기
					 ResumeDto rdto= rmapper.getResumeOneData(num_r);
					   
					 //각각의 값 꺼내기
					 EducationDto edto=rdto.getEducation().get(0);
					 CarerDto cdto=rdto.getCarer().get(0);
					   
					 mv.addObject("edto",edto);
					 mv.addObject("cdto",cdto);
					 mv.addObject("rdto",rdto);
				}
				mv.setViewName("/profile/profile");
				return mv;
	}
	
	@GetMapping("/personUpdateForm")
	public ModelAndView personUpdateForm(
			Authentication authentication,
			@AuthenticationPrincipal PrincipalDetails userDetails,
			@AuthenticationPrincipal OAuth2User oauth
			) {
		ModelAndView mv=new ModelAndView();
		
		
		//로그인이 안되있을 시 메인으로 이동
		 if(authentication==null) {
			  PrincipalDetails principalDetails = (PrincipalDetails)
			  authentication.getPrincipal(); OAuth2User oauth2User =
			  (OAuth2User)authentication.getPrincipal();
			  mv.setViewName("/");
			  return mv;
		 }	
		  PrincipalDetails principalDetails = (PrincipalDetails)
		  authentication.getPrincipal(); OAuth2User oauth2User =(OAuth2User)authentication.getPrincipal();
		  String user_id=Long.toString(userDetails.getUser().getId());
		  mv.addObject("auth",userDetails.getUsername());
		  
		
		mv.setViewName("/profile/personUpdateForm");
		return mv;
	}
	
	@GetMapping("/myjob")
	public ModelAndView myjob(
	@RequestParam(value = "state",defaultValue = "default") String state,
	Authentication authentication,
	@AuthenticationPrincipal PrincipalDetails userDetails,
	@AuthenticationPrincipal OAuth2User oauth
	) {
		ModelAndView mv = new ModelAndView();
		
		
		//로그인이 안되있을 시 메인으로 이동
		 if(authentication==null) {
			  PrincipalDetails principalDetails = (PrincipalDetails)
			  authentication.getPrincipal(); OAuth2User oauth2User =
			  (OAuth2User)authentication.getPrincipal();
			  mv.setViewName("/");
			  return mv;
		 }	
		 
		
		//지원한 개수, 북마크한 개수 구하기
		PrincipalDetails principalDetails = (PrincipalDetails)authentication.getPrincipal();
		OAuth2User oauth2User =(OAuth2User)authentication.getPrincipal();
		String id=Long.toString(userDetails.getUser().getId());
		 mv.addObject("auth",userDetails.getUsername());
		int apply_cnt= cmapper.getCountOfApply(id);
		int bookmark_cnt=cmapper.getCountOfBookmark(id);
		
		//북마크한 회사 정보 얻기
		List<CompanyDto>cdto =cmapper.getListOfCompany(id);
		
		
		//지원한 회사중 마감된 정보의 개수 구하기
		int failCnt=0;
		List<CompanyDto>adto = cmapper.getApplyListOfCompany(id);
		if(adto.size()>0) {
			for(CompanyDto a:adto) {
				Calendar getToday = Calendar.getInstance();
				getToday.setTime(new Date()); //금일 날짜
				String deadline = a.getDeadline();
				Date date;
				try {
					date = new SimpleDateFormat("yyyy-MM-dd").parse(deadline);
					Calendar cmpDate = Calendar.getInstance();
					cmpDate.setTime(date); //특정 일자
					
					long diffSec = (getToday.getTimeInMillis() - cmpDate.getTimeInMillis()) / 1000;
					long diffDays = diffSec / (24*60*60); //일자수 차이
					
					if(diffDays <0) 
						++failCnt;
					
					
					
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			
				
			}
		}
		
		mv.addObject("failCnt",failCnt);
		mv.addObject("cdto",cdto);
		mv.addObject("adto",adto);
		mv.addObject("apply_cnt",apply_cnt);
		mv.addObject("bookmark_cnt",bookmark_cnt);
		
		mv.setViewName("/profile/myjob");
		return mv;
	}
	
	  @GetMapping("/apply")
	    public ModelAndView apply(
	    		@RequestParam(value = "pageNum",defaultValue = "1") int currentPage,
	    		@RequestParam(value = "state",defaultValue = "default") String state,
	    		Authentication authentication,
	 			@AuthenticationPrincipal PrincipalDetails userDetails,
	 			@AuthenticationPrincipal OAuth2User oauth
	    		) {
	    	ModelAndView mv=new ModelAndView();
	    	
	    	
			//로그인이 안되있을 시 메인으로 이동
			 if(authentication==null) {
				  PrincipalDetails principalDetails = (PrincipalDetails)
				  authentication.getPrincipal(); OAuth2User oauth2User =
				  (OAuth2User)authentication.getPrincipal();
				  mv.setViewName("/");
				  return mv;
			 }	
	    	
	    	 PrincipalDetails principalDetails = (PrincipalDetails)
	        		 authentication.getPrincipal(); OAuth2User oauth2User =(OAuth2User)authentication.getPrincipal();
	        		 String id=Long.toString(userDetails.getUser().getId());
	        		  mv.addObject("auth",userDetails.getUsername());
	        		 int apply_cnt= cmapper.getCountOfApply(id);
	        		 int bookmark_cnt=cmapper.getCountOfBookmark(id);
	        			
	        				 
	        		int totalCount=cmapper.getCountOfApply(id);
	        		
	        		//페이징에 필요한 코드
	        		int totalPage;//전체 페이지
	        		int startPage;//각 블럭의 시작페이지
	        		int endPage;//각 블럭의 마지막페이지
	        		int start;//각 페이지의 시작번호
	        		int no;//각 페이지에서 출력을 시작할 번호
	        		int perPage=8;//한페이지에 보여질 글의 개수
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
	        		
	        		//출력에 필요한 변수들 모두 저장
	        		mv.addObject("no", no);
	        		mv.addObject("startPage", startPage);
	        		mv.addObject("endPage", endPage);
	        		mv.addObject("currentPage", currentPage);
	        		mv.addObject("totalPage", totalPage);
	        		
	        		//지원한 기업 보내기
	        		HashMap<String, Object> map = new HashMap<String, Object>();
	        		map.put("id", id);
	        		map.put("start",start);
	        		map.put("perpage",perPage);
	        		List<CompanyDto>cdto=cmapper.getApplyListOfCompany_paging(map);
	        		mv.addObject("cdto",cdto);
	    	

	        		//마감일 계산을 위한 시간 보내기
	        		Date date2 = new Date();
	    			long time = date2.getTime();
	    			mv.addObject("date", date2);
	    			mv.addObject("time", time);

	    			List<CompanyDto>adto = cmapper.getApplyListOfCompany(id);
	    			//불합격한 지원 회사 list
	    			List<CompanyDto>failAdto=new ArrayList<CompanyDto>();
	    			if(adto.size()>0) {
	    				for(CompanyDto a:adto) {
	    					Calendar getToday = Calendar.getInstance();
	    					getToday.setTime(new Date()); //금일 날짜
	    					String deadline = a.getDeadline();
	    					Date date;
	    					try {
	    						date = new SimpleDateFormat("yyyy-MM-dd").parse(deadline);
	    						Calendar cmpDate = Calendar.getInstance();
	    						cmpDate.setTime(date); //특정 일자
	    						
	    						long diffSec = (getToday.getTimeInMillis() - cmpDate.getTimeInMillis()) / 1000;
	    						long diffDays = diffSec / (24*60*60); //일자수 차이
	    						
	    						if(diffDays <0) 
	    							failAdto.add(a);
	    						
	    						
	    						
	    					} catch (ParseException e) {
	    						// TODO Auto-generated catch block
	    						e.printStackTrace();
	    					}
	    				
	    					
	    				}
	    			}
	    			mv.addObject("failCnt",failAdto.size());
	    			mv.addObject("state",state);
	    			mv.addObject("apply_cnt",apply_cnt);
	    			mv.addObject("bookmark_cnt",bookmark_cnt);
	    			mv.addObject("failAdto",failAdto);
	    	
	    	mv.setViewName("/profile/apply");
	    	return mv;
	    }
	
	@GetMapping("/acntMngmn")
	public ModelAndView acntMngmn(
			@RequestParam String type,
			Authentication authentication,
 			@AuthenticationPrincipal PrincipalDetails userDetails,
 			@AuthenticationPrincipal OAuth2User oauth
			
			) {
		ModelAndView mv = new ModelAndView();
		
		//로그인이 안되있을 시 메인으로 이동
		 if(authentication==null) {
			  PrincipalDetails principalDetails = (PrincipalDetails)
			  authentication.getPrincipal(); OAuth2User oauth2User =
			  (OAuth2User)authentication.getPrincipal();
			  mv.setViewName("/");
			  return mv;
		 }	
   	
		 PrincipalDetails principalDetails = (PrincipalDetails)
       	 authentication.getPrincipal(); OAuth2User oauth2User =(OAuth2User)authentication.getPrincipal();
   		  mv.addObject("auth",userDetails.getUsername());
		
		if(type==null) {
			type="changePassword";
		}
		
		mv.addObject("type",type);
		mv.setViewName("/profile/acntMngmn");
		return mv;
	}
	
	@GetMapping("/deleteuser")
	public ModelAndView deleteuser(
			Authentication authentication,
			@AuthenticationPrincipal PrincipalDetails userDetails,
			@AuthenticationPrincipal OAuth2User oauth
			) {
		ModelAndView mv=new ModelAndView();
		PrincipalDetails principalDetails = (PrincipalDetails)
		authentication.getPrincipal(); OAuth2User oauth2User =(OAuth2User)authentication.getPrincipal();
		String id=Long.toString(userDetails.getUser().getId());
		umapper.deleteUserAccount(id);
		
		mv.setViewName("layout");
		return mv;
	}
	


    @PostMapping("/send")
    public ModelAndView sendTestMail(
    		@ModelAttribute MailDto mailDto,
    		Authentication authentication,
 			@AuthenticationPrincipal PrincipalDetails userDetails,
 			@AuthenticationPrincipal OAuth2User oauth
    		) {
    	mailService.mailSend(mailDto);
    	ModelAndView mv = new ModelAndView();
    	

		//로그인이 안되있을 시 메인으로 이동
		 if(authentication==null) {
			  PrincipalDetails principalDetails = (PrincipalDetails)
			  authentication.getPrincipal(); OAuth2User oauth2User =
			  (OAuth2User)authentication.getPrincipal();
			  mv.setViewName("/");
			  return mv;
		 }	
   	
		 PrincipalDetails principalDetails = (PrincipalDetails)
       	 authentication.getPrincipal(); OAuth2User oauth2User =(OAuth2User)authentication.getPrincipal();
   		  mv.addObject("auth",userDetails.getUsername());
    	
    	
    	mv.addObject("type","changePassword");
    	mv.addObject("emailmes","emailmes");
    	mv.setViewName("redirect:acntMngmn");
    	return mv;
    }
    
    
    @GetMapping("/change_password")
    public String changePassword() {
    	return "profile/changePassword";
    }
        
    @PostMapping("/changePwAct")
    public String changePwAct(
    		@RequestParam String pass,
    		Authentication authentication,
 			@AuthenticationPrincipal PrincipalDetails userDetails,
 			@AuthenticationPrincipal OAuth2User oauth
    		) {
    	
		 PrincipalDetails principalDetails = (PrincipalDetails)
		 authentication.getPrincipal(); OAuth2User oauth2User =(OAuth2User)authentication.getPrincipal();
		 String user_id=Long.toString(userDetails.getUser().getId());
		 String password= encodePwd.encode(pass);
		 Map<String, String>map=new HashMap<String, String>();
		 System.out.println(password);
		 map.put("user_id", user_id);
		 map.put("password", password);
		 umapper.updatePasswordOfuser(map);
    	return "redirect:/";
    }
    
    @PostMapping("/updateUser")
    public ModelAndView updateUser(
    		@ModelAttribute UserAccountDto dto,
    		Authentication authentication,
 			@AuthenticationPrincipal PrincipalDetails userDetails,
 			@AuthenticationPrincipal OAuth2User oauth
    		) {
    	ModelAndView mv=new ModelAndView();
    	umapper.updateUser(dto);
    	
    	mv.setViewName("user/loginForm");
    	return mv;
    }
    
    @GetMapping("/bookmark")
    public ModelAndView bookmark(
    		@RequestParam(value = "pageNum",defaultValue = "1") int currentPage,
    		@RequestParam(value = "keyword",defaultValue = "nosearch") String keyword,
    		Authentication authentication,
 			@AuthenticationPrincipal PrincipalDetails userDetails,
 			@AuthenticationPrincipal OAuth2User oauth
    		) {
    		ModelAndView mv=new ModelAndView();
    		

    		//로그인이 안되있을 시 메인으로 이동
    		 if(authentication==null) {
    			  PrincipalDetails principalDetails = (PrincipalDetails)
    			  authentication.getPrincipal(); OAuth2User oauth2User =
    			  (OAuth2User)authentication.getPrincipal();
    			  mv.setViewName("/");
    			  return mv;
    		 }	
    
    		
    		 PrincipalDetails principalDetails = (PrincipalDetails)
    		 authentication.getPrincipal(); OAuth2User oauth2User =(OAuth2User)authentication.getPrincipal();
    		 String id=Long.toString(userDetails.getUser().getId());
    		  mv.addObject("auth",userDetails.getUsername());
    		  
    		//페이징에 필요한 코드
     		int totalPage;//전체 페이지
     		int startPage;//각 블럭의 시작페이지
     		int endPage;//각 블럭의 마지막페이지
     		int start;//각 페이지의 시작번호
     		int no;//각 페이지에서 출력을 시작할 번호
     		int perPage=10;//한페이지에 보여질 글의 개수
     		int perBlock=5;//한 블럭에 보여질 페이지의 개수
    		
    		//북마크한 기업 보내기
    		HashMap<String, Object> map = new HashMap<String, Object>();
    		map.put("id", id);
    		
    		//북마크 검색 기능을 사용했을 때
    		if(!keyword.equals("nosearch")) {
    			
    			map.put("keyword",keyword);
    			
    			int totalCount=cmapper.getCountOfBookmark_search(map);
        		
        		
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
        		
        		
        		map.put("start",start);
        		map.put("perpage",perPage);
        		
    			List<CompanyDto>cdto=cmapper.getListOfCompany_paging_book(map);
    			mv.addObject("cdto",cdto);
    			System.out.println(cdto.size());
    			
    		}else {//검색 기능을 사용하지 않았을 때
    			
    			
    			int totalCount=cmapper.getCountOfBookmark(id);
        		
        
        		
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
        		
        		
        		
        		
        		
        		map.put("start",start);
        		map.put("perpage",perPage);
    		
    			List<CompanyDto>cdto=cmapper.getListOfCompany_paging(map);
    			mv.addObject("cdto",cdto);
    			System.out.println(cdto.size());
    		}
    		

    		//출력에 필요한 변수들 모두 저장
    		mv.addObject("no", no);
    		mv.addObject("startPage", startPage);
    		mv.addObject("endPage", endPage);
    		mv.addObject("currentPage", currentPage);
    		mv.addObject("totalPage", totalPage);
    	
    		//마감일 계산을 위한 시간 보내기
    		Date date = new Date();
			long time = date.getTime();
			mv.addObject("date", date);
			mv.addObject("time", time);
    		
    		mv.setViewName("/profile/bookmark");
    	return mv;
    }
    
    @GetMapping("/delBookmark")
    public ModelAndView delBookmark(
    		String num,
    		String pageNum,
    		Authentication authentication,
 			@AuthenticationPrincipal PrincipalDetails userDetails,
 			@AuthenticationPrincipal OAuth2User oauth
    		) {
    	
    	ModelAndView mv=new ModelAndView();
    	
    	//로그인이 안되있을 시 메인으로 이동
		 if(authentication==null) {
			  PrincipalDetails principalDetails = (PrincipalDetails)
			  authentication.getPrincipal(); OAuth2User oauth2User =
			  (OAuth2User)authentication.getPrincipal();
			  mv.setViewName("/");
			  return mv;
		 }	

		
		
    	
    
    	PrincipalDetails principalDetails = (PrincipalDetails)
        authentication.getPrincipal(); OAuth2User oauth2User =(OAuth2User)authentication.getPrincipal();
        String id=Long.toString(userDetails.getUser().getId());
        mv.addObject("auth",userDetails.getUsername());
        
    	//북마크 삭제
    	Map<String, String>map =new HashMap<String, String>();
    	map.put("id", id);
    	map.put("num", num);
    	cmapper.deleteBookmark(map);
    	
    	mv.addObject("pageNum",pageNum);
    	mv.setViewName("redirect:bookmark");
    	return mv;
    }
    
    @GetMapping("/jobGroup")
	   public ModelAndView jobGroup(
			   String match,
				Authentication authentication,
	 			@AuthenticationPrincipal PrincipalDetails userDetails,
	 			@AuthenticationPrincipal OAuth2User oauth
			   ) {
		   ModelAndView mv = new ModelAndView();
		   
			//로그인이 안되있을 시 메인으로 이동
			 if(authentication==null) {
				  PrincipalDetails principalDetails = (PrincipalDetails)
				  authentication.getPrincipal(); OAuth2User oauth2User =
				  (OAuth2User)authentication.getPrincipal();
				  mv.setViewName("/");
				  return mv;
			 }	
				PrincipalDetails principalDetails = (PrincipalDetails)
		        authentication.getPrincipal(); OAuth2User oauth2User =(OAuth2User)authentication.getPrincipal();
		        String id=Long.toString(userDetails.getUser().getId());
		        mv.addObject("auth",userDetails.getUsername());
			 
			 
		   String jobGroup[]= {"IT/인터넷", "경영/기획/컨설팅", "디자인", "미디어/홍보/마케팅", "생산/제조", "유통/무역","서비스/고객지원"};
		   String it[]= {"웹개발자", "프론트엔드개발자", "Node.js개발자", "빅데이터엔지니어"};
		   String business[]= {"사업개발기획자", "컨설턴트", "경영지원"};
		   String design[]= {"그래픽디자이너", "웹디자이너", "일러스트레이터", "UI디자이너"};
		   String marketing[]= {"광고기획자", "마케팅전략기획자", "키워드광고", "소셜마케터"};
		   String production[]= {"생산직종사자", "제조엔지니어", "품질관리자", "반도체/디스플레이"};
		   String trade[]= {"수출입사무", "유통관리자", "배송담당", "항공운송"};
		   String service[]= {"MD", "CS어드바이저", "CS매니저", "텔레마케터"};
		   
		   if(match==null) {
			   mv.addObject("selectJob",it);
			   match="IT/인터넷";
		   } else if(match.equals("IT/인터넷"))
			   mv.addObject("selectJob",it);
		   else if(match.equals("디자인"))
			   mv.addObject("selectJob",design);
		   else if(match.equals("경영/기획/컨설팅"))
			   mv.addObject("selectJob",business);
		   else if(match.equals("미디어/홍보/마케팅"))
			   mv.addObject("selectJob",marketing);
		   else if(match.equals("생산/제조"))
			   mv.addObject("selectJob",production);
		   else if(match.equals("유통/무역"))
			   mv.addObject("selectJob",trade);
		   else if(match.equals("서비스/고객지원"))
			   mv.addObject("selectJob",service);
		   
		   mv.addObject("match",match);
		   mv.addObject("jobGroup",jobGroup);
		   mv.setViewName("/profile/jobGroup");
		   return mv;
	   }
    
    @PostMapping("/insertJobGroup")
    public ModelAndView insertJobGroup(@ModelAttribute JobGroupDto dto) {
    	ModelAndView mv=new ModelAndView();
    	//처음 입력하는 것인지 알아보기(1이면 입력한 경우, 0이면 처음 입력하는 경우)
    	int cnt= jmapper.searchIdOfJobGroup(dto.getId());
    	
    	if(cnt==0)//처음 입력하는 것일 경우 insert를 진행
    		jmapper.insertJobOfJobGroup(dto);
    	else if(cnt==1)//이미 입력을 한경우는 update를 진행
    		jmapper.updateJobOfJobGroup(dto);
    	
    	
    	mv.setViewName("redirect:profile");
    	return mv;
    }
    
    
    @GetMapping("/delapply")
    public ModelAndView delaply(
    		String num,
    		String pageNum,
    		Authentication authentication,
 			@AuthenticationPrincipal PrincipalDetails userDetails,
 			@AuthenticationPrincipal OAuth2User oauth
    		) {
    	ModelAndView mv=new ModelAndView();
    	
    	//로그인이 안되있을 시 메인으로 이동
		 if(authentication==null) {
			  PrincipalDetails principalDetails = (PrincipalDetails)
			  authentication.getPrincipal(); OAuth2User oauth2User =
			  (OAuth2User)authentication.getPrincipal();
			  mv.setViewName("/");
			  return mv;
		 }	
		
	      
		 
    	PrincipalDetails principalDetails = (PrincipalDetails)
        authentication.getPrincipal(); OAuth2User oauth2User =(OAuth2User)authentication.getPrincipal();
        String id=Long.toString(userDetails.getUser().getId());
        mv.addObject("auth",userDetails.getUsername());
        
    	//삭제
    	HashMap<String, String> map = new HashMap<String, String>();
		map.put("id",id);
		map.put("num",num);
    	cmapper.deleteApply(map);
    	
    	mv.addObject("pageNum",pageNum);
    	mv.setViewName("redirect:apply");
    	return mv;
    }
}
