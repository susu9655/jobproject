package job.data.salary;

import org.apache.ibatis.type.Alias;
import lombok.Data;

@Data
@Alias("salary")
public class salaryDto {

	private String job;
	private String jobgroup;
	private int career;
	private int salary;
}