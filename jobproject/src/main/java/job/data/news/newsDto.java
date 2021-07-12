package job.data.news;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;
import lombok.Data;

@Data
@Alias("news")
public class newsDto {
	
	private String num;
	private String title;
	private String content;
	private String file;
	private String image;
	private int readcount;
	private Timestamp writeday;

}