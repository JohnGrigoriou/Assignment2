package com.assignment2.crud.repository;

import com.assignment2.crud.entity.Trainer;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TrainerRepository extends JpaRepository<Trainer, Integer> {

    List<Trainer> findByFirstNameStartingWithOrLastNameStartingWith(String firstName, String lastName);
    
}
