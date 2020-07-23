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
@Table(name="registraion")
public class Registration_model implements Serializable{
	
	@Id
	@GeneratedValue
	private int uid;
	@Column(length=50)
	private String uname;
	@Column(length=20)
	private long unumber;
	@Column(length=30)
	private String email;
	
	@Column(length=30)
	private String pass;
	
	@OneToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="aid")
	private Area_model am;

	private byte status=0;
	
	private byte active_flag=0;
	public Registration_model() {
		super();
		// TODO Auto-generated constructor stub
	}

	//status 0 means block and 1 means active

	public Registration_model(int uid) {
		super();
		this.uid = uid;
	}

	public Registration_model(String email, String pass) {
		super();
		this.email = email;
		this.pass = pass;
	}

	public String getPass() {
		return pass;
	}



	public Registration_model(int uid, String uname, long unumber, String email, String pass, Area_model am) {
		super();
		this.uid = uid;
		this.uname = uname;
		this.unumber = unumber;
		this.email = email;
		this.pass = pass;
		this.am = am;
	}



	public int getUid() {
		return uid;
	}

	public String getUname() {
		return uname;
	}

	public long getUnumber() {
		return unumber;
	}

	public String getEmail() {
		return email;
	}

	public Area_model getAm() {
		return am;
	}

	public byte getStatus() {
		return status;
	}

	public byte getActive_flag() {
		return active_flag;
	}
	
}
