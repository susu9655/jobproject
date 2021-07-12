package job.data.faq;

import java.util.List;

public interface FaqMapper {
	public List<FaqDto> getFaqData();
	public List<FaqDto> getSearchFaq(String content);
	public FaqDto getFaqContent(String num);
}
