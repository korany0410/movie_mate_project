package vo;

/**
 * @author MINZI
 *
 */
public class CommentList_ViewVO {
	private int movie_idx, user_idx, comment_idx, up, m_ref, count;
	private double star_score;
	private String username, user_profile_img, movie_profile_img, content, regdate, want_view, title, release_date,
			isup;

	public String getIsup() {
		if(this.isup == null) {
			return "no";
		}
		return isup;
	}

	public void setIsup(String isup) {
		this.isup = isup;
	}

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

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getRelease_date() {
		return release_date;
	}

	public void setRelease_date(String release_date) {
		this.release_date = release_date;
	}

	public int getMovie_idx() {
		return movie_idx;
	}

	public String getUser_profile_img() {
		return user_profile_img;
	}

	public void setUser_profile_img(String user_profile_img) {
		this.user_profile_img = user_profile_img;
	}

	public String getMovie_profile_img() {
		return movie_profile_img;
	}

	public void setMovie_profile_img(String movie_profile_img) {
		this.movie_profile_img = movie_profile_img;
	}

	public void setMovie_idx(int movie_idx) {
		this.movie_idx = movie_idx;
	}

}
