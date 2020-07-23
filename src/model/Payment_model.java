package model;

import java.sql.Time;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="payment")
public class Payment_model {

	@Id
	@GeneratedValue
	private int pid;
	
	@OneToOne
	@JoinColumn(name="oid")
	private Order_master_model oid;
	
	private float total;
	
	private float gst;
	
	private float grand_total;
	
	private String pay_type;
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="uid")
	private Registration_model uid;
	
	@Column(columnDefinition="TIMESTAMP DEFAULT CURRENT_TIMESTAMP")
	private Time created_by_date;
	
	private byte status=0;
	
	private byte active_flag=0;

	public Payment_model() {
		super();
		// TODO Auto-generated constructor stub
	}


	public Payment_model(Order_master_model oid, float total, float gst, float grand_total, String pay_type,
			Registration_model uid) {
		super();
		this.oid = oid;
		this.total = total;
		this.gst = gst;
		this.grand_total = grand_total;
		this.pay_type = pay_type;
		this.uid = uid;
	}



	public int getPid() {
		return pid;
	}

	public Order_master_model getOid() {
		return oid;
	}
	

	public Registration_model getUid() {
		return uid;
	}

	public float getTotal() {
		return total;
	}

	

	public float getGst() {
		return gst;
	}



	public float getGrand_total() {
		return grand_total;
	}

	public String getPay_type() {
		return pay_type;
	}

	public Time getCreated_by_date() {
		return created_by_date;
	}

	public byte getStatus() {
		return status;
	}

	public byte getActive_flag() {
		return active_flag;
	}
	
}
