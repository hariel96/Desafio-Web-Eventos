package br.com.qintess.comercio.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.qintess.comercio.model.Cliente;

@Controller
public class IndexController {

	@RequestMapping("/")
	public String index() {
		return "index";
	}
	
	@RequestMapping("/telainicial")
	public String telainicial() {
		
		return "telainicial";
	}
	
	@RequestMapping("/compraingressos")
	public String compraingressos() {
		
		return "compraingressos";
	}

}
