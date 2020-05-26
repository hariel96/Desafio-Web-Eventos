package br.com.qintess.comercio.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.WebAuthenticationDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.com.qintess.comercio.dao.Dao;
import br.com.qintess.comercio.model.Cliente;
import br.com.qintess.comercio.model.Papel;

@Controller
public class LoginController {
	
	@Autowired
	private Dao dao;
	
	@Autowired
	private AuthenticationManager authenticationManager;
	
	@RequestMapping("/login")
	public String login(Model model) {
		return "login";
	}
	
	@RequestMapping("/carregaRegistro")
	public String carregaRegistro() {
		return"registro";
	}
	
	@RequestMapping("/registra")
	public String registra(@ModelAttribute Cliente cliente, RedirectAttributes redirectAtt, HttpServletRequest req) {
		String senhaOriginal = cliente.getSenha();
		try {
			dao.buscaTodos(Cliente.class)
				.stream()
				.filter(a -> a.getEmail().equals(cliente.getEmail()))
				.findFirst()
				.get();
			redirectAtt.addFlashAttribute("mensagemErro", "Usuário já cadastrado no sistema");
			return "redirect:/login";
		} catch (Exception e) {
		}
		
		criaNovoCliente(cliente);
		
		UsernamePasswordAuthenticationToken authToken = new UsernamePasswordAuthenticationToken(cliente.getEmail(), senhaOriginal);
		authToken.setDetails(new WebAuthenticationDetails(req));
		
		Authentication authentication = authenticationManager.authenticate(authToken);
		
		SecurityContextHolder.getContext().setAuthentication(authentication);
		
		return "redirect:/";
	}
	
	
	private void criaNovoCliente(Cliente cliente) {
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
