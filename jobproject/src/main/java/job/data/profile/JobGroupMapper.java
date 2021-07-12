package job.data.profile;

import java.util.List;

public interface JobGroupMapper {
	public void insertJobOfJobGroup(JobGroupDto dto);
	public int searchIdOfJobGroup(int id);
	public void updateJobOfJobGroup(JobGroupDto dto);
	public JobGroupDto getDataOfJobGroup(int id);
	
	//추천공고 직군 얻기
	public String getJobdata(int id);
}
