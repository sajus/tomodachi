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
import org.codehaus.jackson.annotate.JsonBackReference;
import org.springframework.beans.factory.annotation.Autowired;


@Entity
@Table(name="template_question")
@JsonIgnoreProperties(ignoreUnknown = true)
public class TemplateQuestion implements Serializable{
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="template_question_id")
	private int template_question_id;
	@ManyToOne
	@PrimaryKeyJoinColumn(name="set_exam_id")
	public SetExam templatequestionsetexam;
	@Column(name="question_number")
	private int question_number;
	@Column(name="user_answer")
	private String user_answer;
	
	//default ctor
	public TemplateQuestion() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	//parameterized ctor
	public TemplateQuestion(int template_question_id, int question_number, String user_answer, SetExam templatequestionsetexam) {
		super();
		this.template_question_id = template_question_id;
		this.question_number = question_number;
		this.user_answer = user_answer;
		this.templatequestionsetexam = templatequestionsetexam;
	}

	//getters and setters
	public int getTemplate_question_id() {
		return template_question_id;
	}
	public SetExam getSetexam() {
		return templatequestionsetexam;
	}
	public void setSetexam(SetExam templatequestionsetexam) {
		this.templatequestionsetexam = templatequestionsetexam;
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
	
	//toString method
	@Override
	public String toString() {
		return "TemplateQuestion [template_question_id=" + template_question_id
				+ ", templatequestionsetexam=" + templatequestionsetexam + ", user_answer=" + user_answer +"]";
	}
}