package job.data.news;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface newsMapper {

	//데이터 개수
	public int getTotalCount();
	
	//전체 데이터 반환(메인페이지-페이징처리)
	public List<newsDto> getDataOfNews(int start, int perpage);
	
	//num에 해당하는 데이터 반환(상세페이지)
	public List<newsDto> getDataOfNum(String num);
	
	//뉴스 최신일자 4개 출력(메인페이지-최신뉴스)
	public List<newsDto> getLatestData();
	
	//기사 클릭 조회수 증가
	public void readcount (String num);
	
	//조회수 조회
	public int getReadcount(String num);
	
	//기사 제목 검색
	public List<newsDto> searchNews(String title);

}
