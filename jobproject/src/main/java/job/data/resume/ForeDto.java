package job.data.resume;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Alias("fore")
@Data
public class ForeDto {
	private int num_f;
	private int num_r;
	private String lang;
	private String level;
}
