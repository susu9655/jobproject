package job.data.gonggo;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("apply")
public class ApplyDto {
	private String apply_num;
	private String num;
	private String num_r;
	private String id;
}
