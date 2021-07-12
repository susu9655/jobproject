package job.data.pjlist;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


import job.data.emplogin.EmpAccountMapper;
import job.data.gonggo.CompanyDto;
import job.data.gonggo.CompanyMapper;


@Controller
public class Listcontroller {
	
	
	@Autowired
	CompanyMapper datamapper;
	
	@Autowired
	EmpAccountMapper empmapper;
	
	
	
	@GetMapping("/pjlist/list")
	public String list(){
		
		return "/pjlist/list";	
	}
	
	 @RequestMapping(value="/pjlist" , method = {RequestMethod.GET, RequestMethod.POST})
	 @PostMapping("/pjlist")
	   public ModelAndView pjlist(@ModelAttribute listCategotyDto dto,String num) {
	    ModelAndView mview =new ModelAndView();
	
	   
	    
	    //목록 가져오기
	    List<CompanyDto> gonggolist=datamapper.getAlldatas(num);
	    CompanyDto cdto=new CompanyDto();
		cdto=datamapper.getData(num);
	    //System.out.println("getnum:"+num);
	    Date date=new Date();
        long time= date.getTime();
        //System.out.println(dto.getTag());
        mview.addObject("num", num);
        mview.addObject("date", date);
        mview.addObject("time",time);
	    mview.addObject("gonggolist",gonggolist);
	      
	    for(CompanyDto d:gonggolist)
	      
	      mview.setViewName("/pjlist/list");
	      return mview;
	   }
	 
		
//	  @GetMapping({"/pjlist/gonggodetail"}) 
//	  public ModelAndView gonggo(@RequestParam String num,String empname) 
//	  { 
//		  ModelAndView mview=new ModelAndView(); 
//		  CompanyDto dto=new CompanyDto(); 
//		  dto=datamapper.getData(num);
//		  System.out.println("getnum:"+num);
//		  empname=dto.getEmpname(); 
//		  String edto=empmapper.searchAddr(empname); 
//		  System.out.println(edto);
//		  mview.addObject("dto",dto); mview.addObject("edto",edto);
//		  
//		  List<CategoryDto>cdto=dto.getCategory(); 
//		  mview.addObject("cdto",cdto);
//		  mview.addObject("num",dto.getNum());
//		  
//		  mview.setViewName("gonggo/gonggodetail"); 
//		  return mview; 
//		}
		 
	 
	 @ResponseBody
	 @PostMapping({"/pjlistsearchtag"})
	 public List<CompanyDto> searchListByTag(@RequestParam String tag){
		
		 //tag가 들어간 공고리스트 전체 출력
		 List<CompanyDto> listByTag=datamapper.searchListByTag(tag);
		 //System.out.println("list="+listByTag);
		 
		 return listByTag;
	 }
	 	
		
	  @ResponseBody
	  @PostMapping({"/pjlistsearchjob"}) 
	  public List<CompanyDto>searchByJob(@RequestParam String jobgroup)
	  
	  { 
		  //직무에 따른 공고리스트 출력
			//System.out.println(jobgroup);
			List<CompanyDto>listByJob=datamapper.searchByJob(jobgroup);
			//System.out.println("list="+listByJob);
		  
			return listByJob; 
	 
	 }
	  
	  @ResponseBody
	  @PostMapping({"/pjlistsearcharea"}) 
	  public List<CompanyDto>searchByArea(@RequestParam String addr)
	  
	  { 	
		  //지역에 따른 공고리스트 출력
			//System.out.println(addr);
		  	List<CompanyDto>listByArea=datamapper.searchByArea(addr);
		  	System.out.println("list="+listByArea);
		  	
		  	
		  	return listByArea; 
	 
	 }
		 
	 
	 
	 
	 
	
}
