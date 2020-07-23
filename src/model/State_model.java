package model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="state")
public class State_model implements Serializable{

	@Id //use primary key
	@GeneratedValue //auto generated key
	@Column(name="state_id")
	private int sid;
	@Column(name="state_name",length=30)
	private String sname;

	private byte active_flag=0;
	
	public State_model(int sid) {
		this.sid = sid;
	}
	
	public byte getActive_flag() {
		return active_flag;
	}
	public State_model() {
		super();
		// TODO Auto-generated constructor stub
	}
	public State_model(int sid, String sname) {
		super();
		this.sid = sid;
		this.sname = sname;
	}
	public State_model(String sname) {
		super();
		this.sname = sname;
	}
	public int getSid() {
		return sid;
	}
	public String getSname() {
		return sname;
	}
	
	
	
}
