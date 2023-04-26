package vo;

public class SimilarVO {
	private String release_date, genre;
	private int number;

	public String getRelease_date() {
		return release_date;
	}

	public void setRelease_date(String release_date) {
		this.release_date = release_date;
	}

	public String getGenre() {
		if (this.genre == null) {
			return "no";
		}
		return genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}
}
