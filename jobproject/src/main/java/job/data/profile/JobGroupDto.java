package job.data.profile;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("jobgroup")
public class JobGroupDto {
	private int num_s;
	private int id;
	private String job_group;
	private String job;
	private int career;
}
