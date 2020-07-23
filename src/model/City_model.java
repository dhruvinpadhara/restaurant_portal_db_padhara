package model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="city")
public class City_model implements Serializable{

	@Id
	@GeneratedValue
	@Column(length=4)
	private int cid;
	@Column(length=30)
	private String cname;
	@OneToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="sid")
	private State_model id;
	private byte active_flag=0;
	
	public City_model() {
		super();
		// TODO Auto-generated constructor stub
	}
	public City_model(int cid, String cname, State_model sid) {
		super();
		this.cid = cid;
		this.cname = cname;
		this.id = sid;
	}
	
	
	public byte getActive_flag() {
		return active_flag;
	}
	public int getCid() {
		return cid;
	}
	public String getCname() {
		return cname;
	}
	public State_model getId() {
		return id;
	}
	public City_model(int cid) {
		super();
		this.cid = cid;
	}
	public City_model(int cid, String cname) {
		super();
		this.cid = cid;
		this.cname = cname;
	}
	
	
}
