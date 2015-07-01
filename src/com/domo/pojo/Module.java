package com.domo.pojo;
import java.io.Serializable;
import java.util.Set;
import com.domo.pojo.Question;
import javax.persistence.*;
@Entity
@Table(name="module")
public class Module implements Serializable{
	@Id
	@Column(name="module_id")
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int module_id;
	@Column(name="module_name")
	private String module_name;
	@OneToMany(mappedBy="module")
	private Set<Question> questions;
	@OneToMany(mappedBy="module")
	private Set<TemplateModules> templatemodules;
	//default ctor
	public Module() {
		// TODO Auto-generated constructor stub
	}
	//parameterized ctor
	public Module(int module_id, String module_name) {
		super();
		this.module_id = module_id;
		this.module_name = module_name;
	}
	//getters and setters
	public int getModule_id() {
		return module_id;
	}
	public String getModule_name() {
		return module_name;
	}
	public void setModule_name(String module_name) {
		this.module_name = module_name;
	}
	//toString method
	@Override
	public String toString() {
		return "Module [module_id=" + module_id + ", module_name="
				+ module_name + "]";
	}
}