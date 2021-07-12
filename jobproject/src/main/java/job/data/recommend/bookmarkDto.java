package job.data.recommend;

import org.apache.ibatis.type.Alias;
import lombok.Data;

@Data
@Alias("bookmark")
public class bookmarkDto {

	private int num_b;
	private int num;
	private int id;
	
}
