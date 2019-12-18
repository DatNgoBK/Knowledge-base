package model;

import model.Course.Group;

public class Course {
	String id;
	String number;
	String name;
	int credit;
	String group;
	String semester;
	String keywords;
	String preRequest;
	
	public enum Group {
		CORE,ELEC_CORE,CORE_IT,CS,ELEC_CS,IS,ELEC_IS,SE,ELEC_SE,CE,ELEC_CE,NC,ELEC_NC,NONE;
    }
	
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getCredit() {
		return credit;
	}
	public void setCredit(int credit) {
		this.credit = credit;
	}
	public String getGroup() {
		return group;
	}
	public void setGroup(String group) {
		this.group = group;
	}
	public String getSemester() {
		return semester;
	}
	public void setSemester(String semester) {
		this.semester = semester;
	}
	public String getKeywords() {
		return keywords;
	}
	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}
	public String getPreRequest() {
		return preRequest;
	}
	public void setPreRequest(String preRequest) {
		this.preRequest = preRequest;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int level() {
		String s = getNumber().split(" ")[1];
		return Integer.valueOf(s.substring(0, 1));
	}
	
	public static Group asGroup(String group) {
        switch (group) {
            case "CS":
                return Group.CS;
            case "IS":
                return Group.IS;
            case "SE":
                return Group.SE;
            case "NC":
                return Group.NC;
            case "CE":
                return Group.CE;
            case "ELEC_CS":
                return Group.ELEC_CS;
            case "ELEC_IS":
                return Group.ELEC_IS;
            case "ELEC_SE":
                return Group.ELEC_SE;
            case "ELEC_NC":
                return Group.ELEC_NC;
            case "ELEC_CE":
                return Group.ELEC_CE; 
            case "CORE":
                return Group.CORE;
            case "ELEC_CORE":
                return Group.ELEC_CORE;
            case "CORE_IT":
                return Group.CORE_IT; 
        }
        return Group.NONE;
    }
	
	public static boolean checkGroup(Course.Group studentGroup, Course.Group courseGroup) {
		if(studentGroup==Group.CE && courseGroup == Group.ELEC_CE) return true;
		if(studentGroup==Group.SE && courseGroup == Group.ELEC_SE) return true;
		if(studentGroup==Group.CS && courseGroup == Group.ELEC_CS) return true;
		if(studentGroup==Group.NC && courseGroup == Group.ELEC_NC) return true;
		if(studentGroup==Group.IS && courseGroup == Group.ELEC_IS) return true;
		return false;
	}
}
