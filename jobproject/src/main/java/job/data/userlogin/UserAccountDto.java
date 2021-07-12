package job.data.userlogin;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Alias("user")
@NoArgsConstructor
public class UserAccountDto {
	private long id;
	private String username;
	private String hp;
	private String password; 
	private String email;
	private String role; //ROLE_USER, ROLE_ADMIN
	private String provider;
	private String providerId;
	private Timestamp create_date;
	
@Builder
	public UserAccountDto(String username, String hp, String password, String email, String role,
			String provider, String providerId, Timestamp create_date) {
		super();
		this.username = username;
		this.hp = hp;
		this.password = password;
		this.email = email;
		this.role = role;
		this.provider = provider;
		this.providerId = providerId;
		this.create_date = create_date;
	}
	

	
}
