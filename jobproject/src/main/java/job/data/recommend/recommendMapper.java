package job.data.recommend;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface recommendMapper {
	
	//추천공고
	public List<recommendDto> recommendData(String job);
	
	//북마크 유무
	public int bookmarkCheck(int id, int num);
	
	//북마크 저장
	public void insertBookmark(int id, int num);
	
	//북마크 삭제
	public void deleteBookmark(int id, int num);
	
	//북마크 데이터 출력
	public List<bookmarkDto> bookdata(int id);
	
	//전체 공고
	public List<recommendDto> totalData();
}
