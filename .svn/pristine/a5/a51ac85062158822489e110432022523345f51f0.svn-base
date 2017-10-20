package com.yu.app.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Table(name = "oil")
@Entity
public class Oil {
	private int id;
	private int mile;
	private int cash;
	private double price;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date date;

	@GeneratedValue
	@Id
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getMile() {
		return mile;
	}

	public void setMile(int mile) {
		this.mile = mile;
	}

	public int getCash() {
		return cash;
	}

	public void setCash(int cash) {
		this.cash = cash;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	@Temporal(TemporalType.DATE)
	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	@Override
	public String toString() {
		return "Oil [id=" + id + ", mile=" + mile + ", cash=" + cash + ", price=" + price + ", date=" + date + "]";
	}

	public Oil(int mile, int cash, double price, Date date) {
		super();
		this.mile = mile;
		this.cash = cash;
		this.price = price;
		this.date = date;
	}

	public Oil() {
	}

}
