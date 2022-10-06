package kr.ac.kopo.model;

public class MemberVO {
	
	String MemId;
	String MemMail;
	String MemPass;
	String MemName;
	String Admin;

	public String getMemId() {
		return MemId;
	}

	public void setMemId(String memId) {
		MemId = memId;
	}

	public String getMemMail() {
		return MemMail;
	}

	public void setMemMail(String memMail) {
		MemMail = memMail;
	}

	public String getMemPass() {
		return MemPass;
	}

	public void setMemPass(String memPass) {
		MemPass = memPass;
	}

	public String getMemName() {
		return MemName;
	}

	public void setMemName(String memName) {
		MemName = memName;
	}

	public String getAdmin() {
		return Admin;
	}

	public void setAdmin(String admin) {
		Admin = admin;
	}

	@Override
	public String toString() {
		return "MemberVO [MemId=" + MemId + ", MemMail=" + MemMail + ", MemPass=" + MemPass + ", MemName=" + MemName
				+ ", Admin=" + Admin + "]";
	}
	
	
	
}
