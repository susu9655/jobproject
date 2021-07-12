package job.data.userlogin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserAccountMapper {

	public int getTotalCountOfUserAccount();
	public void insertUserAccount(UserAccountDto dto);
	
	//@Select("SELECT * FROM user_account WHERE username = #{username}")
	public UserAccountDto findByUsername(String username);
	
//	public int loginCheckOfUserAccount(String email, String pass);
//	
//	public UserAccountDto getUser(String id);
//	
//	public int passCheck(String id,String pass);
//	
//	public void updateOfUserAccount(UserAccountDto dto);
//	
	public void deleteUserAccount(String id);
	public void updatePasswordOfuser(Map<String, String>map);
	public void updateUser(UserAccountDto dto);
	
	/* 관리자페이지에 출력 */
	public List<UserAccountDto> getAllUserAccount();

}
