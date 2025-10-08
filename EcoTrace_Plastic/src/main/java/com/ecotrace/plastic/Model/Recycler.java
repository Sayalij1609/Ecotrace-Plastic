package com.ecotrace.plastic.Model;

import java.util.List;


import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity
@Table(name="recycler_details") 
@Component
public class Recycler {
	
	    private String status;
	    

	    public Recycler(long phone, String name, String email, String business_name, String reg_number, String password,
			String city, String materials, String address, String service_area, int years_in_business) {
		super();
		this.phone = phone;
		this.name = name;
		this.email = email;
		this.business_name = business_name;
		this.reg_number = reg_number;
		this.password = password;
		this.city = city;
		this.materials = materials;
		this.address = address;
		this.service_area = service_area;
		this.years_in_business = years_in_business;
	}
		@Id
	    private long phone; // Phone number as primary key
	    private String name;
	    private String email;
	    private String business_name;
	    private String reg_number;
	    private String password;
	    @Override
		public String toString() {
			return "Recycler [phone=" + phone + ", name=" + name + ", email=" + email + ", business_name="
					+ business_name + ", reg_number=" + reg_number + ", password=" + password + ", city=" + city
					+ ", materials=" + materials + ", address=" + address + ", service_area=" + service_area
					+ ", years_in_business=" + years_in_business + "]";
		}
		public Recycler() {
			super();
			// TODO Auto-generated constructor stub
		}
		private String city;
	    private String materials;
	    private String address;
	    private String service_area;
	    private int years_in_business;
		public long getPhone() {
			return phone;
		}
		public void setPhone(long phone) {
			this.phone = phone;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public String getEmail() {
			return email;
		}
		public void setEmail(String email) {
			this.email = email;
		}
		public String getBusiness_name() {
			return business_name;
		}
		public void setBusiness_name(String business_name) {
			this.business_name = business_name;
		}
		public String getReg_number() {
			return reg_number;
		}
		public void setReg_number(String reg_number) {
			this.reg_number = reg_number;
		}
		public String getPassword() {
			return password;
		}
		public void setPassword(String password) {
			this.password = password;
		}
		public String getCity() {
			return city;
		}
		public void setCity(String city) {
			this.city = city;
		}
		public String getMaterials() {
			return materials;
		}
		public void setMaterials(String materials) {
			this.materials = materials;
		}
		public String getAddress() {
			return address;
		}
		public void setAddress(String address) {
			this.address = address;
		}
		public String getService_area() {
			return service_area;
		}
		public void setService_area(String service_area) {
			this.service_area = service_area;
		}
		public int getYears_in_business() {
			return years_in_business;
		}
		public void setYears_in_business(int years_in_business) {
			this.years_in_business = years_in_business;
		}
		public String getStatus() {
			return status;
		}
		public void setStatus(String status) {
			this.status = status;
		}

	    

	   
	    

	    
}
