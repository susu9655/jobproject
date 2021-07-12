package job.data.gonggo;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("category")
public class CategoryDto {
	private int idx;
	private String tag;
	private int num;
}
