package job.data.salary;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SalaryMapper {

	//직군, 직무 검색시 연차별 연봉 출력
	public List<salaryDto> SearchJob(String job, String jobgroup);

	//salarylist 초기값
	public List<salaryDto> salarydefault();
	
	//직군, 직군, 연차에 따른 연봉값 출력
	public int SearchSal(String job, String jobgroup, String career);
}
