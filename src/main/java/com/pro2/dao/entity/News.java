package com.pro2.dao.entity;

import java.util.UUID;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="news")
public class News{
	
	@Id
	@GeneratedValue(generator = "uuid2")
	@GenericGenerator(name="uuid2", strategy="uuid2")
	@Column(name = "ID",columnDefinition = "BINARY(16)")
	UUID id;

	@Column(name="Code")
	String code;

	@Column(name="Name")
	String name;

	@Column(name="Image")
	String imagePath;

	@Column(name="ThumbImage")
	String thumbnail;

	@Column(name="Description")
	String description;

	@Temporal(TemporalType.DATE)
	@Column(name="Created")
	java.util.Date created;

	@Temporal(TemporalType.DATE)
	@Column(name="Updated")
	java.util.Date updated;	
	
	@ManyToOne
	@JoinColumn(name="NewsTypeID")
	NewsType newsType;

	

	public UUID getId() {
		return id;
	}

	public void setId(UUID id) {
		this.id = id;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

	public java.util.Date getCreated() {
		return created;
	}

	public void setCreated(java.util.Date created) {
		this.created = created;
	}

	public java.util.Date getUpdated() {
		return updated;
	}

	public void setUpdated(java.util.Date updated) {
		this.updated = updated;
	}	

}
