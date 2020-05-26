package br.com.qintess.comercio.controller;


import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.com.qintess.comercio.dao.Dao;
import br.com.qintess.comercio.model.CasaDeShow;
import br.com.qintess.comercio.model.Cliente;
import br.com.qintess.comercio.model.Papel;


@Controller
@RequestMapping("/cadastrocliente")
public class ClienteController {

	@Autowired
	private Dao dao; 
	
	@RequestMapping("")
	public String carrega(Model model) {
		
		model.addAttribute("cliente", new Cliente());
		List<Cliente> clientes = dao.buscaTodos(Cliente.class);
		model.addAttribute("clientes", clientes);
		return "cadastrocliente";
	}
	
	
	@RequestMapping("/salva")
	public String salva(@ModelAttribute Cliente cliente, RedirectAttributes redirectAtt) {
		try {
		if(cliente.getId() == 0) {

			criaNovoCliente(cliente);
			redirectAtt.addFlashAttribute("mensagemSucesso", "Cliente cadastrado com sucesso!");
		} else {
			dao.altera(cliente);
			redirectAtt.addFlashAttribute("mensagemSucesso", "Cliente alterado com sucesso!");
		}
		}catch (Exception e) {
			redirectAtt.addFlashAttribute("mensagemErro", "Erro Grave: " + e.getMessage());
		}
		return"redirect:/cadastrocliente";
	}
	
	@RequestMapping("/deleta/{id}")
	public String deleta(@PathVariable(name = "id") Integer id, RedirectAttributes redirectAtt) {
		Cliente cliente = dao.buscaPorId(Cliente.class, id);
		dao.deleta(cliente);
		redirectAtt.addFlashAttribute("mensagemSucesso", "Cliente deletado com sucesso!");
		return "redirect:/cadastrocliente";
	}

	@RequestMapping("/altera/{id}")
	public String altera(@PathVariable(name = "id") Integer id, Model model, RedirectAttributes redirectAtt) {
		try {
		Cliente cliente = dao.buscaPorId(Cliente.class, id);
		
		model.addAttribute("clientes", dao.buscaTodos(Cliente.class));
		model.addAttribute("cliente", cliente);
		} catch (Exception e) {
			redirectAtt.addFlashAttribute("mensagemErro", "Erro grave: " + e.getMessage());
		}
		return "/cadastrocliente";
	}
	
	public void criaNovoCliente(Cliente cliente) {
		PasswordEncoder passEncoder = new BCryptPasswordEncoder();
		String hashedPass = passEncoder.encode(cliente.getSenha());
		cliente.setSenha(hashedPass);
		
		dao.salva(cliente);
		
		List<Papel> papeis = new ArrayList<Papel>();
		Papel papel = new Papel();
		
		papel.setNome("USER");
		if(cliente.getNome().equals("admin")) {
			papel.setNome("ADMIN");
		}
		
		papel.setCliente(cliente);
		papeis.add(papel);
		dao.salva(papel);		
	}
	
	
}
