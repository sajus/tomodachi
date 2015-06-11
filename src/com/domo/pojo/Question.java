package com.domo.pojo;
import java.io.Serializable;
import java.util.Set;
import javax.persistence.*;
@Entity
@Table(name="question")
public class Question implements Serializable{
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="question_id")
	private String question_id;
	@Column(name="question")
	private String question;
	@Column(name="op1")
	private String op1;
	@Column(name="op2")
	private String op2;
	@Column(name="op3")
	private String op3;
	@Column(name="op4")
	private String op4;
	@Column(name="answer")
	private int answer;
	@ManyToOne
	@JoinColumn(name="module_id")
	private Module module;
	@ManyToOne
	@JoinColumn(name="level_id")
	private Level level;
	@OneToMany(mappedBy="question")
	private Set<UserAnswer> useranswer;
	//default ctor
	public Question() {
	}
	//paramterized ctor
	public Question(String question_id, String question, String op1, String op2,
			String op3, String op4, int answer) {
		super();
		this.question_id = question_id;
		this.question = question;
		this.op1 = op1;
		this.op2 = op2;
		this.op3 = op3;
		this.op4 = op4;
		this.answer = answer;
	}
	//getters and setters
	public String getquestion_id() {
		return question_id;
	}
	public void setquestion_id(String question_id) {
		this.question_id = question_id;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getOp1() {
		return op1;
	}
	public void setOp1(String op1) {
		this.op1 = op1;
	}
	public String getOp2() {
		return op2;
	}
	public void setOp2(String op2) {
		this.op2 = op2;
	}
	public String getOp3() {
		return op3;
	}
	public void setOp3(String op3) {
		this.op3 = op3;
	}
	public String getOp4() {
		return op4;
	}
	public void setOp4(String op4) {
		this.op4 = op4;
	}
	public int getAnswer() {
		return answer;
	}
	public void setAnswer(int answer) {
		this.answer = answer;
	}
	public Level getLevel() {
		return level;
	}
	public void setLevel(Level level) {
		this.level = level;
	}
	//toString method
	@Override
	public String toString() {
		return "Question [question_id=" + question_id + ", question=" + question + ", op1="
				+ op1 + ", op2=" + op2 + ", op3=" + op3 + ", op4=" + op4
				+ ", answer=" + answer + ", module_id=" + "]";
	}
}