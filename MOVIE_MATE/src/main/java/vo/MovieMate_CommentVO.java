package vo;

public class MovieMate_CommentVO {
	private int comment_idx, up, m_ref, c_ref, depth, step, del_info;
	private String com_username, com_content, regdate;

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

	public int getC_ref() {
		return c_ref;
	}

	public void setC_ref(int c_ref) {
		this.c_ref = c_ref;
	}

	public int getDepth() {
		return depth;
	}

	public void setDepth(int depth) {
		this.depth = depth;
	}

	public int getStep() {
		return step;
	}

	public void setStep(int step) {
		this.step = step;
	}

	public int getDel_info() {
		return del_info;
	}

	public void setDel_info(int del_info) {
		this.del_info = del_info;
	}

	public String getCom_username() {
		if(this.com_username == null) {
			return "none";
		}
		return com_username;
	}

	public void setCom_username(String com_username) {
		this.com_username = com_username;
	}

	public String getCom_content() {
		return com_content;
	}

	public void setCom_content(String com_content) {
		this.com_content = com_content;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

}
