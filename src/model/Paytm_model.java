package model;

import java.io.Serializable;
import java.sql.Time;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="paytm_transaction")
public class Paytm_model implements Serializable{
	@Id
	@GeneratedValue
	private int pid;
	
	@Column(length=20)
	private long banktxnid;
	
	
	@Column(length=20)
	private String orderid;
	
	private float txnamount;
	
	private Date txndate;
	
	@Column(length=40)
	private String txnid;
	
	@OneToOne
	@JoinColumn(name="oid")
	private Order_master_model oid;
	
	@Column(columnDefinition="TIMESTAMP DEFAULT CURRENT_TIMESTAMP")
	private Time created_by_date;
	
	@OneToOne
	@JoinColumn(name="uid")
	private Registration_model rm;

	public Paytm_model() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Paytm_model(long banktxnid, String orderid, float txnamount, Date txndate, String txnid,
			Registration_model rm) {
		super();
		this.banktxnid = banktxnid;
		this.orderid = orderid;
		this.txnamount = txnamount;
		this.txndate = txndate;
		this.txnid = txnid;
		this.rm = rm;
	}

	
	
	public Order_master_model getOid() {
		return oid;
	}

	public Paytm_model(long banktxnid, String orderid, float txnamount, Date txndate, String txnid,
			Order_master_model oid, Registration_model rm) {
		super();
		this.banktxnid = banktxnid;
		this.orderid = orderid;
		this.txnamount = txnamount;
		this.txndate = txndate;
		this.txnid = txnid;
		this.oid = oid;
		this.rm = rm;
	}

	public int getPid() {
		return pid;
	}

	public long getBanktxnid() {
		return banktxnid;
	}

	public String getOrderid() {
		return orderid;
	}

	public float getTxnamount() {
		return txnamount;
	}

	public Date getTxndate() {
		return txndate;
	}

	public String getTxnid() {
		return txnid;
	}

	public Time getCreated_by_date() {
		return created_by_date;
	}

	public Registration_model getRm() {
		return rm;
	}

	
}
