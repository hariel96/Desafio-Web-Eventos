package br.com.qintess.comercio.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
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
		model.addAttribute("casasdeshow", dao.buscaTodos(CasaDeShow.class));
		model.addAttribute("casadeshow", new CasaDeShow());
		return "cadastrocasadeshow";
	}

	@RequestMapping("/salva")
	public String salva(@ModelAttribute CasaDeShow casaDeShow) {
		if (casaDeShow.getId() == null) {

			dao.salva(casaDeShow);
		} else {
			dao.altera(casaDeShow);
		}

		return "redirect:/cadastrocasadeshow";
	}

	@RequestMapping("/deleta/{id}")
	public String deleta(@PathVariable(name = "id") Integer id) {
		CasaDeShow casaDeShow = dao.buscaPorId(CasaDeShow.class, id);
		dao.deleta(casaDeShow);
		return "redirect:/cadastrocasadeshow";
	}

	@RequestMapping("/altera/{id}")
	public String alterar(@PathVariable(name = "id") Integer id, Model model) {
		model.addAttribute("casasdeshow", dao.buscaTodos(CasaDeShow.class));
		model.addAttribute("casadeshow", dao.buscaPorId(CasaDeShow.class, id));
		return "/cadastrocasadeshow";
	}

}
