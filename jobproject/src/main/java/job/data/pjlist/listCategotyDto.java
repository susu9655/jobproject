package job.data.pjlist;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("listCate")
public class listCategotyDto {
	private int idx;
	private String ctg;
	private String ctg_idx;
	private String tag;
	private String tag_idx;
	private int num;

}
