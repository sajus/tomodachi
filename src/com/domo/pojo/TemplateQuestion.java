package com.domo.pojo;
import java.io.Serializable;
import java.sql.Array;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Set;

import javax.persistence.*;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;


@Entity
@Table(name="template_question")
@JsonIgnoreProperties(ignoreUnknown = true)
public class TemplateQuestion implements Serializable{
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="template_question_id")
	private int template_question_id;
	@ManyToOne(cascade = CascadeType.ALL, optional=true)
	@PrimaryKeyJoinColumn(name="set_exam_id")
	private SetExam templatequestionsetexam;
	@Column(name="question_number")
	private int question_number;
	@Column(name="user_answer")
	private int user_answer;
	
	//default ctor
	public TemplateQuestion() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	//parameterized ctor
	public TemplateQuestion(int template_question_id, SetExam templatequestionsetexam, int question_number) {
		super();
		this.template_question_id = template_question_id;
		this.templatequestionsetexam = templatequestionsetexam;
		this.question_number = question_number;
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

	//toString method
	@Override
	public String toString() {
		return "TemplateQuestion [template_question_id=" + template_question_id
				+ ", templatequestionsetexam=" + templatequestionsetexam + ", user_answer=" + user_answer +"]";
	}
}