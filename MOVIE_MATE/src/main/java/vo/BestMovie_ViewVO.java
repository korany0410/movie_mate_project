package vo;

public class BestMovie_ViewVO {
	private String nation;
	private double avg;
	private int count;

	public String getNation() {
		if(this.nation == null) {
			return "국가 미표시";
		}
		return nation;
	}

	public void setNation(String nation) {
		this.nation = nation;
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
