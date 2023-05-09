package vo;

public class MovieMate_MovieVO {
	private int movie_idx, attandance;
	double star_score;
	private String profile_img, title, release_date, running_time, film_rating;
	private String movie_info, genre, company, background_img, nation;

	public String getNation() {
		if(this.nation == null) {
			return "국가표시 없음";
		}
		return nation;
	}

	public double getStar_score() {
		return star_score;
	}

	public void setStar_score(double star_score) {
		this.star_score = star_score;
	}

	public void setNation(String nation) {
		this.nation = nation;
	}

	public int getMovie_idx() {
		return movie_idx;
	}

	public void setMovie_idx(int movie_idx) {
		this.movie_idx = movie_idx;
	}

	public int getAttandance() {
		return attandance;
	}

	public void setAttandance(int attandance) {
		this.attandance = attandance;
	}

	public String getProfile_img() {
		return profile_img;
	}

	public void setProfile_img(String profile_img) {
		this.profile_img = profile_img;
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

	public String getRunning_time() {
		return running_time;
	}

	public void setRunning_time(String running_time) {
		this.running_time = running_time;
	}

	public String getFilm_rating() {
		return film_rating;
	}

	public void setFilm_rating(String film_rating) {
		this.film_rating = film_rating;
	}

	public String getMovie_info() {
		return movie_info;
	}

	public void setMovie_info(String movie_info) {
		this.movie_info = movie_info;
	}

	public String getGenre() {
		return genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getBackground_img() {
		return background_img;
	}

	public void setBackground_img(String background_img) {
		this.background_img = background_img;
	}

}
