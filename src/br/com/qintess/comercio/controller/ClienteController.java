package br.com.qintess.comercio.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.qintess.comercio.dao.Dao;
import br.com.qintess.comercio.model.Cliente;


@Controller
@RequestMapping("/cadastrocliente")
public class ClienteController {

	@Autowired
	private Dao dao; 
	
	@RequestMapping("")
	public String carrega(Model model) {
		model.addAttribute("cliente", new Cliente());
		return "cadastrocliente";
	}
	
	@RequestMapping("/salva")
	public String salva(@ModelAttribute Cliente cliente) {
		dao.salva(cliente);
		return"redirect:/cadastrocliente";
	}
}
