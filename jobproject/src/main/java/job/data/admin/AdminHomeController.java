package job.data.admin;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import job.data.emplogin.EmpAccountDto;



@Controller
public class AdminHomeController {
	  @Autowired
	   AdminMapper mapper;
	  
	  @GetMapping("/admin2/adminmain")
		public String main()
		{
			return "/admin2/adminlogin/loginform";
		}
	    
	
		@PostMapping("/admin2/adminloginprocess")
		public String loginCheck(
				@RequestParam(defaultValue = "admin") String adminid,
				@RequestParam(defaultValue = "123456") String adminpass, HttpSession session)
		{
			int n=mapper.loginCheckofAdmin(adminid, adminpass);
			if(n==1) 
			{
				//세션저장(2개)
				session.setAttribute("loginok", "yes");
				session.setAttribute("myadminid", adminid);
				
				//세션저장 후 메인페이지로 리다이렉트
				return "redirect:adminnotice/list";
			}else {
				
				//passfail.jsp로 포워드
				return "redirect:adminlogin/loginfail";
			}
		}
		
		
		@GetMapping({"/adminlogout"})
		public String logout(HttpSession session)
		{
			session.removeAttribute("loginok");
			session.removeAttribute("myadminid");
			return "redirect:/";
			
		}

	 
	 
	 
		
	  
	  
	  


}
