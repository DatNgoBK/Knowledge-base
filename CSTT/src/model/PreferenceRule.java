package model;

public class PreferenceRule {
	String id;
	String name;
	double mult;
	

	public PreferenceRule() {
		super();
	}
	
	public PreferenceRule(String id, String name, double mult) {
		super();
		this.id = id;
		this.name = name;
		this.mult = mult;
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
	public double getMult() {
		return mult;
	}
	public void setMult(double mult) {
		this.mult = mult;
	}
	
	
}
