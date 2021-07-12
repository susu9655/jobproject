package job.data.recommend;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import antlr.StringUtils;
import job.data.gonggo.CategoryDto;
import job.data.gonggo.CompanyDto;
import job.data.gonggo.CompanyMapper;
import job.data.profile.JobGroupDto;
import job.data.profile.JobGroupMapper;
import job.data.userlogin.UserAccountDto;
import job.data.userlogin.UserAccountMapper;
import job.data.userlogin.auth.PrincipalDetails;

@Controller
public class recommendController {
	
	@Autowired
	UserAccountMapper usermapper;
	
	@Autowired
	JobGroupMapper jobmapper;
	
	@Autowired
	recommendMapper mapper;
	
	@Autowired
	CompanyMapper cmapper;
	
	@GetMapping("/recommend")
	public ModelAndView recommend(
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
		
		//미로그인 페이지
		}else if(authentication==null){
			mview.setViewName("/recommendation/recommendLogout");
			return mview;
		}

		//로그인된 username 얻기
		String username=(String)userDetails.getUsername();
		
		//로그인된 username의 num값 얻기
		UserAccountDto user=usermapper.findByUsername(username);
		int id=(int)user.getId();
		
		//로그인된 username의 num값으로 직군 얻기
		String jobgroup=jobmapper.getJobdata(id);
		
		//전체 공고
		List<recommendDto> joblist=mapper.totalData();
				
		//이력서 직무분야 미선택시
		if(jobgroup==null) {
			jobgroup="없음";
			
			mview.addObject("username", username);
			mview.addObject("jobgroup", jobgroup);
			mview.addObject("joblist", joblist);
			mview.setViewName("/recommendation/recommendNodata");
			return mview;
		}

		//직군으로 공고 데이터 얻기
		List<recommendDto> data=mapper.recommendData(jobgroup);
		System.out.println("data:"+data);

		List<bookmarkDto> bookdata=mapper.bookdata(id);
		System.out.println("bookdata:"+bookdata);
		
		mview.addObject("data",data);
		mview.addObject("bookdata",bookdata);
		mview.addObject("username", username);
		mview.addObject("jobgroup", jobgroup);
		mview.addObject("idx", id);
		
		mview.setViewName("/recommendation/recommendlist");
		return mview;
}
	
	
	@ResponseBody
	@GetMapping("/recommendbookmark")
	   public int recommendbookmark(
			   	int num, int id,
			    Authentication authentication,
				@AuthenticationPrincipal PrincipalDetails userDetails,
				@AuthenticationPrincipal OAuth2User oauth
				  )
	   {
		   ModelAndView mview=new ModelAndView();

			//로그인할 시 정보를 전달
			if(authentication!=null) {
			
			  PrincipalDetails principalDetails = (PrincipalDetails)
			  authentication.getPrincipal(); OAuth2User oauth2User =
			  (OAuth2User)authentication.getPrincipal();
			  mview.addObject("auth",userDetails.getUsername());
			}
			
			//북마크 체크 유무
			int check=mapper.bookmarkCheck(id, num);
			if(check==0) {
				//북마크 저장
				check=0;
				mapper.insertBookmark(id, num);
				return check;
			
			}else {
				//북마크 삭제
				check=1;
				mapper.deleteBookmark(id, num);
				return check;
			}
	   }	
}
