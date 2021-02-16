package member;

import java.sql.Timestamp;

public class MemberBean {

		private String id;
		private String pass;
		private String name;
		private String email;
		private String address;
		private String phone;
		private String mobile;
		private String roadAddress;
		private String detailAddress;
		private String jibunAddress;
		private String extraAddress;
		
		public String getRoadAddress() {
			return roadAddress;
		}
		public void setRoadAddress(String roadAddress) {
			this.roadAddress = roadAddress;
		}
		public String getDetailAddress() {
			return detailAddress;
		}
		public void setDetailAddress(String detailAddress) {
			this.detailAddress = detailAddress;
		}
		public String getJibunAddress() {
			return jibunAddress;
		}
		public void setJibunAddress(String jibunAddress) {
			this.jibunAddress = jibunAddress;
		}
		public String getExtraAddress() {
			return extraAddress;
		}
		public void setExtraAddress(String extraAddress) {
			this.extraAddress = extraAddress;
		}
		public String getEmail() {
			return email;
		}
		public void setEmail(String email) {
			this.email = email;
		}
		public String getAddress() {
			return address;
		}
		public void setAddress(String address) {
			this.address = address;
		}
		public String getPhone() {
			return phone;
		}
		public void setPhone(String phone) {
			this.phone = phone;
		}
		public String getMobile() {
			return mobile;
		}
		public void setMobile(String mobile) {
			this.mobile = mobile;
		}
		private Timestamp reg_date;

		public String getId() {
			return id;
		}
		public void setId(String id) {
			this.id = id;
		}
		public String getPass() {
			return pass;
		}
		public void setPass(String pass) {
			this.pass = pass;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public Timestamp getReg_date() {
			return reg_date;
		}
		public void setReg_date(Timestamp reg_date) {
			this.reg_date = reg_date;
		}
		
		
		
	

}
