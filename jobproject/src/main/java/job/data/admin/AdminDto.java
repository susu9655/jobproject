package job.data.admin;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("admin")
public class AdminDto {
	String adminid;
	String adminpass;
	
}
