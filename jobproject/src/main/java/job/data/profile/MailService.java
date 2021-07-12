package job.data.profile;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;


@Component
public class MailService {
	 @Autowired
	 private JavaMailSender javaMailSender;

	 public void mailSend(MailDto mailDto){
		 try {
			 MailHandler mailHandler = new MailHandler(javaMailSender);
			 mailHandler.setTo(mailDto.getAddress());
			 mailHandler.setSubject("[+JOB]비밀번호 초기화");
			 
			 //보낼 내용을 html형식으로 작성
			 String htmlContent="<div style='margin-left:50px;margin-top:10px;'>"
					+ "<img width='500' height='300' src='https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRgVdLy2L5Pm0LWgpnDDyR6URszK7_hY6-e3Q&usqp=CAU'>"
					+ "<h1>[+JOB] 비밀번호 초기화</h1>\r\n"
			 		+ "<h3>안녕하세요, "+mailDto.getName()+"님,</h3>\r\n"
			 		+ "<h3>+JOB입니다.</h3>\r\n"
			 		+ "<br>"
			 		+ "\r\n"
			 		+ "<h3>"+mailDto.getAddress()+"계정의 비밀번호를 재설정 하려면 하단의 비밀번호 재설정을 클릭하세요.</h3>\r\n"
			 		+ "<h3>문의사항은 kimmtommy@gmail.com으로 연락 주시길 바랍니다 :)</h3>\r\n"
			 		+ "<br>\r\n"
			 		+ "<button type=\"button\" style=\"background-color: #021B80;color: white;border-radius: 5px;width: 120px;height: 50px;\r\n"
			 		+ "line-height: 30px;border: none;font-weight: bold;\">\r\n"
			 		+ "<a href=\"http://localhost:9001/change_password\" style=\"text-decoration: none;color: white;font-weight: bold;\">비밀번호 재설정</a>\r\n"
			 		+ "</button>"
			 		+ "</div>";
			 		
			
			 
			 mailHandler.setText(htmlContent, true);
			 //mailHandler.setAttach(mailDto.getFile().getOriginalFilename(), mailDto.getFile());
			 //mailHandler.setInline("sample-img", mailDto.getFile());
			 mailHandler.send();
		 }
		 catch (Exception e){
		 e.printStackTrace();
		 }
		 }

	
}
