package com.example.demo.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.demo.model.SavedList;
import com.example.demo.repository.SavedListInterface;


@Service
public class SavedListProcedureService {
SavedListInterface _savedlistpi;
public SavedListProcedureService(SavedListInterface savedlistpi) {
	this._savedlistpi=savedlistpi;
}

}
