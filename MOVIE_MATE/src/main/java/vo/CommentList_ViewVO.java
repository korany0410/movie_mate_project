package vo;

public class CommentList_ViewVO {
	private int user_idx, comment_idx, up, m_ref;
	private double star_score;
	private String username, profile_img, content, regdate, want_view;

	public int getUser_idx() {
		return user_idx;
	}

	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
	}

	public int getComment_idx() {
		return comment_idx;
	}

	public void setComment_idx(int comment_idx) {
		this.comment_idx = comment_idx;
	}

	public int getUp() {
		return up;
	}

	public void setUp(int up) {
		this.up = up;
	}

	public int getM_ref() {
		return m_ref;
	}

	public void setM_ref(int m_ref) {
		this.m_ref = m_ref;
	}

	public double getStar_score() {
		return star_score;
	}

	public void setStar_score(double star_score) {
		this.star_score = star_score;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getProfile_img() {
		return profile_img;
	}

	public void setProfile_img(String profile_img) {
		this.profile_img = profile_img;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public String getWant_view() {
		return want_view;
	}

	public void setWant_view(String want_view) {
		this.want_view = want_view;
	}

}
