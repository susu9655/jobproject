package job.data.emplogin;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("empAccount")
public class EmpAccountDto {
	private long num;
	private String empname;
	private String empserial;
	private String country;
	private String area;
	private String addr;
	private String biztype ;
	private String staffnum ; 
	private String establishyear;
	private Timestamp create_date;
	private String managername;
	private String team;
	private String hp ;
	private String email ;
	private String password;
		
}


