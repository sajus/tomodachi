package com.domo.pojo;
import java.io.Serializable;
import java.util.Set;

import com.domo.pojo.TemplateModules;

import javax.persistence.*;

import org.hibernate.annotations.GenericGenerator;
@Entity
@Table(name="template")
public class Template implements Serializable{
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="template_id")
	private int template_id;
	@Column(name="template_name")
	private String template_name;
	@Column(name="question_count")
	private int question_count;
	
	@OneToMany(mappedBy="template")
	private Set<TemplateModules> templatemodules;
	@OneToMany(mappedBy="templatemodules_count")
	private Set<TemplateModuleLevel> templatemodulelevel;
	@OneToMany(mappedBy="templatesetexam")
	private Set<SetExam> setexam;
	//default ctor
	public Template() {
	}
	//parameterized ctor
	public Template(int template_id, String template_name, int question_count) {
		this.template_name = template_name;
		this.question_count = question_count;
	}
	//getters and setters
	public String getTemplate_name() {
		return template_name;
	}
	public void setTemplate_name(String template_name) {
		this.template_name = template_name;
	}
	public int getQuestion_count() {
		return question_count;
	}
	public int getTemplate_id() {
		return template_id;
	}
	public void setTemplate_id(int template_id) {
		this.template_id = template_id;
	}
	public void setQuestion_count(int question_count) {
		this.question_count = question_count;
	}
	//toString method
	@Override
	public String toString() {
		return "Template [template_name="
				+ template_name + ", template_id="
				+ template_id + ", question_count=" + question_count + "]";
	}
}