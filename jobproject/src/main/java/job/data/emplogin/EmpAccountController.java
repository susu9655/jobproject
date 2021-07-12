package job.data.emplogin;


import java.util.Date;
import java.util.HashMap;
import java.util.List;
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

import job.data.gonggo.CompanyDto;
import job.data.gonggo.CompanyMapper;

@Controller
public class EmpAccountController {
	
	@Autowired
	EmpAccountMapper mapper;
	@Autowired
	CompanyMapper cmapper;
	
	@GetMapping("/emplist")
	public ModelAndView emplist(@ModelAttribute EmpAccountDto dto)
	{	
		ModelAndView mv=new ModelAndView();
		//총갯수
		int totalCount=mapper.getTotalCountOfEmp();
		int emailCheck=mapper.emailCheckOfEmp(dto.getEmail());
		System.out.println("email:"+dto.getEmail());
		mv.addObject("totalCount", totalCount);
		mv.addObject("emailCheck", emailCheck);
		mv.setViewName("/emp/emplist");
		return mv;//  폴더명/파일명
	}
	
	@GetMapping("/empLogin")
	public String loginform()
	{
		return "/emp/empLoginForm";
	}
	
	@GetMapping("/empJoin")
	public String empJoin()
	{
		return "/emp/empJoinForm";
	}
	
	
	  //왜 이메일 카운트 안될까? //왜 안되지???왜왜왜애ㅙ
	//이메일 값을 못받아오는거 같은데... db에서 못읽어오는건가?
	  
	
	  @GetMapping("/emailcheck") 
	  public @ResponseBody Map<String, Integer> emailCheck(@RequestParam String email) 
	  { 
		 Map<String, Integer> map= new HashMap<String, Integer>();
		 int count=mapper.emailCheckOfEmp(email);
		 map.put("count", count);
		 return map;
	  }
	 
	
	@PostMapping("/insertemp") 
	 public String insert(@ModelAttribute EmpAccountDto dto) 
	 {
		 mapper.insertOfEmp(dto);
		 return "redirect:/";
	 }
	
	
	@PostMapping("/emploginprocess")
	public String loginCheck(
			@RequestParam String email,
			@RequestParam String password, HttpSession session)
	{
		int n=mapper.loginCheckOfEmp(email, password);
		if(n==1) 
		{
			//세션저장(2개)
			session.setAttribute("loginok", "yes");
			session.setAttribute("myemail", email);
			
			//세션저장 후 메인페이지로 리다이렉트
			return "redirect:/";
		}else {
			
			//passfail.jsp로 포워드
			return "/emp/passfail";
		}
	}
	
	
	@GetMapping({"/emplogout"})
	public String logout(HttpSession session)
	{
		session.removeAttribute("loginok");
		session.removeAttribute("myemail");
		return "layout";
		
	}
	
	@GetMapping({"/updateEmp"})
	public ModelAndView empUpdateForm(@RequestParam String num)
	{
		ModelAndView mview=new ModelAndView();
		EmpAccountDto dto=mapper.getdataOfEmp(num);
		
		mview.addObject("dto",dto);
		mview.setViewName("/emp/empUpdateForm");
		return mview;
	}
	
	@GetMapping({"/empMyPage"})
	public ModelAndView Mypageemp(HttpSession session)
	{
		ModelAndView mview=new ModelAndView();
         
         String email=(String)session.getAttribute("myemail");
	     String empname=mapper.searchEmpName(email);
	     String addr=mapper.searchAddr(empname);
	     String num=mapper.searchEmpNum(email);
	     
	     List<CompanyDto> cdto=cmapper.getmygonggo(empname);
	     mview.addObject("num",num);
		mview.addObject("addr",addr);
		mview.addObject("email",email);
		mview.addObject("empname",empname);
		mview.addObject("cdto",cdto);
		mview.setViewName("/emp/empMyPage");
		return mview;
	}
	
	@PostMapping("/empupdate")
	public String updateemp(@ModelAttribute EmpAccountDto dto)
	{
		mapper.updateOfEmp(dto);
		return "redirect:empMyPage";
	}
	
	//관리자페이지 출력//
		@GetMapping({"/admin2/adminmember/elist"})
		public ModelAndView list()
		
		{	ModelAndView mview=new ModelAndView();
			
			//목록 가져오기
			List<EmpAccountDto> list=mapper.getAllEmpAccount();	
			mview.addObject("list",list);
			mview.setViewName("/admin2/adminmember/elist");
			return mview;
		}
		
		@GetMapping("/admin2/adminmember/empdelete")
		public String delete(@RequestParam String num)
		{
			mapper.deleteEmpAccount(num);
			return "redirect:list";
		}
		
		
		
	
	

}
