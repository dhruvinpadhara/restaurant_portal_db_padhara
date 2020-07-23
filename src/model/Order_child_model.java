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

import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name="order_child")
public class Order_child_model implements Serializable{

	@Id
	@GeneratedValue
	private int ocid;
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="smid")
	private Submenu_model smid;

	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="oid")
	private Order_master_model oid;

	@Column(length=3)
	private int qty;
	
	private byte status=0;
	@Column(name="order_place_time")
    @Temporal(TemporalType.TIME)
	private Date octime;
	
	private byte active_flag=0;
	
	
	
	
	
	public Order_child_model(int ocid, Submenu_model smid, Order_master_model oid, int qty, byte status, Date octime) {
		this.ocid = ocid;
		this.smid = smid;
		this.oid = oid;
		this.qty = qty;
		this.status = status;
		this.octime = octime;
	}




	public byte getActive_flag() {
		return active_flag;
	}

	
	
	
	public Date getOctime() {
		return octime;
	}




	public Order_child_model() {
		super();
		// TODO Auto-generated constructor stub
	}


	public Order_child_model(Submenu_model smid, Order_master_model oid, int qty) {
		super();
		this.smid = smid;
		this.oid = oid;
		this.qty = qty;
	}

	public int getQty() {
		return qty;
	}


	public int getOcid() {
		return ocid;
	}

	public Submenu_model getSmid() {
		return smid;
	}

	public byte getStatus() {
		return status;
	}


	public Order_master_model getOid() {
		return oid;
	}
}
