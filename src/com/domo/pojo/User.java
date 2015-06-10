package com.domo.pojo;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.*;
import org.codehaus.jackson.annotate.JsonIgnore;

@Entity
@Table(name="user")
public class User implements Serializable{
	@Id
	@Column(name="userid")
	private int userid;
	@Column(name="username")
	private String username;
	@Column(name="password")
	private String password;
	@Column(name="role")
	private String role="candidate";
	
	@OneToMany(mappedBy="user")
	private Set<SetExam> setexam;
	@OneToMany(mappedBy="user")
	private Set<UserAnswer> useranswer;

	
	//default ctor
	public User() {
		
	}

	//parameterized ctor
	public User(int userid, String username, String password, String role) {
		super();
		this.userid = userid;
		this.username = username;
		this.password = password;
		this.role = role;
	}
	
	//getters and setters
	public int getuserid() {
		return userid;
	}
	public void setuserid(int userid) {
		this.userid = userid;
	}
	public String getusername() {
		return username;
	}
	public void setusername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getRole() {
		return role;
	}
//	public void setRole(String role) {
//		this.role = "candidate";
//	}
	
	//toString method
	@Override
	public String toString() {
		return "User [userid=" + userid + ", username=" + username
				+ ", password=" + password + ", role=" + role + "]";
	}
}