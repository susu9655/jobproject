package job.data.userlogin.auth;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import job.data.userlogin.UserAccountDto;
import job.data.userlogin.UserAccountMapper;


@Service 
public class PrincipalDetailsService implements UserDetailsService{
	
	
	@Autowired
	private UserAccountMapper mapper;
	
	// 시큐리티 session(내부 Authentication(내부 UserDtaile))
	//함수 종료 시 @AuthenticationPrincipal 어노테이션이 만들어진다.
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		System.out.println("username:"+username);
		UserAccountDto userEntity=mapper.findByUsername(username);
		System.out.println(userEntity.getId());
		if(userEntity!= null ) {
			return new PrincipalDetails(userEntity); //PrincipalDetails가 리턴될때 리턴된 값이 authentication에 들어간다
		}
		
		return null;
	}

}
