package job.data;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import job.data.gonggo.CompanyDto;
import job.data.gonggo.CompanyMapper;
import job.data.news.newsDto;
import job.data.news.newsMapper;
import job.data.userlogin.auth.PrincipalDetails;

@Controller
public class JobController {
	@Autowired
	CompanyMapper datamapper;
	@Autowired
	newsMapper newsmapper;
	
	@GetMapping("/")
	public ModelAndView home(Authentication authentication,
			@AuthenticationPrincipal PrincipalDetails userDetails,
			@AuthenticationPrincipal OAuth2User oauth,
			String num)
	{
		ModelAndView mview =new ModelAndView();
		
		//신규 채용공고 목록 가져오기
	    List<CompanyDto> gonggolist=datamapper.getAlldatas(num);
	    CompanyDto cdto=new CompanyDto();
		cdto=datamapper.getData(num);
	    Date date=new Date();
        long time= date.getTime();

        mview.addObject("num", num);
        mview.addObject("date", date);
        mview.addObject("time",time);
	    mview.addObject("gonggolist",gonggolist);
		
	    //최신 뉴스 목록 가져오기
	    List<newsDto> newslist=newsmapper.getLatestData();
	    List<newsDto> ndto=newsmapper.getDataOfNum(num);
	    mview.addObject("newslist",newslist);
		//로그인할 시 정보를 전달
		if(authentication!=null) {
		
		  PrincipalDetails principalDetails = (PrincipalDetails)authentication.getPrincipal(); 
		  OAuth2User oauth2User =(OAuth2User)authentication.getPrincipal();
		  System.out.println(userDetails.getUser());
		  //System.out.println(oauth.getName().toString());

		  mview.addObject("auth",userDetails.getUsername());
		  //mv.addObject("auth",oauth.getName().toString());
		}
		mview.setViewName("layout");
		return mview;
	}
	
	
		
}

