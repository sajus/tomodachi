package com.domo.pojo;
import java.io.Serializable;
import javax.persistence.*;
@Entity
@Table(name="user_answer")
public class UserAnswer implements Serializable{
	@Id
	@ManyToOne
	@JoinColumn(name="userid")
	private User user;
	@Id
	@ManyToOne
	@JoinColumn(name="question_id")
	private Question question;
	@Id
	@ManyToOne
	@JoinColumn(name="set_exam_id")
	private SetExam setexam;
	@Column(name="user_answer")
	private int user_answer;
	@Column(name="binary_result")
	private int binary_result;
	//default ctor
	public UserAnswer() {
	}
	//parameterized ctor
	public UserAnswer(int user_answer,
			int binary_result) {
		super();
		this.user_answer = user_answer;
		this.binary_result = binary_result;
	}
	//getters and setters
	public int getUseranswer() {
		return user_answer;
	}
	public void setUseranswer(int user_answer) {
		this.user_answer = user_answer;
	}
	public int getResult() {
		return binary_result;
	}
	public void setResult(int binary_result) {
		this.binary_result = binary_result;
	}
	//toString method
	@Override
	public String toString() {
		return "UserAnswer [userid=" + ", qid=" + ", examid="
				+ ", useranswer=" + user_answer + ", result=" + binary_result
				+ "]";
	}
}