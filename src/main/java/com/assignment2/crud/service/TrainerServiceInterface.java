package com.assignment2.crud.service;

import com.assignment2.crud.entity.Trainer;
import java.util.List;

public interface TrainerServiceInterface {

    Trainer getById(Integer id);
       
    List<Trainer> getAll(int sortField);
    
    void save(Trainer trainer);
    
    void delete(Integer id);

    List<Trainer> searchTrainers(String searchName);
    
}
