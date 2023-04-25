package vo;

public class Movie_UserVO {
	private int movie_idx, user_idx;
	double star_score;
	private String want_view;

	public int getMovie_idx() {
		return movie_idx;
	}

	public void setMovie_idx(int movie_idx) {
		this.movie_idx = movie_idx;
	}

	public int getUser_idx() {
		return user_idx;
	}

	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
	}

	public double getStar_score() {
		return star_score;
	}

	public void setStar_score(double star_score) {
		this.star_score = star_score;
	}

	public String getWant_view() {
		return want_view;
	}

	public void setWant_view(String want_view) {
		this.want_view = want_view;
	}

}
