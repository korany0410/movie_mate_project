 package vo;

public class MovieMate_CastVO {
	private int cast_idx;
	private String name, type, profile_img;

	public int getCast_idx() {
		return cast_idx;
	}

	public String getProfile_img() {
		return profile_img;
	}

	public void setProfile_img(String profile_img) {
		this.profile_img = profile_img;
	}

	public void setCast_idx(int cast_idx) {
		this.cast_idx = cast_idx;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

}
