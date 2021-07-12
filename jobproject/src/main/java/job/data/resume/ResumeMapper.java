package job.data.resume;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ResumeMapper {
	//user_id에 해당하는 이력서 데이터 가져오기
	public List<ResumeDto> getDataOfResume(String user_id);
	
	//num_r에 해당하는 이력서 출력
	public ResumeDto getResumeOneData(String num_r);
	
	//num_r에 해당하는 이력서 삭제
	public void delresume(String num_r);
	public void delAward(String num_r);
	public void delEducation(String num_r);
	public void delFore(String num_r);
	public void delCarer(String num_r);
	
	//user 데이터 insert
	public void insertResume(ResumeDto rdto);
	public int getInsertNum();//삽입된 key값 가져오는 메서드
	public void insertAward(AwardDto adto);
	public void insertCarer(CarerDto cdto);
	public void insertEducation(EducationDto edto);
	public void insertFore(ForeDto fdto);
	
	//user 데이터 update
	public void updateResume(ResumeDto rdto);
	public void updateAward(AwardDto adto);
	public void updateCarer(CarerDto cdto);
	public void updateEducation(EducationDto edto);
	public void updateFore(ForeDto fdto);
	
	
	//기업리뷰 사용
	//로그인시 경력사항 기업출력
	public List<CarerDto> getIdCareer(int user_id);
	
}
