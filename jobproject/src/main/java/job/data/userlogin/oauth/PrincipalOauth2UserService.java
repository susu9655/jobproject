package job.data.userlogin.oauth;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;

import job.data.userlogin.UserAccountDto;
import job.data.userlogin.UserAccountMapper;
import job.data.userlogin.auth.PrincipalDetails;

@Service
public class PrincipalOauth2UserService extends DefaultOAuth2UserService {

	
	BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();


	@Autowired
	private UserAccountMapper mapper;

	// 구글로 부터 받은 userRequest 데이터에 대한 후처리되는 함수
	// 함수 종료 시 @AuthenticationPrincipal 어노테이션이 만들어진다.
	@Override
	public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {
		System.out.println("getClientRegistration:" + userRequest.getClientRegistration()); // registrationId로 어떤 OAuth로
																							// 로그인 했는지 확인가능
		System.out.println("getAccessToken:" + userRequest.getAccessToken().getTokenValue());

		OAuth2User oauth2User = super.loadUser(userRequest);
		// 구글로그인 버튼 클릭 -> 구글로그인창 -> 로그인을 완료 -> code를 리턴(OAuth-Client라이브러리)-> AccessToken
		// 요청
		// userRequest 정보 -> loadUser함수 호출 -> 구글로부터 회원프로필을 받아준다.
		System.out.println("getAttributes:" + oauth2User.getAttributes());
		// super.loadUser(userRequest)는 oauth2User와 같음

		// 회원가입을 강제로 진행해볼 예정
		String provider = userRequest.getClientRegistration().getClientId(); // google
		String providerId = oauth2User.getAttribute("sub");
		String username = provider + "_" + providerId; // google_101694748626160433549
		String hp = "01034567890";
		String password = passwordEncoder.encode("겟인데어");
		String email = oauth2User.getAttribute("email");
		String role = "ROLE_USER";

		UserAccountDto userEntity = mapper.findByUsername(username);

		if (userEntity == null) {
			System.out.println("구글 로그인이 최초입니다");
			userEntity = UserAccountDto.builder().username(username).hp(hp).password(password).email(email).role(role)
					.provider(provider).providerId(providerId).build();
			mapper.insertUserAccount(userEntity);
		} else {
			System.out.println("구글 로그인을 이미 한적이 있습니다. 당신은 자동회원가입이 되어 있습니다.");
		}
		return new PrincipalDetails(userEntity, oauth2User.getAttributes()); // 얘가 만들어져서 Authentication 객체안에 들어갈거임
	}

}
