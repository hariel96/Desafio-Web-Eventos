package br.com.qintess.comercio.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.qintess.comercio.dao.Dao;
import br.com.qintess.comercio.model.CasaDeShow;
import br.com.qintess.comercio.model.Cliente;

@Controller
@RequestMapping("/cadastrocasadeshow")
public class CasaDeShowController {

	@Autowired
	private Dao dao; 
	
	@RequestMapping("")
	public String carrega(Model model) {
		model.addAttribute("casadeshow", new CasaDeShow());
		return "cadastrocasadeshow";
	}
	
	@RequestMapping("/salva")
	public String salva(@ModelAttribute CasaDeShow casaDeShow) {
		dao.salva(casaDeShow);
		return"redirect:/cadastrocasadeshow";
	}
	
//	@RequestMapping("/salva")
//	public String salva(@ModelAttribute CasaDeShow casaDeShow) {
//		if(casaDeShow.getId()==0) {
//		dao.salva(casaDeShow);
//		} else {
//			dao.altera(casaDeShow);
//		}
//		return"redirect:/cadastrocasadeshow";
//	}
	
}
