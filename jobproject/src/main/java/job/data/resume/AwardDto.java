package job.data.resume;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Alias("award")
@Data
public class AwardDto {
	private int num_a;
	private int num_r;
	private String activity;
	private String detail;
	private String a_startday;
	private String a_endday;
}
