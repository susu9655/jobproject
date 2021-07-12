package job.data.profile;

import org.apache.ibatis.type.Alias;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
@Alias("mail")
public class MailDto {
	private String address;
    private String title;
    private String message;
    private String name;
    private MultipartFile file;
}
