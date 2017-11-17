package com.pro2.dao.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name="shop_info")
public class ShopInfo{
	
	@Column
	String logo;
	
	@Column
	String name;
	
	@Column
	String phone;
	
	@Column
	String messenger;
	
	@Column
	String fanpage_url;
	
	@Column
	String mail;
	
	@Column
	String address;
	
	@Column
	String twitter;
	
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

	public String getFanpage_url() {
		return fanpage_url;
	}

	public void setFanpage_url(String fanpage_url) {
		this.fanpage_url = fanpage_url;
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
	
	
}