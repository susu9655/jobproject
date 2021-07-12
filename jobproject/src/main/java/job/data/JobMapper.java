package job.data;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface JobMapper {

	public int getTotalCount();
}
