package com.sysadv.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sysadv.model.Departamento;
import com.sysadv.service.DepartamentoService;

@Controller
public class DepartamentoController {

	@Autowired
	private DepartamentoService departamentoRepository;

	// Vai para tela de adição do departamento
	@GetMapping("/departamentos/add")
	public String insereForm(Model model) {
		model.addAttribute("departamento", new Departamento());
		model.addAttribute("acao", "/departamentos");
		return "inserir-departamento";
	}

	@PostMapping("/departamentos")
	public String addDepartamento(@Valid Departamento departamento, BindingResult result, Model model,
			RedirectAttributes redirect) {
		if (result.hasErrors()) {
			model.addAttribute("departamento", departamento);
			model.addAttribute("acao", "/departamentos");
			if (departamento.getIdMongo() == null) {
				return "inserir-departamento";
			}else{
				return "editar-departamento";
			}
		}

		if (departamento.getIdMongo() == null) {
			departamentoRepository.save(departamento);
			redirect.addFlashAttribute("mensagem", "Departamento cadastrado com sucesso!");
		}

		return "redirect:/departamentos";
	}

	@RequestMapping("/departamentos")
	public String viewContatos(Model model) {
		List<Departamento> lista = departamentoRepository.getLista();
		model.addAttribute("departamentos", lista);
		return "lista-departamentos";
	}

	// Deletar contato
	@GetMapping("/departamentos/{id}/delete")
	public String deleteContato(@PathVariable String id, RedirectAttributes redirect) {
		departamentoRepository.remove(id);
		redirect.addFlashAttribute("mensagem", "Departamento removido com sucesso!");
		return "redirect:/departamentos";
	}

	@RequestMapping("/qtdDepartamentos")
	public @ResponseBody Long qtdContatos() {
		return departamentoRepository.count();
	}
}
