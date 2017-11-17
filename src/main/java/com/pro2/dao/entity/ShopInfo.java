package com.pro2.dao.entity;

import java.util.Collections;
import java.util.List;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="shop_info")
public class ShopInfo{
	
	@Id
	@Column(name="name")
	String name;
	
	@Column(name="logo")
	String logo;
	
	@Column(name="phone")
	String phone;
	
	@Column(name="messenger")
	String messenger;
	
	@Column(name="fanpage_url")
	String fanpageUrl;
	
	@Column(name="mail")
	String mail;
	
	@Column(name="address")
	String address;
	
	@Column(name="twitter")
	String twitter;
	
	@OneToMany(mappedBy="shop")
	List<User> user;
	
	public ShopInfo() {}

	public String getLogo() {
		return logo;
	}

	public void setLogo(String logo) {
		this.logo = logo;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getMessenger() {
		return messenger;
	}

	public void setMessenger(String messenger) {
		this.messenger = messenger;
	}

	public String getFanpageUrl() {
		return fanpageUrl;
	}

	public void setFanpageUrl(String fanpageUrl) {
		this.fanpageUrl = fanpageUrl;
	}

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getTwitter() {
		return twitter;
	}

	public void setTwitter(String twitter) {
		this.twitter = twitter;
	}

	public List<User> getUser() {
		if(Objects.isNull(user)) {
			return Collections.emptyList();
		}
		return user;
	}

	public void setUser(List<User> user) {
		this.user = user;
	}
	
	
}