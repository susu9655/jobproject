package job.data.gonggo;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import job.data.emplogin.EmpAccountDto;

@Mapper
public interface CompanyMapper {
	public List<CompanyDto> getAlldatas(String num);
	public List<CompanyDto> getmygonggo(String empname);
	public CompanyDto getData(String num);
	public EmpAccountDto searchaddr(String empname);
	
	public void insertGonggo(CompanyDto dto);
	public int getInsertNum();
	public void insertCategory(CategoryDto dto);
	
	public void deleteGonggo(String num);
	public void deleteCategory(String num);
	
	public void updateGonggo(CompanyDto dto);
	public void updateCategory(CategoryDto dto);
	public void insertmoney(CompanyDto dto);
	
	//bookmark되어있는지 확인
	public int searchNum(Map<String, String>map);
	//bookmark값 삽입
	public void insertBookmark(Map<String, String>map);
	//bookmark 삭제
	public void deleteBookmark(Map<String, String>map);
	//북마크한 총 개수
	public int getCountOfBookmark(String id);
	//개인별 북마크한 값 가져오기
	public List<CompanyDto> getListOfCompany(String idp);
	//개인별 북마크한 값 가져오기-페이징 처리
	public List<CompanyDto> getListOfCompany_paging(Map<String, Object>map);
	//개인별 북마크한 값에서 검색한 값-페이징 처리
	public List<CompanyDto> getListOfCompany_paging_book(Map<String, Object>map);
	public int getCountOfBookmark_search(Map<String, Object>map);
	//apply 삽입
	public void insertApply(ApplyDto dto);
	//apply 개수
	public int getCountOfApply(String id);
	//apply여부
	public int checkApply(Map<String, String>map);
	//개인별 지원한 기업 가져오기-페이징 처리
	public List<CompanyDto> getApplyListOfCompany_paging(Map<String, Object>map);
	//개인별 지원한 기업 가져오기
	public List<CompanyDto> getApplyListOfCompany(String id);
	//apply 삭제
	public void deleteApply(Map<String, String>map);
	
	//관리자페이지 출력
	public List<CompanyDto> getAllCompany();
	

	//태그로 채용공고 검색
	public List<CompanyDto> searchListByTag(String tag);
	//jobgroup 으로 채용공고 검색
	public List<CompanyDto> searchByJob(String jobgroup);
	//지역으로 채용공고 검색
	public List<CompanyDto> searchByArea(String addr);
	
}