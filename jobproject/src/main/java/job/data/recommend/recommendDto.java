package job.data.recommend;

import java.sql.Timestamp;
import org.apache.ibatis.type.Alias;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
@Data
@Alias("recommend")
public class recommendDto {

		private int num;
		private String empname;
		private String jobgroup;
		private String job;
		private String empcontent;
		private MultipartFile upload;
		private String empimg;
		private String deadline;
		private Timestamp writeday;
		
}
