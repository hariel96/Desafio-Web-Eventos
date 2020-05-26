package br.com.qintess.comercio.controller;

import java.io.UnsupportedEncodingException;
import java.util.Base64;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.qintess.comercio.dao.Dao;
import br.com.qintess.comercio.model.CasaDeShow;
import br.com.qintess.comercio.model.Cliente;
import br.com.qintess.comercio.model.Evento;

@Controller
public class IndexController {

	@Autowired
	private Dao dao;
	
	@RequestMapping("/")
	public String index(Model model) {
		try {
			List<CasaDeShow> casasdeshow = dao.buscaTodos(CasaDeShow.class);
			model.addAttribute("casasdeshow", encodaImagemCasaDeShow(casasdeshow));
		} catch (UnsupportedEncodingException e) {
			model.addAttribute("mensagemErro", "Erro Grave: " + e.getMessage());
		}
		
		return "index";
	}
	
	private List<CasaDeShow> encodaImagemCasaDeShow(List<CasaDeShow> casasdeshow) throws UnsupportedEncodingException {
		
		for (CasaDeShow casadeshow : casasdeshow) {
			byte[] encodeBase64 = Base64.getEncoder().encode(casadeshow.getImagemCasaDeShow());
			casadeshow.setImagemEncoded(new String(encodeBase64, "UTF-8"));
		}
		return casasdeshow;
	}
	
	@RequestMapping("/compraingressos")
	public String compraingressos() {
		
		return "compraingressos";
	}
	
	@RequestMapping("/menu")
	public String menu() {
		return "menu";
	}
	
	@RequestMapping("/menuLateral")
	public String menuLateral() {
		return "menuLateral";
	}

}
