package br.com.qintess.comercio.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.qintess.comercio.dao.Dao;
import br.com.qintess.comercio.model.Cliente;
import br.com.qintess.comercio.model.Evento;

@Controller
public class IndexController {

	@Autowired
	private Dao dao;
	
	@RequestMapping("/")
	public String index() {
		return "index";
	}
	
	@RequestMapping("/compraingressos")
	public String compraingressos() {
		
		return "compraingressos";
	}

}
