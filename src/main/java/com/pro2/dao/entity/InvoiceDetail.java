package com.pro2.dao.entity;

import java.util.Objects;

import javax.persistence.AssociationOverride;
import javax.persistence.AssociationOverrides;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.Table;

@Entity
@Table(name = "orderitem")

@AssociationOverrides(value = {
		@AssociationOverride(joinColumns= {@JoinColumn(name="productId")},name="invoice_detail_pk.product"),
		@AssociationOverride(joinColumns= {@JoinColumn(name="invoiceId")},name="invoice_detail_pk.invoice")
})
public class InvoiceDetail {

	@EmbeddedId
	InvoiceDetailPK invoice_detail_pk;
	
	@Column(name="quantity")
	int quantity;

	public InvoiceDetailPK getInvoice_detail_pk() {
		if(Objects.isNull(invoice_detail_pk)) {
			return new InvoiceDetailPK();
		}
		return invoice_detail_pk;
	}
	
	public Product getProduct() {
		return getInvoice_detail_pk().product;
	}

	public void setProduct(Product product) {
		this.getInvoice_detail_pk().product = product;
	}

	public Invoice getInvoice() {
		return getInvoice_detail_pk().invoice;
	}

	public void setInvoice(Invoice invoice) {
		this.getInvoice_detail_pk().invoice = invoice;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
	
}
