package job.data.gonggo;

import java.sql.Timestamp;
import java.util.List;

import org.apache.ibatis.type.Alias;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
@Alias("company")
public class CompanyDto {
	private int num;
	private String empname;
	private String jobgroup;
	private String job;
	private String empcontent;
	private MultipartFile upload;
	private String empimg;
	private String deadline;
	private Timestamp writeday;
	private String amount;
	private Timestamp guipday;
	private List<CategoryDto> category;
}
