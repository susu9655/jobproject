package job.data.admin;


import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AdminMapper {

	public int loginCheckofAdmin(String adminid,String adminpass);

	
}
