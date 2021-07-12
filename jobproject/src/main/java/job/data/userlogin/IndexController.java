package job.data.userlogin;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import job.data.userlogin.auth.PrincipalDetails;



@Controller
public class IndexController {

	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@Autowired
	UserAccountMapper mapper;
	
	@GetMapping("/test/login")
	public @ResponseBody String testLogin(Authentication authentication, 
			@AuthenticationPrincipal PrincipalDetails userDetails) { //DI(의존성 주입). @AuthenticationPrincipal을 통해서 세션정보에 접근할수 있음
		System.out.println("/test/login ===================");
		PrincipalDetails principalDetails = (PrincipalDetails) authentication.getPrincipal();
		System.out.println("authentication:"+principalDetails.getUser());
		
		System.out.println("userDetails:"+userDetails.getUser());
		return "세션 정보 확인하기";
		
	}
	
	@GetMapping("/test/oauth/login")
	public @ResponseBody String testOAuthLogin(Authentication authentication, 
			@AuthenticationPrincipal OAuth2User oauth) { //DI(의존성 주입). @AuthenticationPrincipal을 통해서 세션정보에 접근할수 있음
		System.out.println("/test/oauth/login ===================");
		OAuth2User oauth2User = (OAuth2User)authentication.getPrincipal();
		System.out.println("authentication:"+oauth2User.getAttributes());
		System.out.println("oauth2User:"+oauth.getAttributes());
		return "OAuth 세션 정보 확인하기";
		
	}
	
	
	@GetMapping("/login")
	public String login(@AuthenticationPrincipal PrincipalDetails principalDetails) {
		return "user/loginForm";
	}
	
	
	 @GetMapping("/logout") public String logout(@AuthenticationPrincipal
	  PrincipalDetails principalDetails) { 
		 return "user/loginForm"; }
	
	
//	@GetMapping("/emp") //매니저로 로그인했을경우 이경로로 갔을때 이용가능함. 유저는 이용못하는 페이지
//	public @ResponseBody String emp() {
//		return "emp/loginForm";
//	}
//	
//	@GetMapping("/admin") //어드민은 다 이용가능함
//	public @ResponseBody String admin() {
//		return "admin";
//	}
		
	//스프링시큐리티가 해당주소를 낚아채버림. 나중에 수정예정
	//SecurityConfig파일을 추가하고나서 스프링시큐리티가 낚아채지 않음.
	@GetMapping("/loginForm")
	public String loginForm() {
		return "user/loginForm";
	}
	
	@GetMapping("/joinForm")
	public String joinForm() {
		return "user/joinForm";  //조인폼으로 가면 회원가입할수있는 페이지뜨고
	}
	
	@PostMapping("/join")
	public String join(@ModelAttribute UserAccountDto user) {
		System.out.println(user);
		user.setRole("ROLE_USER");//유저의 롤은 ROLE_USER로 강제 주입 //유저의 아이디는 오토인크리먼트로 자동으로 만들어질거임.
		String rawPassword=user.getPassword();
		String encPassword=bCryptPasswordEncoder.encode(rawPassword);
		user.setPassword(encPassword);
		
		mapper.insertUserAccount(user); //회원가입 잘됨. 비밀번호:123456
		
		return "redirect:/"; //조인할때 실제로 회원가입 시킨다
	}
	
	
	
	//관리자페이지 출력//
	@GetMapping({"/admin2/adminmember/list"})
	public ModelAndView list()
	
	{	ModelAndView mview=new ModelAndView();
		
		int totalCount=mapper.getTotalCountOfUserAccount();
		mview.addObject("totalCount",totalCount);
		//목록 가져오기
		List<UserAccountDto> list=mapper.getAllUserAccount();		
		mview.addObject("list",list);
		mview.setViewName("/admin2/adminmember/list");
		return mview;
	}
	
	@GetMapping("/admin2/adminmember/addform")
	public String addform() {
		return "/admin2/adminmember/addform";  
	}


	@GetMapping("/admin2/adminmember/delete")
	public String delete(@RequestParam String id)
	{
		mapper.deleteUserAccount(id);
		return "redirect:list";
	}
	
	@PostMapping("/admin2/adminmember/insert") 
	public String insert(@ModelAttribute UserAccountDto dto)
	{
		mapper.insertUserAccount(dto);
		return "redirect:list";
	}
	
	//관리자페이지 출력//

		
	
	
	
	
	///----------여기는 그냥 연습용. 어드민 페이지 관리하는 사람쓰고 싶으면 쓸수있게.
	
	@Secured("ROLE_ADMIN") //매핑주소의 권한을 하나만 걸고싶을때는 @Secured를 사용
	@GetMapping("/userinfo")
	public @ResponseBody String info() {
		return "개인정보";
	}
	
	@PreAuthorize("hasRole('ROLE_MANAGER') or hasRole('ROLE_ADMIN')") //매핑주소의 권한을 여러개 걸고 싶을때는 @PreAuthorize("hasRole"())사용
	@GetMapping("/userdata")
	public @ResponseBody String data() {
		return "데이터정보";
	}
	
	
//	@GetMapping("/user/idcheck")
//	public @ResponseBody Map<String, Integer> idCheck(
//			@RequestParam String id)
//	{
//		Map<String,Integer> map=new HashMap<String, Integer>();
//		int count=1;
//		System.out.println(count);
//		map.put("count", count);
//		return map;
//	}

}


