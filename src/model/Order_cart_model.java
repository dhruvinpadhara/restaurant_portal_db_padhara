package model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name="order_cart")
public class Order_cart_model implements Serializable{
	@Id
	@GeneratedValue
	private int cart_id;
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="uid")
	private Registration_model uid;
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="smid")
	private Submenu_model smid;
	
	@Column(length=4)
	private int qty;
	
	@Column(name="ocdate")
	private Date ocdate;
	
	@OneToOne
	@JoinColumn(name="tid")
	private Table_model tid;
	
	@Column(length=2)
	private byte status=0;
	
	private byte active_flag=0;

	public Order_cart_model() {
		super();
		// TODO Auto-generated constructor stub
	}
	

	
	public Order_cart_model(Registration_model uid, Submenu_model smid, int qty, Date ocdate) {
		super();
		this.uid = uid;
		this.smid = smid;
		this.qty = qty;
		this.ocdate = ocdate;
	}



	public Order_cart_model(Registration_model uid, Submenu_model smid, int qty, Date ocdate, Table_model tid) {
		super();
		this.uid = uid;
		this.smid = smid;
		this.qty = qty;
		this.ocdate = ocdate;
		this.tid = tid;
	}


	public byte getActive_flag() {
		return active_flag;
	}
	
	public int getCart_id() {
		return cart_id;
	}

	public Registration_model getUid() {
		return uid;
	}

	public Submenu_model getSmid() {
		return smid;
	}

	public int getQty() {
		return qty;
	}

	public Date getOcdate() {
		return ocdate;
	}

	public byte getStatus() {
		return status;
	}
	
}
