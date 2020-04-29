package br.com.qintess.comercio.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.qintess.comercio.dao.Dao;
import br.com.qintess.comercio.model.CasaDeShow;
import br.com.qintess.comercio.model.Evento;

@Controller
@RequestMapping("/cadastroeventos")
public class EventoController {
	
	@Autowired
	private Dao dao; 

	@RequestMapping("")
	public String carrega(Model model) {
		model.addAttribute("evento", new Evento());
		return "cadastroeventos";
	}
	
	@RequestMapping("/salva")
	public String salva(@ModelAttribute Evento evento) {
		dao.salva(evento);
		return"redirect:/cadastroeventos";
	}
	
}
