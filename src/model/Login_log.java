package model;

import java.sql.Time;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name="login_log")
public class Login_log {

	@Id
	@GeneratedValue
	private int logid;
	
	@OneToOne
	@JoinColumn(name="eid")
	private Employee_model eid;
	
	
	@Column(columnDefinition="TIMESTAMP DEFAULT CURRENT_TIMESTAMP")
	private Time created_by_date;

	@Temporal(TemporalType.DATE)
	private Date cdate;

	public Login_log() {
		super();
		// TODO Auto-generated constructor stub
	}

	

	public Login_log(Employee_model eid, Date cdate) {
		super();
		this.eid = eid;
		this.cdate = cdate;
	}



	public Date getCdate() {
		return cdate;
	}


	public int getLogid() {
		return logid;
	}

	public Employee_model getEid() {
		return eid;
	}

	public Time getCreated_by_date() {
		return created_by_date;
	}
	
}
