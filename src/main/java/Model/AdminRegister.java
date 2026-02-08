package Model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter

@AllArgsConstructor
@NoArgsConstructor


public class AdminRegister {
	private int id;
	private String name;
	private String email;
	private String contact;
	private String password;
	
}
