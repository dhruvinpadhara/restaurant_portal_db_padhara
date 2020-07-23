package model;

import java.sql.Time;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="transaction_log")
public class Transaction_log {

	@Id
	@GeneratedValue
	private int tid;
	
	@Column(length=30)
	private String pgname;
	
	@OneToOne
	@JoinColumn(name="eid")
	private Employee_model eid;
	
	@Column(columnDefinition="TIMESTAMP DEFAULT CURRENT_TIMESTAMP")
	private Time created_by_date;

	public Transaction_log(String pgname, Employee_model eid) {
		super();
		this.pgname = pgname;
		this.eid = eid;
	}
	

	public Transaction_log() {
		super();
		// TODO Auto-generated constructor stub
	}


	public int getTid() {
		return tid;
	}

	public String getPgname() {
		return pgname;
	}

	public Employee_model getEid() {
		return eid;
	}

	public Time getCreated_by_date() {
		return created_by_date;
	}
	
	
	
}
