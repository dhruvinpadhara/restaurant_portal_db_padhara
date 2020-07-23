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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name="booked")
public class Book_model implements Serializable{

	@Id @GeneratedValue
	private int bid;
	
	@Column(name="booking_date")
	private Date bdate;
	
	@Column(name="booking_time")
    @Temporal(TemporalType.TIME)
    private Date btime;
    
    @OneToOne
    @JoinColumn(name="tid")
    private Table_model tm;
    
    
    @OneToOne
    @JoinColumn(name="uid")
    private Registration_model rm;
    
    private byte status=0;
    
    private byte active_flag=0;

    @Column(columnDefinition="TIMESTAMP DEFAULT CURRENT_TIMESTAMP")
	private Time created_by_date;

	public Book_model() {
		super();
	}

	

	public Book_model(int bid, Date bdate, Date btime, Table_model tm, Registration_model rm, byte status) {
		super();
		this.bid = bid;
		this.bdate = bdate;
		this.btime = btime;
		this.tm = tm;
		this.rm = rm;
		this.status = status;
	}


	public int getBid() {
		return bid;
	}

	public Date getBdate() {
		return bdate;
	}

	public Date getBtime() {
		return btime;
	}

	public Table_model getTm() {
		return tm;
	}

	public Registration_model getRm() {
		return rm;
	}

	public byte getStatus() {
		return status;
	}

	public byte getActive_flag() {
		return active_flag;
	}

	public Date getCreated_by_date() {
		return created_by_date;
	}
    
}
