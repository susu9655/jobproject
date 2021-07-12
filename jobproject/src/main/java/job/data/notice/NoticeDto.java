package job.data.notice;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonFormat;


import lombok.Data;

@Alias("notice")
@Data

public class NoticeDto {
	
	private String num_n;
	private String writer;
	private String category;
	private String subject;
	private String content;
	private String photo;
	private MultipartFile upload;
	private int viewcount;
	@JsonFormat(pattern="yyyy-MM-dd")
	private Timestamp writeday;

}
