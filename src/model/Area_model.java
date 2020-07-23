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
@Table(name="area")
public class Area_model implements Serializable{
	@Id @GeneratedValue
	private int aid;
	@Column(length=30)
	private String  aname;
	
	@Column(length=6)
	private int zipcode;
	
	@OneToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="sid")
	private State_model sm;
	
	@OneToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="cid")
	private City_model cm;
	
	
	private byte active_flag=0;




	public Area_model() {
		super();

	}

	
	
	public Area_model(int aid) {
	super();
	this.aid = aid;
	}



	public Area_model(int aid, String aname, int zipcode, State_model sm, City_model cm) {
		super();
		this.aid = aid;
		this.aname = aname;
		this.zipcode = zipcode;
		this.sm = sm;
		this.cm = cm;
	}


	public int getAid() {
		return aid;
	}

	public String getAname() {
		return aname;
	}

	public int getZipcode() {
		return zipcode;
	}

	public State_model getSm() {
		return sm;
	}

	public City_model getCm() {
		return cm;
	}



	public byte getActive_flag() {
		return active_flag;
	}

}
