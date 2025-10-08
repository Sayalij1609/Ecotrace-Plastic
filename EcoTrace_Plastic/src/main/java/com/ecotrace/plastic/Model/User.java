package com.ecotrace.plastic.Model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity
@Table(name="user_details") 
@Component
public class User {
	
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	public User(long ucontact, String uname, String uemail, String upassword, String city, String address) {
		super();
		this.ucontact = ucontact;
		this.uname = uname;
		this.uemail = uemail;
		this.upassword = upassword;
		City = city;
		Address = address;
	}
	@Id
	private  long ucontact;
	private String uname ;
	private String uemail;
	private String upassword;
	private String City;
	private String Address;
	public  long getUcontact() {
		return ucontact;
	}
	public void setUcontact(long ucontact) {
		this.ucontact = ucontact;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getUemail() {
		return uemail;
	}
	public void setUemail(String uemail) {
		this.uemail = uemail;
	}
	public String getUpassword() {
		return upassword;
	}
	public void setUpassword(String upassword) {
		this.upassword = upassword;
	}
	public String getCity() {
		return City;
	}
	public void setCity(String city) {
		City = city;
	}
	public String getAddress() {
		return Address;
	}
	public void setAddress(String address) {
		Address = address;
	}
	@Override
	public String toString() {
		return "User [ucontact=" + ucontact + ", uname=" + uname + ", uemail=" + uemail + ", upassword=" + upassword
				+ ", City=" + City + ", Address=" + Address + "]";
	}
	

}
