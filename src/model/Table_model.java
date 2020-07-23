package model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="dinning")
public class Table_model implements Serializable{
	@Id
	@GeneratedValue
	@Column(length=4)
	private int tid;
	@Column(length=30)
	private String tname;
	@Column(length=3)
	private byte tcapacity;
	@Column(length=100)
	private String description;
	
	private byte active_flag=0;
	private byte status=0;
	
	
	
	
	public byte getActive_flag() {
		return active_flag;
	}
	public Table_model() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getTid() {
		return tid;
	}
	public String getTname() {
		return tname;
	}
	public byte getTcapacity() {
		return tcapacity;
	}
	public String getDescription() {
		return description;
	}
	
	
	
	
	public byte getStatus() {
		return status;
	}
	public Table_model(int tid, String tname, byte tcapacity, String description) {
		super();
		this.tid = tid;
		this.tname = tname;
		this.tcapacity = tcapacity;
		this.description = description;
	}
	public Table_model(int tid) {
		super();
		this.tid = tid;
	}
	
}
