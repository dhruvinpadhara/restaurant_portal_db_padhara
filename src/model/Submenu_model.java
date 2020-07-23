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
@Table(name="submenu")
public class Submenu_model implements Serializable{
	@Id
	@GeneratedValue
	@Column(length=5)
	private int smid;
	@Column(length=40)
	private String name;
	@Column(length=10,precision=2)
	private double price;
	@Column(length=40)
	private String smdesc;
	@Column(length=40)
	private String image;
	
	@OneToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="mid")
	private Menu_model mid;

	private byte active_flag=0;



	public Submenu_model() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	
	public Submenu_model(int smid) {
		super();
		this.smid = smid;
	}



	public Submenu_model(int smid, String name, double price, String desc, String image, Menu_model mid) {
		super();
		this.smid = smid;
		this.name = name;
		this.price = price;
		this.smdesc = desc;
		this.image = image;
		this.mid = mid;
	}

	public int getSmid() {
		return smid;
	}

	public String getName() {
		return name;
	}

	public double getPrice() {
		return price;
	}
	public byte getActive_flag() {
		return active_flag;
	}

	public String getSmdesc() {
		return smdesc;
	}

	public String getImage() {
		return image;
	}

	public Menu_model getMid() {
		return mid;
	}
	
	
}
