package com.eshop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eshop.dao.FileDAO;
import com.eshop.dto.DatabankDTO;

@Service
public class FileServiceImpl implements FileService {

	@Autowired
	FileDAO fileDao;

	@Override
	public void databankInsert(DatabankDTO databank) throws Exception {
		fileDao.databankInsert(databank);
		
	}

	@Override
	public List<DatabankDTO> databankList() throws Exception {
		return fileDao.databankList();
	}
	
	
}
