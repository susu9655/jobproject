package job.data.resume;

import java.sql.Timestamp;
import java.util.List;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Alias("resume")
@Data
public class ResumeDto {
	private int num_r;
	private int user_id;
	private String intro;
	private String skill;
	private String link;
	private Timestamp nowdate;
	private List<AwardDto> award;
	private List<CarerDto> carer;
	private List<EducationDto> education;
	private List<ForeDto> fore;
	
	
}
