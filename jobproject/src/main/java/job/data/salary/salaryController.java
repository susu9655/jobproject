package job.data.salary;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import job.data.userlogin.auth.PrincipalDetails;

@Controller
public class salaryController {

	@Autowired
	SalaryMapper mapper; 
	
	@GetMapping("/salary")
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
			  System.out.println(userDetails.getUser());
			  mview.addObject("auth",userDetails.getUsername());
			}	
	     
	      //salary 초기값 
	      List<salaryDto> saldefault=mapper.salarydefault();
	      mview.addObject("saldefault", saldefault);
	    
	      mview.setViewName("/salary/salarylist");
	      return mview;
	   }
	
	
	@ResponseBody
	@PostMapping("searchjob")
	public List<salaryDto> searchjob(
			@RequestParam String job,
			@RequestParam String jobgroup,
			@RequestParam String career	
			) {
	 
	      System.out.println("job:"+job);
	      System.out.println("jobgroup:"+jobgroup);
	      System.out.println("career:"+career);
	      
	      List<salaryDto> list=mapper.SearchJob(job, jobgroup);
	      
	  return list;
	}
	
	@ResponseBody
	@PostMapping("searchsal")
	public int searchsal(
			@RequestParam String job,
			@RequestParam String jobgroup,
			@RequestParam String career
			) {
	 
	      System.out.println("job:"+job);
	      System.out.println("jobgroup:"+jobgroup);
	      System.out.println("career:"+career);
	      
	      int sal=mapper.SearchSal(job, jobgroup, career);
	      
	  return sal;
	}
	
}
