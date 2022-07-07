package com.eshop.dao;

import java.util.List;

import com.eshop.dto.DatabankDTO;

public interface FileDAO {
	public void databankInsert(DatabankDTO databank) throws Exception;
	
	public List<DatabankDTO> databankList() throws Exception;

}
