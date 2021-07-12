package job.data.emplogin;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
@Mapper
public interface EmpAccountMapper {

	public int getTotalCountOfEmp();
	public int emailCheckOfEmp(String email);
	public void insertOfEmp(EmpAccountDto dto);
	public int loginCheckOfEmp(String email,String password);
	public String searchEmpName(String email);
	public String searchEmpNum(String email);
	public String searchAddr(String empname);
	//@Select("SELECT * FROM user_account WHERE username = #{username}")
	public EmpAccountDto findByEmpname(String Empname);
	public EmpAccountDto getdataOfEmp(String num);
	public void updateOfEmp(EmpAccountDto dto);
	/* 관리자페이지에 출력 */
	public List<EmpAccountDto> getAllEmpAccount();
	
	public void deleteEmpAccount(String num);
	
	//기업리뷰 사용
	//회사 정보 출력
	public List<EmpAccountDto> getEmpData(String empname);
}
