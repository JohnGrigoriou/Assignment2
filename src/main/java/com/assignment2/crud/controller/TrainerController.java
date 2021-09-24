package com.assignment2.crud.controller;

import com.assignment2.crud.entity.Trainer;
import com.assignment2.crud.service.TrainerServiceInterface;
import com.assignment2.crud.util.SortInterface;
import java.util.List;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/trainer")
public class TrainerController {

    @Autowired
    private TrainerServiceInterface trainerService;
    
    @InitBinder
    public void initBinder(WebDataBinder dataBinder) {
        StringTrimmerEditor ste = new StringTrimmerEditor(true);
        dataBinder.registerCustomEditor(String.class, ste);
    }
    
    @GetMapping("/list")
    public String showAllTrainers(@RequestParam(name = "sort", required = false) String sort, ModelMap modelMap) {
        List<Trainer> trainers = null;
        if (sort != null) {
            int sortField = Integer.parseInt(sort);
            trainers = trainerService.getAll(sortField);
        } else {
            trainers = trainerService.getAll(SortInterface.LAST_NAME);
        } 
        modelMap.addAttribute("trainers", trainers);
        return "list-trainers";
    }
    
    @GetMapping("/showFormForAdd")
    public String showFormForAdd(ModelMap modelMap) {
        Trainer trainer = new Trainer();
        modelMap.addAttribute("trainer", trainer);
        return "trainer-form";
    }
    
    @PostMapping("/save")
    public String saveTrainer(@Valid @ModelAttribute("trainer") Trainer trainer, BindingResult result) {
        if (result.hasErrors()) {
            return "trainer-form";
        } else {
            trainerService.save(trainer);
            return "redirect:/trainer/list";
        }
    }
    
    @GetMapping("/showFormForUpdate")
    public String showFormForUpdate(@RequestParam("id") int id, ModelMap modelMap) {
        Trainer trainer = trainerService.getById(id);
        if (trainer != null) {
            modelMap.addAttribute("trainer", trainer);
            return "trainer-form";
        }
        modelMap.addAttribute("id", id);
        return "not-found";
    }
    
    @GetMapping("/delete")
    public String deleteTrainer(@RequestParam("id") int id, ModelMap modelMap) {
        if (trainerService.getById(id) != null) {
            trainerService.delete(id);
            return "redirect:/trainer/list";
        }
        modelMap.addAttribute("id", id);
        return "not-found";
    }
    
    @GetMapping("/search")
    public String searchTrainers(@RequestParam(name = "searchName", required = false) String searchName, ModelMap modelMap) {
        List<Trainer> trainers = trainerService.searchTrainers(searchName);
        modelMap.addAttribute("trainers", trainers);
        return "list-trainers";
    }
    
}
