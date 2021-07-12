package job.data.review;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface reviewMapper {

	//email별 리뷰 총 개수 반환
	public int getTotalCount(String email);
	
	//총 리뷰 개수
	public int TotalCount();
	
	//검색 리뷰 개수
	public int TotalCountOfSearch(String empname);
	
	//review테이블 데이터 추가
	public void insertReview(reviewDto dto);
	
	//review테이블 테이터 출력
	public List<reviewDto> getReviewData();
	
	//review기업명 조회
	public List<reviewDto> selectEmpname(int start, int perpage);
	
	//review기업명 조회- 리뷰많은 순
	public List<reviewDto> selectEmpnameOflargest(int start, int perpage);
	
	//review기업명 조회- 평점높은 순
	public List<reviewDto> selectEmpnameOfrating(int start, int perpage);
	
	//review기업명 조회 - 도움이돼요 순
	public List<reviewDto> selectEmpnameOfhelpful(int start, int perpage);
	
	//review기업명 개수(중복제외)
	public int selectEmpnameCount();
	
	//기업평가 평균
	public float avgRating(String empname);

	//사내문화 평균
	public float avgCul(String empname);

	//자기개발 평균
	public float avgImp(String empname);

	//근무환경 평균
	public float avgEnv(String empname);

	//급여 및 복지 평균
	public float avgSal(String empname);

	//경영진 평균
	public float avgCeo(String empname);
	
	//기업명 별 리뷰개수
	public int review0fEmp(String empname);
	
	//기업명 검색
	public List<reviewDto> searchEmpname(String empname);
	
	//조회수 증가 update
	public void insertReviewOflikes(String num);
	
	//추천 누른 email 데이터 insert
	public void insertlikes(String email, String num);
	
	//likes 추천했으면1 안했으면0 반환
	public int countOflikes(String email, String num);
	
	//num에 해당하는 데이터, 좋아요 수 
	public int countOfReviewLikes(String num);
	
	//리뷰 추천 많은 순으로 장점 2개 출력
	public List<reviewDto> likesGood(String empname);

	//my기업리뷰 email로 작성한 리뷰 출력
	public List<reviewDto> myreviewOfEmail(String email);
	
	//my기업리뷰 삭제
	public void deleteReview(int num);
	
	//my기업리뷰 수정
	public void updateReview(reviewDto dto);
	
	public List<reviewDto> getData(int num);
	
	
	/* 관리자페이지에 출력 */
	public List<reviewDto> getAllReview();
	
	public void deleteAdminReview(String num);

	public List<reviewDto> getReviewDataOfEmp(HashMap<String, Object> map);	

}