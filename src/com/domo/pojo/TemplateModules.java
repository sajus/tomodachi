package com.domo.pojo;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.*;

@Entity
@Table(name="template_modules")
public class TemplateModules implements Serializable{
	@Id
	@Column(name="template_module_id")
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int template_module_id;
	
	@ManyToOne
    @JoinColumn(name="template_id")
	private Template template;
	
	@ManyToOne
    @JoinColumn(name="module_id")
	private Module module;
	
	@OneToMany(mappedBy="templatemodules")
	private Set<TemplateModuleLevel> tempaltemodulelevel;
	
	
	
	
	public TemplateModules(int template_module_id, Template template,
			Module module) {
		super();
		this.template_module_id = template_module_id;
		this.template = template;
		this.module = module;
	}




	//getters and setters
	public int getTemplate_module_id() {
		return template_module_id;
	}
	

	public void setTemplate_module_id(int template_module_id) {
		this.template_module_id = template_module_id;
	}
	
	//toString method
	@Override
	public String toString() {
		return "TemplateModules [template_module_id=" + template_module_id
				+ "]";
	}
}
