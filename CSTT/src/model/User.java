package model;

public class User {
	String id;
	String name;
	String specialization;
	Double CPA;
	
	public User() {
		super();
	}
	
	public User(String id, String name, String specialization) {
		super();
		this.id = id;
		this.name = name;
		this.specialization = specialization;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSpecialization() {
		return specialization;
	}

	public void setSpecialization(String specialization) {
		this.specialization = specialization;
	}

	public Double getCPA() {
		return CPA;
	}

	public void setCPA(Double cPA) {
		CPA = cPA;
	}

	
	
	
}
