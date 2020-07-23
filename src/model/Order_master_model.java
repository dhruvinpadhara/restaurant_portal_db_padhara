package model;

import java.io.Serializable;
import java.sql.Time;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


@Entity
@Table(name="order_master")
public class Order_master_model implements Serializable{
	@Id
	@GeneratedValue
	private int oid;
	
	@Column(name="order_date")
	@Temporal(TemporalType.DATE)
	private Date odate;
	
	//order close time
	@Column(name="order_time")
    @Temporal(TemporalType.TIME)
    private Date otime;
	
	@Column(length=3)
	private byte ostatus=0;
	
	private byte active_flag=0;
	
	@OneToMany(mappedBy="oid",fetch=FetchType.LAZY,cascade=CascadeType.REMOVE)
	private List<Order_child_model> ocid;
	
	@OneToMany(mappedBy="oid",fetch=FetchType.LAZY,cascade=CascadeType.REMOVE)
	private List<Payment_model> paym;
	
	
	@Column(columnDefinition="TIMESTAMP DEFAULT CURRENT_TIMESTAMP")
	private Time created_by_date;
	
	@OneToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="uid")
	private Registration_model uid;

	@OneToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="tid")
	private Table_model tid;
	
	
	public Order_master_model() {
		super();
		// TODO Auto-generated constructor stub
	}	

	
	public Order_master_model(Date odate, Date otime, Registration_model uid) {
		super();
		this.odate = odate;
		this.otime = otime;
		this.uid = uid;
	}
	

	public List<Payment_model> getPaym() {
		return paym;
	}


	public List<Order_child_model> getOcid() {
		return ocid;
	}


	public Order_master_model(Date odate, Date otime, Registration_model uid, Table_model tid) {
		super();
		this.odate = odate;
		this.otime = otime;
		this.uid = uid;
		this.tid = tid;
	}

	public Order_master_model(int oid) {
		super();
		this.oid = oid;
	}

	public int getOid() {
		return oid;
	}

	public Date getOdate() {
		return odate;
	}

	public Date getOtime() {
		return otime;
	}

	public byte getOstatus() {
		return ostatus;
	}

	public byte getActive_flag() {
		return active_flag;
	}

	public Time getCreated_by_date() {
		return created_by_date;
	}

	public Registration_model getUid() {
		return uid;
	}

	public Table_model getTid() {
		return tid;
	}
	
}
