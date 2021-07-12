package job.data.faq;


import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("faq")
public class FaqDto {
	private int num;
	private String member;
	private String subject;
	private String content;
}
