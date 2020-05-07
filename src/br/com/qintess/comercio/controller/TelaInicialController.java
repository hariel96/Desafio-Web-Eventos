package br.com.qintess.comercio.controller;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.qintess.comercio.dao.Dao;
import br.com.qintess.comercio.model.Evento;

@Controller
@RequestMapping("/telainicial")
public class TelaInicialController {

	@Autowired
	private Dao dao;

	@RequestMapping("")
	public String telainicial(Model model) {
		model.addAttribute("eventos", dao.buscaTodos(Evento.class));
		model.addAttribute("evento", new Evento());
		return "telainicial";
	}

	@RequestMapping("/mostraevento")
	public String mostra(Integer id, Model model) {
		model.addAttribute("evento", dao.buscaPorId(Evento.class, id));
		return "/cadastroeventos";
	}
}
