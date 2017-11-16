package com.pro2.dao.entity;

import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

import com.pro2.constants.ECommerceGlobalConstant;

@Entity
@Table(name="customer")
public class Customer {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = ECommerceGlobalConstant.OBJECT_ID)
	int id;
	
	@Column(name="Email")
	String email;
	
	@Column(name="Password")
	String password;
	
	@Column(name="Firstname")
	String firstName;
	
	@Column(name="Lastname")
	String lastName;
	
	@Column(name="Birthday")
	Date dob;
	
	@Column(name="Gender")
	int gender;
	
	@Column(name="Phone")
	String phone;
	
	@Column(name="Address")
	String address;
	
	@Column(name="Image")
	String image;
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "customer")
	List<Invoice> listOrder;

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public Date getDob() {
		return dob;
	}

	public void setDob(Date dob) {
		this.dob = dob;
	}

	public int getGender() {
		return gender;
	}

	public void setGender(int gender) {
		this.gender = gender;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}
}
