package model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="menu")

public class Menu_model implements Serializable{
	@Id
	@GeneratedValue
	@Column(name="menu_id",length=3)
	private int mid;
	@Column(name="mname",length=50)
	private String mname;
	@Column(name="mimage",length=100)
	private String mimage;
	@Column(name="mdesc",length=200)
	private String mdesc;
	
	private byte active_flag=0;

	public byte getActive_flag() {
		return active_flag;
	}


	public Menu_model() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	public Menu_model(int mid) {
		super();
		this.mid = mid;
	}


	
	public Menu_model(int mid, String mname, String mdesc, String mimage) {
		super();
		this.mid = mid;
		this.mname = mname;
		this.mdesc = mdesc;
		this.mimage = mimage;
	}


	public Menu_model(String mname, String mdesc , String mimage) {
		super();
		this.mname = mname;
		this.mdesc = mdesc;
		this.mimage = mimage;
	}
	public int getMid() {
		return mid;
	}
	public String getMname() {
		return mname;
	}
	public String getMimage() {
		return mimage;
	}
	public String getMdesc() {
		return mdesc;
	}
	
	
}
