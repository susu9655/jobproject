package job.data.resume;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Alias("carer")
@Data
public class CarerDto {
	private int num_c;
	private int num_r;
	private String company;
	private String department;
	private String c_startday;
	private String c_endday;
}
