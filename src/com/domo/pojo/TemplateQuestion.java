package com.domo.pojo;
import java.io.Serializable;
import java.sql.Array;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Set;

import javax.persistence.*;

import org.codehaus.jackson.annotate.JsonBackReference;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;


@Entity
@Table(name="template_question")
@JsonIgnoreProperties(ignoreUnknown = true)
public class TemplateQuestion implements Serializable{
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="template_question_id")
	private int template_question_id;
	@JsonBackReference
	@ManyToOne(cascade = CascadeType.ALL, optional=true)
	@PrimaryKeyJoinColumn(name="set_exam_id")
	private SetExam templatequestionsetexam;
	@Column(name="question_number")
	private int question_number;
	@Column(name="user_answer")
	private String user_answer;
	
	//default ctor
	public TemplateQuestion() {
		super();
		// TODO Auto-generated constructor stub
	}
	public TemplateQuestion(int template_question_id){
		super();
		this.template_question_id = template_question_id;
	}
	public TemplateQuestion(String user_answer){
		super();
		this.user_answer = user_answer;
	}
	//parameterized ctor
	public TemplateQuestion(int template_question_id, int question_number, String user_answer) {
		super();
		this.template_question_id = template_question_id;
		this.question_number = question_number;
		this.user_answer = user_answer;
	}

	//getters and setters
	public int getTemplate_question_id() {
		return template_question_id;
	}
	public SetExam getSetexam() {
		return templatequestionsetexam;
	}
	public void setSetexam(SetExam setexam) {
		this.templatequestionsetexam = setexam;
	}
	public int getQuestion_number() {
		return question_number;
	}
	public String getUser_answer() {
		return user_answer;
	}

	public void setUser_answer(String user_answer) {
		this.user_answer = user_answer;
	}

	public void setQuestion_number(int question_number) {
		this.question_number = question_number;
	}
	public SetExam getTemplatequestionsetexam() {
		return templatequestionsetexam;
	}

	public void setTemplatequestionsetexam(SetExam templatequestionsetexam) {
		this.templatequestionsetexam = templatequestionsetexam;
	}

	public void setTemplate_question_id(int template_question_id) {
		this.template_question_id = template_question_id;
	}
	
	//toString method
	@Override
	public String toString() {
		return "TemplateQuestion [template_question_id=" + template_question_id
				+ ", templatequestionsetexam=" + templatequestionsetexam + ", user_answer=" + user_answer +"]";
	}
}