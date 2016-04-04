package com.domo.pojo;
import java.io.Serializable;

import javax.persistence.*;

import org.codehaus.jackson.annotate.JsonBackReference;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;
@Entity
@Table(name="template_module_level")
@JsonIgnoreProperties(ignoreUnknown = true)
public class TemplateModuleLevel implements Serializable{
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="template_module_level_id")
	private int template_module_level_id;
	@ManyToOne
	@JoinColumn(name="module_id")
	private TemplateModules templatemodules;
	@ManyToOne
	@JoinColumn(name="level_id")
	private Level level;
	@Column(name="count")
	private int count;
	@ManyToOne
	@JoinColumn(name="template_id")
	private TemplateModules templatemodules_count;
	//default ctor
	public TemplateModuleLevel() {
	}
	//parameterized ctor
	public TemplateModuleLevel(int template_module_level_id, int count) {
		super();
		this.template_module_level_id = template_module_level_id;
		this.count = count;
	}
	//getters and setters
	public Level getLevel() {
		return level;
	}
	public void setLevel(Level level) {
		this.level = level;
	}
	public int getTemplate_module_level_id() {
		return template_module_level_id;
	}
	public void setTemplate_module_level_id(int template_module_level_id) {
		this.template_module_level_id = template_module_level_id;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	//toString method
	@Override
	public String toString() {
		return "TemplateModuleLevel [template_module_level_id="
				+ template_module_level_id + ", template_module_id="
				 + ", level_id=" + ", count="
				+ count + ", template_id=" +  "]";
	}
}