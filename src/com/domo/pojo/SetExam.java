package com.domo.pojo;
import java.io.Serializable;
import java.sql.Time;
import java.text.SimpleDateFormat;
import javax.persistence.*;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.springframework.format.annotation.DateTimeFormat;
@Entity
@Table(name="set_exam")
@JsonIgnoreProperties(ignoreUnknown = true)
public class SetExam implements Serializable{
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="set_exam_id")
	private int set_exam_id;
	@ManyToOne(cascade = CascadeType.ALL)
	@PrimaryKeyJoinColumn(name="userid")
	public User user;
	@ManyToOne(cascade = CascadeType.ALL)
	@PrimaryKeyJoinColumn(name="template_id")
	private Template templatesetexam;
	@Column(name="start_date")
	@DateTimeFormat(pattern = "MM/dd/yyyy")
	private String start_date;
	@Column(name="duration")
	private long duration;
	@Column(name="start_time")
	private String start_time;
	@Column(name="is_conducted")
	private boolean is_conducted=false;
	@Column(name="marks")
	private int marks=0;
	@Column(name="actual_start_time")
	private String actual_start_time=null;
	public SetExam() {
		super();
		// TODO Auto-generated constructor stub
	}
	//parameterized ctor
	public SetExam(int set_exam_id, User user, Template templatesetexam,
			String start_date, long duration, Time start_time,
			boolean is_conducted, int marks, Time actual_start_time) {
		super();
		this.set_exam_id = set_exam_id;
		this.user = user;
		this.templatesetexam = templatesetexam;
		this.start_date = new SimpleDateFormat("dd/MM/yyyy").format(start_date);
		this.duration = duration;
		this.start_time = new SimpleDateFormat("HH.mm.SS").format(start_time.getTime());
		this.is_conducted = is_conducted;
		this.marks = marks;
		this.actual_start_time = new SimpleDateFormat("HH.mm.SS").format(actual_start_time.getTime());	
	}
	//getters and setters
	public int getSet_exam_id() {
		return set_exam_id;
	}
	public void setSet_exam_id(int set_exam_id) {
		this.set_exam_id = set_exam_id;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Template getTemplatesetexam() {
		return templatesetexam;
	}
	public void setTemplatesetexam(Template templatesetexam) {
		this.templatesetexam = templatesetexam;
	}
	public String getStart_date() {
		return start_date;
	}
	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}
	public long getDuration() {
		return duration;
	}
	public void setDuration(long duration) {
		this.duration = duration;
	}
	public String getStart_time() {
		return start_time;
	}
	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}
	public boolean isIs_conducted() {
		return is_conducted;
	}
	public void setIs_conducted(boolean is_conducted) {
		this.is_conducted = is_conducted;
	}
	public int getMarks() {
		return marks;
	}
	public void setMarks(int marks) {
		this.marks = marks;
	}
	public String getActual_start_time() {
		return actual_start_time;
	}
	public void setActual_start_time(String actual_start_time) {
		this.actual_start_time = actual_start_time;
	}
	//toString method
	@Override
	public String toString() {
		return "SetExam [set_exam_id=" + set_exam_id + ", user=" + user
				+ ", templatesetexam=" + templatesetexam + ", start_date="
				+ start_date + ", duration=" + duration + ", start_time="
				+ start_time + ", is_conducted=" + is_conducted + ", marks="
				+ marks + ", actual_start_time=" + actual_start_time
				+ "]";
	}
}