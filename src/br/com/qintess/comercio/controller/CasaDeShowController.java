package br.com.qintess.comercio.controller;

import java.io.UnsupportedEncodingException;
import java.util.Base64;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	public String salva(@ModelAttribute CasaDeShow casaDeShow, RedirectAttributes redirectAtt,
			@RequestParam(required = false, value = "imagem") MultipartFile imagem ) {
		
		byte[] bImagem;
		
		try {
			
			if(imagem != null && imagem.getSize() > 0) {
				bImagem = imagem.getBytes();
				casaDeShow.setImagemCasaDeShow(bImagem);
			}
			
			if (casaDeShow.getId() == null) {

				dao.salva(casaDeShow);
				redirectAtt.addFlashAttribute("mensagemSucesso", "Casa de Show cadastrada com sucesso!");
				
			} else {
				dao.altera(casaDeShow);
				redirectAtt.addFlashAttribute("mensagemSucesso", "Casa de Show alterado com sucesso!");
			}
			
		} catch (Exception e) {
			redirectAtt.addFlashAttribute("mensagemErro","Erro grave:" + e.getMessage());
		}
		

		return "redirect:/cadastrocasadeshow";
	}

	@RequestMapping("/deleta/{id}")
	public String deleta(@PathVariable(name = "id") Integer id, RedirectAttributes redirectAtt) {
		CasaDeShow casaDeShow = dao.buscaPorId(CasaDeShow.class, id);
		dao.deleta(casaDeShow);
		redirectAtt.addFlashAttribute("mensagemSucesso", "Casa de Show deletada com sucesso!");
		return "redirect:/cadastrocasadeshow";
	}

	@RequestMapping("/altera/{id}")
	public String alterar(@PathVariable(name = "id") Integer id, Model model, RedirectAttributes redirectAtt) {
		try {
			CasaDeShow casaDeshow = dao.buscaPorId(CasaDeShow.class, id);
			byte[] encodeBase64 = Base64.getEncoder().encode(casaDeshow.getImagemCasaDeShow());
			String base64Enconded = new String(encodeBase64, "UTF-8");
			
			model.addAttribute("casasdeshow", dao.buscaTodos(CasaDeShow.class));
			model.addAttribute("casadeshow", casaDeshow);
			model.addAttribute("imagemCasaDeShow", base64Enconded);
			
		} catch (UnsupportedEncodingException e) {
			redirectAtt.addFlashAttribute("mensagemErro", "Erro grave: " + e.getMessage());
		}
		return "/cadastrocasadeshow";
	}

}
