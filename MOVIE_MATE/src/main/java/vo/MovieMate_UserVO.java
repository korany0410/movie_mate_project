package vo;

import org.springframework.web.multipart.MultipartFile;

public class MovieMate_UserVO {
	private int user_idx;
	private String email, pwd, username, regdate, profile_img, type;
	private MultipartFile photo;

	public MultipartFile getPhoto() {
		return photo;
	}

	public void setPhoto(MultipartFile photo) {
		this.photo = photo;
	}

	public int getUser_idx() {
		return user_idx;
	}

	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public String getProfile_img() {
		if (this.profile_img == null) {
			return "no_data.jpg";
		}
		return profile_img;
	}

	public void setProfile_img(String profile_img) {
		this.profile_img = profile_img;
	}

	public String getType() {
		if (this.type == null) {
			return "common";
		}
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

}
