package job.data.notice;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;






@Controller
public class NoticeController {
	
	@Autowired
	NoticeMapper mapper;
	
	@GetMapping("/admin2/adminnotice/list")
	public ModelAndView list()
	{
		ModelAndView mview=new ModelAndView();
		//총갯수
		int totalCount=mapper.getTotalCount();
		mview.addObject("totalCount",totalCount);
		//목록 가져오기
		List<NoticeDto> list=mapper.getAllDatas();
		mview.addObject("list",list);
		mview.setViewName("/admin2/adminnotice/list");
		return mview;
	}
	

	
	
	@GetMapping("/admin2/adminnotice/addform")
	public String addform()
	{
		return "/admin2/adminnotice/addform"; 
	}
	

	@PostMapping("/admin2/adminnotice/insert")
	public String insert(@ModelAttribute NoticeDto dto,
			@RequestParam String num_n,
			HttpServletRequest request)
	{
		String path=request.getSession().getServletContext().getRealPath("/noticephoto");
		System.out.println(path);
		String fileName="";
		
		//파일명 앞에 붙일 날짜구하기
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
		 fileName="photo"+sdf.format(new Date())
			+"_"+dto.getUpload().getOriginalFilename();
		//dto에 업로드될 파일명 저장
		dto.setPhoto(fileName);
		
		//업로드
		MultipartFile uploadFile=dto.getUpload();
		try {
			uploadFile.transferTo(new File(path+"\\"+fileName));
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		//db insert
		mapper.insertNotice(dto);
		return "redirect:list";
		
		}
	
	
		@GetMapping("/admin2/adminnotice/contents")
		public String contents(Model model,
				
				@RequestParam String num_n,
				@RequestParam(defaultValue = "no") String key)
		{
			//목록에서 올경우에만 조회수 증가
			if(key.equals("list"))
				mapper.viewCount(num_n);
			
			//dto 가져와서 model 에 저장
			
			NoticeDto dto=mapper.getData(num_n);
			model.addAttribute("dto",dto);
			
			return "/admin2/adminnotice/contents";
		}
		
		@PostMapping("/admin2/adminnotice/update")
		public String update(@ModelAttribute NoticeDto dto,
				@RequestParam String num_n,
				HttpServletRequest request)
		{
			String path=request.getSession().getServletContext().getRealPath("/noticephoto");
			System.out.println(path);
			  String f=dto.getUpload().getOriginalFilename();

			//파일명 앞에 붙일 날짜구하기
			SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
			String fileName="photo"+sdf.format(new Date())
				+"_"+dto.getUpload().getOriginalFilename();
			if(f.equals("")){
	            NoticeDto ato=mapper.getData(num_n);
	            dto.setPhoto(ato.getPhoto());
	            
	            mapper.updateNotice(dto);
			}else {
	            	
	            dto.setPhoto(fileName);
			//업로드
			MultipartFile uploadFile=dto.getUpload();
			try {
				uploadFile.transferTo(new File(path+"\\"+fileName));
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			//db update
			mapper.updateNotice(dto);
			
			
			}
			return "redirect:contents?num_n="+dto.getNum_n();
	            
			}
		
		
		@GetMapping("/admin2/adminnotice/updateform")
		public ModelAndView updateForm(@RequestParam String num_n)
		{
			ModelAndView mview=new ModelAndView();
			NoticeDto dto=mapper.getData(num_n);
			
			mview.addObject("dto",dto);
			mview.setViewName("/admin2/adminnotice/updateform");
			return mview;
		}
		
		
		
	
		
			@GetMapping("/admin2/adminnotice/delete")
			public String delete(@RequestParam String num_n)
			{
				mapper.deleteNotice(num_n);
				return "redirect:list";
			}
			
			
			//메인페이지 공지사항
			@GetMapping("/notice")
			public ModelAndView noticelist()
			{
				ModelAndView mview=new ModelAndView();
				//총갯수
				int totalCount=mapper.getTotalCount();
				mview.addObject("totalCount",totalCount);
				//목록 가져오기
				List<NoticeDto> list=mapper.getAllDatas();
				mview.addObject("list",list);
				mview.setViewName("/notice/noticelist");
				return mview;
			}
			
			@GetMapping("/noticecontent")
			public String noticedetail(Model model,
					
					@RequestParam String num_n,
					@RequestParam(defaultValue = "no") String key)
			{
				//목록에서 올경우에만 조회수 증가
				if(key.equals("list"))
					mapper.viewCount(num_n);
				
				//dto 가져와서 model 에 저장
				
				NoticeDto dto=mapper.getData(num_n);
				model.addAttribute("dto",dto);
				
				return "/notice/noticecontent";
			}
			
			
			
			
			
			
			
	}

	




