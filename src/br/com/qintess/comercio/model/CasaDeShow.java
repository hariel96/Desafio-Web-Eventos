package br.com.qintess.comercio.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.OneToMany;
import javax.persistence.Transient;

import lombok.Getter;
import lombok.Setter;

@Entity
@Getter @Setter
public class CasaDeShow {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	@Column(nullable = false)
	private String nome;
	
	@Column(nullable = false)
	private String endereco;
	
	@Column(nullable = false)
	private Integer capacidade;
	
	@Lob
	@Column(columnDefinition = "mediumblob")
	private byte[] imagemCasaDeShow;
	
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "casaDeshow", fetch = FetchType.EAGER)
	private List<Evento> eventos;
	
	
	@Transient
	private String imagemEncoded;

	public String getImagemEncoded() {
		return imagemEncoded;
	}

	public void setImagemEncoded(String imagemEncoded) {
		this.imagemEncoded = imagemEncoded;
	}

	public byte[] getImagemCasaDeShow() {
		return imagemCasaDeShow;
	}

	public void setImagemCasaDeShow(byte[] imagemCasaDeShow) {
		this.imagemCasaDeShow = imagemCasaDeShow;
	}

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

	public String getEndereco() {
		return endereco;
	}

	public void setEndereco(String endereco) {
		this.endereco = endereco;
	}

	public Integer getCapacidade() {
		return capacidade;
	}

	public void setCapacidade(Integer capacidade) {
		this.capacidade = capacidade;
	}
	
	@Override
	public String toString() {
		return ""+id;
	}
}
