package job.data.resume;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Alias("education")
@Data
public class EducationDto {
	private int num_e;
	private int num_r;
	private String school;
	private String major;
	private String e_startday;
	private String e_endday;
}
