package com.pro2.dao.entity;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.pro2.constants.ECommerceGlobalConstant;

/**
 * 
 * @author khon.vt
 *
 */
@Entity
@Table(name = "product")
public class Product {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = ECommerceGlobalConstant.OBJECT_ID)
	int id;
	
	@Column(name = "price")
	float price;

	@Column(name = "weight")
	float weight;

	@Column(name=ECommerceGlobalConstant.OBJECT_NAME)
	String name;
	
	@Column(name = "image")
	String imagePath;

	@Column(name = "thumbnail")
	String thumbnail;

	@Column(name = "description")
	String description;

	@Column(name = "createdDate")
	@Temporal(TemporalType.TIMESTAMP)
	Date created;

	@ManyToOne
	@JoinColumn(name = "categoryId")
	Category category;
	
	@ManyToOne
	@JoinColumn(name = "username")
	User user;
	
	@OneToMany(mappedBy="invoice_detail_pk.product")
	List<InvoiceDetail> invoiceDetail;

	public Product() {
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Date getCreated() {
		return created;
	}

	public void setCreated(Date created) {
		this.created = created;
	}

	public float getWeight() {
		return weight;
	}

	public void setWeight(float weight) {
		this.weight = weight;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public List<InvoiceDetail> getInvoiceDetail() {
		return invoiceDetail;
	}

	public void setInvoiceDetail(List<InvoiceDetail> invoiceDetail) {
		this.invoiceDetail = invoiceDetail;
	}

	
}
