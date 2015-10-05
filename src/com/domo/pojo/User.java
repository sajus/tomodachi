package com.domo.pojo;
import java.io.Serializable;
import java.util.Set;

import javax.persistence.*;

import org.codehaus.jackson.annotate.JsonIgnore;
import org.codehaus.jackson.annotate.JsonManagedReference;
@Entity
@Table(name="user")
public class User implements Serializable{
	@Id
	@Column(name="userid")
	private int userid;
	@Column(name="username")
	private String username;
	@JsonIgnore
	@Column(name="password")
	private String password;
	@Column(name="role")
	private String role="candidate";
	@JsonManagedReference
	@OneToMany(mappedBy="user")
	private Set<SetExam> setexam;
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
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getRole() {
		return role;
	}
	//toString method
	@Override
	public String toString() {
		return "User [userid=" + userid + ", username=" + username
				+ ", password=" + password + ", role=" + role + "]";
	}
}