package com.ecotrace.plastic.Model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity
@Table(name="collectionLog_details") 
@Component (value = "col")
public class Collection_Log {
	
	public Collection_Log(int id, long phone, long uid, String recyclerName, String status, String pickupDate,
			String pickupTime, String materials, int quantity, String pickup_condition, String address,
			String instructions) {
		super();
		this.id = id;
		Phone = phone;
		this.uid = uid;
		this.recyclerName = recyclerName;
		this.status = status;
		this.pickupDate = pickupDate;
		this.pickupTime = pickupTime;
		this.materials = materials;
		this.quantity = quantity;
		Pickup_condition = pickup_condition;
		this.address = address;
		this.instructions = instructions;
	}
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	@Override
	public String toString() {
		return "Collection_Log [id=" + id + ", Phone=" + Phone + ", uid=" + uid + ", recyclerName=" + recyclerName
				+ ", status=" + status + ", pickupDate=" + pickupDate + ", pickupTime=" + pickupTime + ", materials="
				+ materials + ", quantity=" + quantity + ", Pickup_condition=" + Pickup_condition + ", address="
				+ address + ", instructions=" + instructions + "]";
	}
	public Collection_Log() {
		super();
		// TODO Auto-generated constructor stub
	}
	private long Phone;
	private long uid;
	private String recyclerName;
	private String status;
	private String pickupDate;
	private String pickupTime;
	private String materials;
	private int quantity;
	private String Pickup_condition;
	private String address;
	private String instructions;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public long getPhone() {
		return Phone;
	}
	public void setPhone(long phone) {
		Phone = phone;
	}
	public long getUid() {
		return uid;
	}
	public void setUid(long uid2) {
		this.uid = uid2;
	}
	public String getRecyclerName() {
		return recyclerName;
	}
	public void setRecyclerName(String recyclerName) {
		this.recyclerName = recyclerName;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getPickupDate() {
		return pickupDate;
	}
	public void setPickupDate(String pickupDate) {
		this.pickupDate = pickupDate;
	}
	public String getPickupTime() {
		return pickupTime;
	}
	public void setPickupTime(String pickupTime) {
		this.pickupTime = pickupTime;
	}
	public String getMaterials() {
		return materials;
	}
	public void setMaterials(String materials) {
		this.materials = materials;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getPickup_condition() {
		return Pickup_condition;
	}
	public void setPickup_condition(String pickup_condition) {
		Pickup_condition = pickup_condition;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getInstructions() {
		return instructions;
	}
	public void setInstructions(String instructions) {
		this.instructions = instructions;
	}

	
	
	
	
}
