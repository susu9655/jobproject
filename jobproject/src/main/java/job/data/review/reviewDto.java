package job.data.review;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("review")
public class reviewDto {

	private int num;
	private String email;
	private String empname;
	private String prenow;
	private String job_group;
	private String good;
	private String bad;
	private float rating;
	private int cul;
	private int imp;
	private int env;
	private int sal;
	private int ceo;
	private int likes;
	private Timestamp writeday;
	
}