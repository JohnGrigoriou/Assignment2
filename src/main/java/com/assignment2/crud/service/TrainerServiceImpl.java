package com.assignment2.crud.service;

import com.assignment2.crud.entity.Trainer;
import com.assignment2.crud.repository.TrainerRepository;
import com.assignment2.crud.util.SortInterface;
import java.util.List;
import java.util.Optional;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

@Service
@Transactional
public class TrainerServiceImpl implements TrainerServiceInterface {

    @Autowired
    private TrainerRepository trainerRepository;
    
    @Override
    public Trainer getById(Integer id) {
        Optional<Trainer> result = trainerRepository.findById(id);
        Trainer trainer = null;
        if (result.isPresent()) {
            trainer = result.get();
        } else {
            return null;
        }
        return trainer;
    }

    @Override
    public List<Trainer> getAll(int sortField) {
        String fieldName = null;
        switch (sortField) {
            case SortInterface.FIRST_NAME:
                fieldName = "firstName";
                break;
            case SortInterface.LAST_NAME:
                fieldName = "lastName";
                break;
            case SortInterface.SUBJECT:
                fieldName = "subject";
                break;
            default:
                fieldName = "lastName";
        }
        return trainerRepository.findAll(Sort.by(Sort.Direction.ASC, fieldName));
    }

    @Override
    public void save(Trainer trainer) {
        trainerRepository.save(trainer);
    }

    @Override
    public void delete(Integer id) {
        trainerRepository.deleteById(id);
    }

    @Override
    public List<Trainer> searchTrainers(String searchName) {
        List<Trainer> trainers = null;
        System.out.println(searchName);
        if (searchName != null && searchName.trim().length() > 0) {
            trainers = trainerRepository.findByFirstNameStartingWithOrLastNameStartingWith(searchName, searchName);
        } else {
            trainers = trainerRepository.findAll();
        }     
        return trainers;
    }
   
}
