package vo;

public class CastList_ViewVO {
	private String name;
	private double avg;
	private int count, cast_idx;

	public int getCast_idx() {
		return cast_idx;
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

	public double getAvg() {
		return avg;
	}

	public void setAvg(double avg) {
		this.avg = avg;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

}
