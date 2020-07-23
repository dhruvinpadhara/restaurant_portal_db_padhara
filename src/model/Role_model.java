package model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="role")
public class Role_model implements Serializable{
	@Id
	@GeneratedValue
	@Column(length=3)
	private int role_id;
	@Column(length=20)
	private String role_name;
	@Column(length=30)
	private String role_desc;

	@Column(length=1, nullable = false, columnDefinition = "default 0") 
	private byte active_flag;
	public Role_model() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Role_model(int role_id, String role_name, String role_desc) {
		super();
		this.role_id = role_id;
		this.role_name = role_name;
		this.role_desc = role_desc;
	}
	
	public int getRole_id() {
		return role_id;
	}
	public String getRole_name() {
		return role_name;
	}
	public String getRole_desc() {
		return role_desc;
	}

	public Role_model(int role_id) {
		super();
		this.role_id = role_id;
	}
	
}
