package model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="employee")
public class Employee_model implements Serializable{

	@Id @GeneratedValue
	private int eid;
	@Column(length=40)
	private String ename;
	@Column(length=30)
	private String email;
	@Column(length=100)
	private String address;
	@Column(length=12)
	private long mobile_no;
	@Column(length=9)
	private String gender;
	@Column(length=12)
	private double salary;
	@Column(length=30)
	private String password;
	@Column(length=30)
	private Date bdate;
	
	@OneToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="role_id")
	private Role_model rid;
	
	@OneToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="sid")
	private State_model sid;
	
	@OneToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="cid")
	private City_model cid;
	
	
	@OneToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="aid")
	private Area_model aid;

	private byte active_flag=0;

	public Employee_model() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	


	public Employee_model(int eid) {
		super();
		this.eid = eid;
	}




	public Employee_model(String email, String password) {
		super();
		this.email = email;
		this.password = password;
	}




	public Employee_model(int eid, String ename, String email, String address, long mobile_no, String gender,
			double salary, String password, Date bdate, Role_model rid, State_model sid, City_model cid,
			Area_model aid) {
		super();
		this.eid = eid;
		this.ename = ename;
		this.email = email;
		this.address = address;
		this.mobile_no = mobile_no;
		this.gender = gender;
		this.salary = salary;
		this.password = password;
		this.bdate = bdate;
		this.rid = rid;
		this.sid = sid;
		this.cid = cid;
		this.aid = aid;
	}


	public int getEid() {
		return eid;
	}

	public byte getActive_flag() {
		return active_flag;
	}
	public String getEname() {
		return ename;
	}


	public String getEmail() {
		return email;
	}


	public String getAddress() {
		return address;
	}


	public long getMobile_no() {
		return mobile_no;
	}


	public String getGender() {
		return gender;
	}

	public double getSalary() {
		return salary;
	}


	public String getPassword() {
		return password;
	}


	public Date getBdate() {
		return bdate;
	}


	public Role_model getRid() {
		return rid;
	}


	public State_model getSid() {
		return sid;
	}


	public City_model getCid() {
		return cid;
	}


	public Area_model getAid() {
		return aid;
	}
	
	
	
	
}
