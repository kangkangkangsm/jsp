package model;

public class Project {
	private String name;
	private	String user_id;	
	private	String password;
	private	String resident_registration_number;
	private	String address;
	private	String email;
	private	String phone_number;
	private	String gender;
	private	String volunteer_region;
	private	String desired_activity;
	private	String special_skills;
	private String created_at;
	private String user_grade;
	
	 public Project(String name,String user_id,String password,String resident_registration_number,String address,String email,
			 String phone_number,String gender,String volunteer_region,String desired_activity,String special_skills,String created_at,String user_grade) {
		this.name = name;
		this.user_id = user_id;	
		this.password = password;
		this.resident_registration_number = resident_registration_number;
		this.address = address;
		this.email = email;
		this.phone_number = phone_number;
		this.gender = gender;
		this.volunteer_region = volunteer_region;
		this.desired_activity = desired_activity;
		this.special_skills = special_skills;
		this.created_at = created_at;
		this.user_grade = user_grade;
	 }
	public String getName() {
		return name;
	}
	public String getUser_id() {
		return user_id;
	}
	public String getPassword() {
		return password;
	}
	public String getResident_registration_number() {
		return resident_registration_number;
	}
	public String getAddress() {
		return address;
	}
	public String getEmail() {
		return email;
	}
	public String getPhone_number() {
		return phone_number;
	}
	public String getGender() {
		return gender;
	}
	public String getVolunteer_region() {
		return volunteer_region;
	}
	public String getDesired_activity() {
		return desired_activity;
	}
	public String getSpecial_skills() {
		return special_skills;
	}
	public String getCreated_at() {
		return created_at;
	}
	public String getUser_grade() {
		return user_grade;
	}
}
