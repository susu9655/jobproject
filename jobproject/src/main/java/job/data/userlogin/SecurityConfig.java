package job.data.userlogin;

import org.springframework.beans.factory.annotation.Autowired;

// 1.코드받기(인증), 엑세스토큰(권한), 3.사용자프로필 정보를 가져오고
// 4-1. 그정보를 토대로 회원가입을 자동으로 진행시키기도함
// 4-2. (이메일,전화번호,이름,아이디)쇼핑몰 -> (집주소), 백화점몰 -> (vip등급, 일반등급)
// 추가적인 구성정보가 필요없다면=2번까지만 진행

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import job.data.userlogin.auth.PrincipalDetailsService;
import job.data.userlogin.oauth.PrincipalOauth2UserService;

@Configuration
@EnableWebSecurity //스프링 시큐리티 필터가 스프링 필터체인에 등록이된다.
@EnableGlobalMethodSecurity(securedEnabled = true, prePostEnabled = true) //인덱스컨트롤러의 secured 어노테이션, preAuthorize 어노테이션 활성화
public class SecurityConfig extends WebSecurityConfigurerAdapter {
// 위와같이 설정해주면, 이제 사이트 전체가 잠겨서, 비밀번호를 쳐야 접근할 수 있게 된다. 
//원활한 프로젝트 진행을 위해 일단 페이지의 인증을 해제하자.
	
	@Autowired
	private PrincipalOauth2UserService PrincipalOauth2UserService;
	
	//해당 메서드의 리턴되는 오브젝트를 IOC로 등록해준다.
	@Bean
	BCryptPasswordEncoder encodePwd() {
		return new BCryptPasswordEncoder();
	}
	
	@Override
	public void configure(HttpSecurity http) throws Exception{
		http.csrf().disable();
		http.authorizeRequests()
		.antMatchers("/user/**").authenticated() //user로 매핑된 주소로 들어오면 인증이 필요 //인증만하면 들어갈 수 있는 주소
//		.antMatchers("/emp/**").access("hasRole('ROLE_ADMIN') or hasRole('ROLE_MANAGER')") //로그인해도 어드민이나 매니저권한이 있어야 들어갈수있음
//		.antMatchers("/admin/**").access("hasRole('ROLE_ADMIN')") //어드민권한이 있어야 들어갈 수 있음
		.anyRequest().permitAll() //위주소에 해당하지 않는 나머지 주소들을 요청시 다 허가
		.and()
		.formLogin()
		.loginPage("/loginForm") //니가 로그인폼을 요청해서 로긴을 하면, 내가 defaultSuccessUrl의 "/" 주소로 보내줄건데, 어떤 특정페이지를 요청해서 로그인하게 되면 그 페이지를 열어준다
		.loginProcessingUrl("/login") // "/login"이라는 주소가 호출이 되면 시큐리티가 낚아채서 대신 로그인을 진행해준다. -> 때문에 컨트롤러에 /login을 따로 추가해주지 않아도됨
		.defaultSuccessUrl("/")
		.and()
		.oauth2Login()
		.loginPage("/loginForm") //구글 로그인이 완료된 뒤의 후처리가 필요. tip. 코드X, (엑세스토큰+사용자프로필정보 O)
		.userInfoEndpoint()
		.userService(PrincipalOauth2UserService);
	
	}
}
