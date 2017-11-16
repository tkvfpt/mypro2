package com.pro2.dao.entity;

import java.util.List;
import java.util.UUID;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="newstype")
public class NewsType{
	
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
	
	@OneToMany(mappedBy="newsType")
	List<News> listNews;

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

	

}
