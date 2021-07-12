package job.data.faq;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class FaqController {
	@Autowired
	FaqMapper mapper;
	
	@GetMapping("/Faq")
	public ModelAndView faqlist(){
		ModelAndView mview = new ModelAndView();
		List<FaqDto> dto=mapper.getFaqData();
		
		mview.addObject("dto",dto);
		mview.setViewName("/faq/faqlist");
		return mview;
	}
	
	@GetMapping("/faqcontent")
	public ModelAndView faqmain(String num) {
		ModelAndView mview = new ModelAndView();
		FaqDto dto = new FaqDto();
		dto=mapper.getFaqContent(num);
		
		mview.addObject("dto",dto);
		mview.setViewName("/faq/faqcontent");
		return mview;
	}
	
	@GetMapping("/faqsearch")
	public ModelAndView faqsearch(@RequestParam String content) {
		ModelAndView mview = new ModelAndView();
		
		List<FaqDto> faqsearch=mapper.getSearchFaq(content);
		mview.addObject("content",content);
		mview.addObject("faqsearch",faqsearch);
		mview.setViewName("/faq/faqsearch");
		return mview;
	}
}
