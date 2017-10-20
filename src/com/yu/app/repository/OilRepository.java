package com.yu.app.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.yu.app.entity.Oil;

public interface OilRepository extends JpaRepository<Oil, Integer> {
	
	
	//@Query("from Oil o order by o.id desc")
	//public List<Oil> findAlldescByQuery();
	

}
