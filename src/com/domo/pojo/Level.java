package com.domo.pojo;
import java.io.Serializable;
import java.util.Set;
import javax.persistence.*;
@Entity
@Table(name="level")
public class Level implements Serializable{
	@Id
	@Column(name="level_id")
	@GeneratedValue(strategy=GenerationType.AUTO)
     private int level_id;
	@Column(name="level_name")
     private String level_name;
	@OneToMany(mappedBy="level")
	private Set<Question> questions;
	@OneToMany(mappedBy="level")
	private Set<TemplateModuleLevel> templatemodulelevel;
	//default ctor
     public Level() {
 	}
    //getters and setters
	public int getLevel_id() {
		return level_id;
	}
	public void setLevel_id(int level_id) {
		this.level_id = level_id;
	}
	public String getLevel_name() {
		return level_name;
	}
	public void setLevel_name(String level_name) {
		this.level_name = level_name;
	}
	//toString method
	@Override
	public String toString() {
		return "Level [level_id=" + level_id + ", level_name=" + level_name
				+ "]";
	}
	//parameterized ctor
	public Level(int level_id, String level_name) {
		super();
		this.level_id = level_id;
		this.level_name = level_name;
	}
}