package br.com.qintess.comercio.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.com.qintess.comercio.dao.Dao;
import br.com.qintess.comercio.model.CasaDeShow;
import br.com.qintess.comercio.model.Cliente;
import br.com.qintess.comercio.model.Evento;

@Controller
@RequestMapping("/cadastroeventos")
public class EventoController {

	@Autowired
	private Dao dao;

	@RequestMapping("")
	public String carrega(Model model) {
		model.addAttribute("eventos", dao.buscaTodos(Evento.class));
		model.addAttribute("evento", new Evento());
		return "cadastroeventos";
	}

	@RequestMapping("/salva")
	public String salva(@ModelAttribute Evento evento, RedirectAttributes redirectAtt, Integer id) {

		try {
			CasaDeShow casaDeShow = dao.buscaPorId(CasaDeShow.class, id);
			System.out.println(casaDeShow);
			if (evento.getId() == 0) {
				evento.setCasaDeshow(casaDeShow);
				dao.salva(evento);
		
				redirectAtt.addFlashAttribute("mensagemSucesso", "Evento cadastrado com Sucesso!");
			} else {
				dao.altera(evento);
				redirectAtt.addFlashAttribute("mensagemSucesso", "Evento alterado com Sucesso!");
			}
		} catch (Exception e) {
			System.out.println(e);
			redirectAtt.addFlashAttribute("mensagemErro", "Erro grave:" + e.getMessage());
		}
		return "redirect:/cadastroeventos";

	}

	@RequestMapping("/busca")
	public String busca(@ModelAttribute Evento evento, Integer id) {
		dao.buscaPorId(Evento.class, id);
		return "redirect:/cadastroeventos";

	}

}
