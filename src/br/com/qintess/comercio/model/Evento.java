package br.com.qintess.comercio.model;

import java.time.LocalDate;
import java.util.Calendar;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Getter;
import lombok.Setter;

@Entity
@Getter @Setter
public class Evento {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@Column(nullable = false)
	private String nome;

	@Column(nullable = false)
	private String descricao;
	
	//@Lob
	//@Column(columnDefinition = "mediumblob")
	//private byte[] imagemEvento;
	
//	public byte[] getImagemEvento() {
//		return imagemEvento;
//	}

//	public void setImagemEvento(byte[] imagemEvento) {
//		this.imagemEvento = imagemEvento;
//	}

	@Column(nullable = false)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate data;
	
	@Column(nullable = false)
	private Integer qtd_ingressos;
	
	@Column(nullable = false)
	private Double preco;
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "casadeshow_id", nullable = false)
	private CasaDeShow casaDeshow;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public LocalDate getData() {
		return data;
	}

	public void setData(LocalDate data) {
		this.data = data;
	}

	public Integer getQtd_ingressos() {
		return qtd_ingressos;
	}

	public void setQtd_ingressos(Integer qtd_ingressos) {
		this.qtd_ingressos = qtd_ingressos;
	}

	public Double getPreco() {
		return preco;
	}

	public void setPreco(Double preco) {
		this.preco = preco;
	}

	public CasaDeShow getCasaDeshow() {
		return casaDeshow;
	}

	public void setCasaDeshow(CasaDeShow casaDeshow) {
		this.casaDeshow = casaDeshow;
	}

	@Override
	public String toString() {
		return "Nome: " + nome + ", ID da Casa de Show: " + casaDeshow;
	}
	
	
	
}
