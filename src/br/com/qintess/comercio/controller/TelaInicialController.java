package br.com.qintess.comercio.controller;

import java.io.UnsupportedEncodingException;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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

	
	
	@RequestMapping("/mostraevento/{id}")
	public String mostraevento(@PathVariable(name = "id") Integer id, Model model, RedirectAttributes redirectAtt) {
		Evento evento = dao.buscaPorId(Evento.class, id);
		
		model.addAttribute("eventos", dao.buscaTodos(Evento.class));
		model.addAttribute("evento", evento);
		
		return "/detalheseventos";
	}
}
