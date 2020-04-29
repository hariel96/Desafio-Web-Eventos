package br.com.qintess.comercio.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import lombok.Getter;
import lombok.Setter;

@Entity
@Getter @Setter
public class ItemPedido {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "pedido_id", nullable = false)
	private Pedido pedido;
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "ingresso_id", nullable = false)
	private Ingresso ingresso;
	
	@Column(nullable = false)
	private Integer quantidade;

	@Column(nullable = false)
	private Double subTotal;

	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "evento_id",nullable = false)
	private Evento evento;
	
}
