package com.assignment2.crud.controller.api;

import com.assignment2.crud.entity.Trainer;
import com.assignment2.crud.service.TrainerServiceInterface;
import com.assignment2.crud.util.SortInterface;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")
public class TrainerRestController {

    @Autowired
    private TrainerServiceInterface trainerService;
    
    @GetMapping("/trainers")
    public List<Trainer> getAll(@RequestParam(name = "sort", required = false) String sort) {
        List<Trainer> trainers = null;
        if (sort != null) {
            int sortField = Integer.parseInt(sort);
            trainers = trainerService.getAll(sortField);
        } else {
            trainers = trainerService.getAll(SortInterface.LAST_NAME);
        }
        return trainers;
    }
    
    @GetMapping("/trainers/{id}")
    public Trainer getById(@PathVariable(name = "id") int id) {
        Trainer trainer = trainerService.getById(id);
        if (trainer == null) {
            throw new RuntimeException("Trainer id not found - " + id);
        }
        return trainer;
    }
    
    @PostMapping("/trainers")
    public Trainer addTrainer(@RequestBody Trainer trainer) {
        trainer.setId(0);
        trainerService.save(trainer);
        return trainer;
    }
    
    @PutMapping("/trainers")
    public Trainer updateTrainer(@RequestBody Trainer trainer) {
        trainerService.save(trainer);
        return trainer;
    }
    
    @DeleteMapping("/trainers/{id}")
    public String deleteTrainer(@PathVariable(name = "id") int id) {
        Trainer trainer = trainerService.getById(id);
        if (trainer == null) {
            throw new RuntimeException("Trainer id not found - " + id);    
        }
        trainerService.delete(id);
        return "Deleted trainer id - " + id;
    }
    
}
