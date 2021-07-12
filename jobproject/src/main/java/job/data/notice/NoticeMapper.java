

package job.data.notice;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import job.data.notice.NoticeDto;

@Mapper
public interface NoticeMapper {
	public int getTotalCount();
	public List<NoticeDto> getAllDatas();
	public void insertNotice(NoticeDto dto);
	public NoticeDto getData(String num_n);
	public void viewCount(String num_n);
	public List<NoticeDto> getPhotoDatas();
	public void updateNotice(NoticeDto dto);
	public void deleteNotice(String num_n);


}
